/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package jsf;

import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.util.List;
import javax.faces.FacesException;
import javax.annotation.Resource;
import javax.faces.component.UIComponent;
import javax.faces.context.FacesContext;
import javax.faces.convert.Converter;
import javax.faces.model.SelectItem;
import javax.persistence.EntityManagerFactory;
import javax.persistence.PersistenceUnit;
import javax.transaction.UserTransaction;
import jpa.entities.Document;
import jpa.session.DocumentFacade;
import jsf.util.JsfUtil;
import jsf.util.PagingInfo;

/**
 *
 * @author Francis
 */
public class DocumentController {

    public DocumentController() {
        pagingInfo = new PagingInfo();
        converter = new DocumentConverter();
    }
    private Document document = null;
    private List<Document> documentItems = null;
    private DocumentFacade jpaController = null;
    private DocumentConverter converter = null;
    private PagingInfo pagingInfo = null;
    @Resource
    private UserTransaction utx = null;
    @PersistenceUnit(unitName = "VirtualLibraryWebPU")
    private EntityManagerFactory emf = null;

    public PagingInfo getPagingInfo() {
        if (pagingInfo.getItemCount() == -1) {
            pagingInfo.setItemCount(getJpaController().count());
        }
        return pagingInfo;
    }

    public DocumentFacade getJpaController() {
        if (jpaController == null) {
            FacesContext facesContext = FacesContext.getCurrentInstance();
            jpaController = (DocumentFacade) facesContext.getApplication().getELResolver().getValue(facesContext.getELContext(), null, "documentJpa");
        }
        return jpaController;
    }

    public SelectItem[] getDocumentItemsAvailableSelectMany() {
        return JsfUtil.getSelectItems(getJpaController().findAll(), false);
    }

    public SelectItem[] getDocumentItemsAvailableSelectOne() {
        return JsfUtil.getSelectItems(getJpaController().findAll(), true);
    }

    public Document getDocument() {
        if (document == null) {
            document = (Document) JsfUtil.getObjectFromRequestParameter("jsfcrud.currentDocument", converter, null);
        }
        if (document == null) {
            document = new Document();
        }
        return document;
    }

    public String listSetup() {
        reset(true);
        return "document_list";
    }

    public String createSetup() {
        reset(false);
        document = new Document();
        return "document_create";
    }

    public String create() {
        try {
            utx.begin();
        } catch (Exception ex) {
        }
        try {
            Exception transactionException = null;
            getJpaController().create(document);
            try {
                utx.commit();
            } catch (javax.transaction.RollbackException ex) {
                transactionException = ex;
            } catch (Exception ex) {
            }
            if (transactionException == null) {
                JsfUtil.addSuccessMessage("Document was successfully created.");
            } else {
                JsfUtil.ensureAddErrorMessage(transactionException, "A persistence error occurred.");
            }
        } catch (Exception e) {
            try {
                utx.rollback();
            } catch (Exception ex) {
            }
            JsfUtil.ensureAddErrorMessage(e, "A persistence error occurred.");
            return null;
        }
        return listSetup();
    }

    public String detailSetup() {
        return scalarSetup("document_detail");
    }

    public String editSetup() {
        return scalarSetup("document_edit");
    }

    private String scalarSetup(String destination) {
        reset(false);
        document = (Document) JsfUtil.getObjectFromRequestParameter("jsfcrud.currentDocument", converter, null);
        if (document == null) {
            String requestDocumentString = JsfUtil.getRequestParameter("jsfcrud.currentDocument");
            JsfUtil.addErrorMessage("The document with id " + requestDocumentString + " no longer exists.");
            return relatedOrListOutcome();
        }
        return destination;
    }

