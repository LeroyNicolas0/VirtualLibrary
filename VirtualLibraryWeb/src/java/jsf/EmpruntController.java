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
import jpa.entities.Emprunt;
import jpa.session.EmpruntFacade;
import jsf.util.JsfUtil;
import jsf.util.PagingInfo;

/**
 *
 * @author Francis
 */
public class EmpruntController {

    public EmpruntController() {
        pagingInfo = new PagingInfo();
        converter = new EmpruntConverter();
    }
    private Emprunt emprunt = null;
    private List<Emprunt> empruntItems = null;
    private EmpruntFacade jpaController = null;
    private EmpruntConverter converter = null;
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

    public EmpruntFacade getJpaController() {
        if (jpaController == null) {
            FacesContext facesContext = FacesContext.getCurrentInstance();
            jpaController = (EmpruntFacade) facesContext.getApplication().getELResolver().getValue(facesContext.getELContext(), null, "empruntJpa");
        }
        return jpaController;
    }

    public SelectItem[] getEmpruntItemsAvailableSelectMany() {
        return JsfUtil.getSelectItems(getJpaController().findAll(), false);
    }

    public SelectItem[] getEmpruntItemsAvailableSelectOne() {
        return JsfUtil.getSelectItems(getJpaController().findAll(), true);
    }

    public Emprunt getEmprunt() {
        if (emprunt == null) {
            emprunt = (Emprunt) JsfUtil.getObjectFromRequestParameter("jsfcrud.currentEmprunt", converter, null);
        }
        if (emprunt == null) {
            emprunt = new Emprunt();
        }
        return emprunt;
    }

    public String listSetup() {
        reset(true);
        return "emprunt_list";
    }

    public String createSetup() {
        reset(false);
        emprunt = new Emprunt();
        return "emprunt_create";
    }

    public String create() {
        try {
            utx.begin();
        } catch (Exception ex) {
        }
        try {
            Exception transactionException = null;
            getJpaController().create(emprunt);
            try {
                utx.commit();
            } catch (javax.transaction.RollbackException ex) {
                transactionException = ex;
            } catch (Exception ex) {
            }
            if (transactionException == null) {
                JsfUtil.addSuccessMessage("Emprunt was successfully created.");
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
        return scalarSetup("emprunt_detail");
    }

    public String editSetup() {
        return scalarSetup("emprunt_edit");
    }

    private String scalarSetup(String destination) {
        reset(false);
        emprunt = (Emprunt) JsfUtil.getObjectFromRequestParameter("jsfcrud.currentEmprunt", converter, null);
        if (emprunt == null) {
            String requestEmpruntString = JsfUtil.getRequestParameter("jsfcrud.currentEmprunt");
            JsfUtil.addErrorMessage("The emprunt with id " + requestEmpruntString + " no longer exists.");
            return relatedOrListOutcome();
        }
        return destination;
    }

    public String edit() {
        String empruntString = converter.getAsString(FacesContext.getCurrentInstance(), null, emprunt);
        String currentEmpruntString = JsfUtil.getRequestParameter("jsfcrud.currentEmprunt");
        if (empruntString == null || empruntString.length() == 0 || !empruntString.equals(currentEmpruntString)) {
            String outcome = editSetup();
            if ("emprunt_edit".equals(outcome)) {
                JsfUtil.addErrorMessage("Could not edit emprunt. Try again.");
            }
            return outcome;
        }
        try {
            utx.begin();
        } catch (Exception ex) {
        }
        try {
            Exception transactionException = null;
            getJpaController().edit(emprunt);
            try {
                utx.commit();
            } catch (javax.transaction.RollbackException ex) {
                transactionException = ex;
            } catch (Exception ex) {
            }
            if (transactionException == null) {
                JsfUtil.addSuccessMessage("Emprunt was successfully updated.");
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
        String idAsString = JsfUtil.getRequestParameter("jsfcrud.currentEmprunt");
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
                JsfUtil.addSuccessMessage("Emprunt was successfully deleted.");
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

    public List<Emprunt> getEmpruntItems() {
        if (empruntItems == null) {
            getPagingInfo();
            empruntItems = getJpaController().findRange(new int[]{pagingInfo.getFirstItem(), pagingInfo.getFirstItem() + pagingInfo.getBatchSize()});
        }
        return empruntItems;
    }

    public String next() {
        reset(false);
        getPagingInfo().nextPage();
        return "emprunt_list";
    }

    public String prev() {
        reset(false);
        getPagingInfo().previousPage();
        return "emprunt_list";
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
        emprunt = null;
        empruntItems = null;
        pagingInfo.setItemCount(-1);
        if (resetFirstItem) {
            pagingInfo.setFirstItem(0);
        }
    }

    public void validateCreate(FacesContext facesContext, UIComponent component, Object value) {
        Emprunt newEmprunt = new Emprunt();
        String newEmpruntString = converter.getAsString(FacesContext.getCurrentInstance(), null, newEmprunt);
        String empruntString = converter.getAsString(FacesContext.getCurrentInstance(), null, emprunt);
        if (!newEmpruntString.equals(empruntString)) {
            createSetup();
        }
    }

    public Converter getConverter() {
        return converter;
    }
    
}
