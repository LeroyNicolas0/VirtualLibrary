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
import jpa.entities.TypeDocument;
import jpa.session.TypeDocumentFacade;
import jsf.util.JsfUtil;
import jsf.util.PagingInfo;

/**
 *
 * @author Francis
 */
public class TypeDocumentController {

    public TypeDocumentController() {
        pagingInfo = new PagingInfo();
        converter = new TypeDocumentConverter();
    }
    private TypeDocument typeDocument = null;
    private List<TypeDocument> typeDocumentItems = null;
    private TypeDocumentFacade jpaController = null;
    private TypeDocumentConverter converter = null;
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

    public TypeDocumentFacade getJpaController() {
        if (jpaController == null) {
            FacesContext facesContext = FacesContext.getCurrentInstance();
            jpaController = (TypeDocumentFacade) facesContext.getApplication().getELResolver().getValue(facesContext.getELContext(), null, "typeDocumentJpa");
        }
        return jpaController;
    }

    public SelectItem[] getTypeDocumentItemsAvailableSelectMany() {
        return JsfUtil.getSelectItems(getJpaController().findAll(), false);
    }

    public SelectItem[] getTypeDocumentItemsAvailableSelectOne() {
        return JsfUtil.getSelectItems(getJpaController().findAll(), true);
    }

    public TypeDocument getTypeDocument() {
        if (typeDocument == null) {
            typeDocument = (TypeDocument) JsfUtil.getObjectFromRequestParameter("jsfcrud.currentTypeDocument", converter, null);
        }
        if (typeDocument == null) {
            typeDocument = new TypeDocument();
        }
        return typeDocument;
    }

    public String listSetup() {
        reset(true);
        return "typeDocument_list";
    }

    public String createSetup() {
        reset(false);
        typeDocument = new TypeDocument();
        return "typeDocument_create";
    }

    public String create() {
        try {
            utx.begin();
        } catch (Exception ex) {
        }
        try {
            Exception transactionException = null;
            getJpaController().create(typeDocument);
            try {
                utx.commit();
            } catch (javax.transaction.RollbackException ex) {
                transactionException = ex;
            } catch (Exception ex) {
            }
            if (transactionException == null) {
                JsfUtil.addSuccessMessage("TypeDocument was successfully created.");
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
        return scalarSetup("typeDocument_detail");
    }

    public String editSetup() {
        return scalarSetup("typeDocument_edit");
    }

    private String scalarSetup(String destination) {
        reset(false);
        typeDocument = (TypeDocument) JsfUtil.getObjectFromRequestParameter("jsfcrud.currentTypeDocument", converter, null);
        if (typeDocument == null) {
            String requestTypeDocumentString = JsfUtil.getRequestParameter("jsfcrud.currentTypeDocument");
            JsfUtil.addErrorMessage("The typeDocument with id " + requestTypeDocumentString + " no longer exists.");
            return relatedOrListOutcome();
        }
        return destination;
    }

    public String edit() {
        String typeDocumentString = converter.getAsString(FacesContext.getCurrentInstance(), null, typeDocument);
        String currentTypeDocumentString = JsfUtil.getRequestParameter("jsfcrud.currentTypeDocument");
        if (typeDocumentString == null || typeDocumentString.length() == 0 || !typeDocumentString.equals(currentTypeDocumentString)) {
            String outcome = editSetup();
            if ("typeDocument_edit".equals(outcome)) {
                JsfUtil.addErrorMessage("Could not edit typeDocument. Try again.");
            }
            return outcome;
        }
        try {
            utx.begin();
        } catch (Exception ex) {
        }
        try {
            Exception transactionException = null;
            getJpaController().edit(typeDocument);
            try {
                utx.commit();
            } catch (javax.transaction.RollbackException ex) {
                transactionException = ex;
            } catch (Exception ex) {
            }
            if (transactionException == null) {
                JsfUtil.addSuccessMessage("TypeDocument was successfully updated.");
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
        String idAsString = JsfUtil.getRequestParameter("jsfcrud.currentTypeDocument");
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
                JsfUtil.addSuccessMessage("TypeDocument was successfully deleted.");
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

    public List<TypeDocument> getTypeDocumentItems() {
        if (typeDocumentItems == null) {
            getPagingInfo();
            typeDocumentItems = getJpaController().findRange(new int[]{pagingInfo.getFirstItem(), pagingInfo.getFirstItem() + pagingInfo.getBatchSize()});
        }
        return typeDocumentItems;
    }

    public String next() {
        reset(false);
        getPagingInfo().nextPage();
        return "typeDocument_list";
    }

    public String prev() {
        reset(false);
        getPagingInfo().previousPage();
        return "typeDocument_list";
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
        typeDocument = null;
        typeDocumentItems = null;
        pagingInfo.setItemCount(-1);
        if (resetFirstItem) {
            pagingInfo.setFirstItem(0);
        }
    }

    public void validateCreate(FacesContext facesContext, UIComponent component, Object value) {
        TypeDocument newTypeDocument = new TypeDocument();
        String newTypeDocumentString = converter.getAsString(FacesContext.getCurrentInstance(), null, newTypeDocument);
        String typeDocumentString = converter.getAsString(FacesContext.getCurrentInstance(), null, typeDocument);
        if (!newTypeDocumentString.equals(typeDocumentString)) {
            createSetup();
        }
    }

    public Converter getConverter() {
        return converter;
    }
    
}