    public String edit() {
        String documentString = converter.getAsString(FacesContext.getCurrentInstance(), null, document);
        String currentDocumentString = JsfUtil.getRequestParameter("jsfcrud.currentDocument");
        if (documentString == null || documentString.length() == 0 || !documentString.equals(currentDocumentString)) {
            String outcome = editSetup();
            if ("document_edit".equals(outcome)) {
                JsfUtil.addErrorMessage("Could not edit document. Try again.");
            }
            return outcome;
        }
        try {
            utx.begin();
        } catch (Exception ex) {
        }
        try {
            Exception transactionException = null;
            getJpaController().edit(document);
            try {
                utx.commit();
            } catch (javax.transaction.RollbackException ex) {
                transactionException = ex;
            } catch (Exception ex) {
            }
            if (transactionException == null) {
                JsfUtil.addSuccessMessage("Document was successfully updated.");
            } else {
                JsfUtil.ensureAddErrorMessage(transactionException, "A persistence error occurred.");
            }
        } catch (Exception e) {
            try {
                utx.rollback();
            } catch (Exception ex) {
            }
            JsfUtil.ensureAddErrorMessage(e, "A persistence error occurred.");
            return null;
        }
        return detailSetup();
    }

    public String remove() {
        String idAsString = JsfUtil.getRequestParameter("jsfcrud.currentDocument");
        Integer id = new Integer(idAsString);
        try {
            utx.begin();
        } catch (Exception ex) {
        }
        try {
            Exception transactionException = null;
            getJpaController().remove(getJpaController().find(id));
            try {
                utx.commit();
            } catch (javax.transaction.RollbackException ex) {
                transactionException = ex;
            } catch (Exception ex) {
            }
            if (transactionException == null) {
                JsfUtil.addSuccessMessage("Document was successfully deleted.");
            } else {
                JsfUtil.ensureAddErrorMessage(transactionException, "A persistence error occurred.");
            }
        } catch (Exception e) {
            try {
                utx.rollback();
            } catch (Exception ex) {
            }
            JsfUtil.ensureAddErrorMessage(e, "A persistence error occurred.");
            return null;
        }
        return relatedOrListOutcome();
    }

    private String relatedOrListOutcome() {
        String relatedControllerOutcome = relatedControllerOutcome();
        if ((relatedControllerOutcome != null)) {
            return relatedControllerOutcome;
        }
        return listSetup();
    }

    public List<Document> getDocumentItems() {
        if (documentItems == null) {
            getPagingInfo();
            documentItems = getJpaController().findRange(new int[]{pagingInfo.getFirstItem(), pagingInfo.getFirstItem() + pagingInfo.getBatchSize()});
        }
        return documentItems;
    }

    public String next() {
        reset(false);
        getPagingInfo().nextPage();
        return "document_list";
    }

    public String prev() {
        reset(false);
        getPagingInfo().previousPage();
        return "document_list";
    }

    private String relatedControllerOutcome() {
        String relatedControllerString = JsfUtil.getRequestParameter("jsfcrud.relatedController");
        String relatedControllerTypeString = JsfUtil.getRequestParameter("jsfcrud.relatedControllerType");
        if (relatedControllerString != null && relatedControllerTypeString != null) {
            FacesContext context = FacesContext.getCurrentInstance();
            Object relatedController = context.getApplication().getELResolver().getValue(context.getELContext(), null, relatedControllerString);
            try {
                Class<?> relatedControllerType = Class.forName(relatedControllerTypeString);
                Method detailSetupMethod = relatedControllerType.getMethod("detailSetup");
                return (String) detailSetupMethod.invoke(relatedController);
            } catch (ClassNotFoundException e) {
                throw new FacesException(e);
            } catch (NoSuchMethodException e) {
                throw new FacesException(e);
            } catch (IllegalAccessException e) {
                throw new FacesException(e);
            } catch (InvocationTargetException e) {
                throw new FacesException(e);
            }
        }
        return null;
    }

    private void reset(boolean resetFirstItem) {
        document = null;
        documentItems = null;
        pagingInfo.setItemCount(-1);
        if (resetFirstItem) {
            pagingInfo.setFirstItem(0);
        }
    }

    public void validateCreate(FacesContext facesContext, UIComponent component, Object value) {
        Document newDocument = new Document();
        String newDocumentString = converter.getAsString(FacesContext.getCurrentInstance(), null, newDocument);
        String documentString = converter.getAsString(FacesContext.getCurrentInstance(), null, document);
        if (!newDocumentString.equals(documentString)) {
            createSetup();
        }
    }

    public Converter getConverter() {
        return converter;
    }
    
}
