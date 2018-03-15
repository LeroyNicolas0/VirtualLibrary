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
import jpa.entities.MotCle;
import jpa.session.MotCleFacade;
import jsf.util.JsfUtil;
import jsf.util.PagingInfo;

/**
 *
 * @author Francis
 */
public class MotCleController {

    public MotCleController() {
        pagingInfo = new PagingInfo();
        converter = new MotCleConverter();
    }
    private MotCle motCle = null;
    private List<MotCle> motCleItems = null;
    private MotCleFacade jpaController = null;
    private MotCleConverter converter = null;
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

    public MotCleFacade getJpaController() {
        if (jpaController == null) {
            FacesContext facesContext = FacesContext.getCurrentInstance();
            jpaController = (MotCleFacade) facesContext.getApplication().getELResolver().getValue(facesContext.getELContext(), null, "motCleJpa");
        }
        return jpaController;
    }

    public SelectItem[] getMotCleItemsAvailableSelectMany() {
        return JsfUtil.getSelectItems(getJpaController().findAll(), false);
    }

    public SelectItem[] getMotCleItemsAvailableSelectOne() {
        return JsfUtil.getSelectItems(getJpaController().findAll(), true);
    }

    public MotCle getMotCle() {
        if (motCle == null) {
            motCle = (MotCle) JsfUtil.getObjectFromRequestParameter("jsfcrud.currentMotCle", converter, null);
        }
        if (motCle == null) {
            motCle = new MotCle();
        }
        return motCle;
    }

    public String listSetup() {
        reset(true);
        return "motCle_list";
    }

    public String createSetup() {
        reset(false);
        motCle = new MotCle();
        return "motCle_create";
    }

    public String create() {
        try {
            utx.begin();
        } catch (Exception ex) {
        }
        try {
            Exception transactionException = null;
            getJpaController().create(motCle);
            try {
                utx.commit();
            } catch (javax.transaction.RollbackException ex) {
                transactionException = ex;
            } catch (Exception ex) {
            }
            if (transactionException == null) {
                JsfUtil.addSuccessMessage("MotCle was successfully created.");
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
        return scalarSetup("motCle_detail");
    }

    public String editSetup() {
        return scalarSetup("motCle_edit");
    }

    private String scalarSetup(String destination) {
        reset(false);
        motCle = (MotCle) JsfUtil.getObjectFromRequestParameter("jsfcrud.currentMotCle", converter, null);
        if (motCle == null) {
            String requestMotCleString = JsfUtil.getRequestParameter("jsfcrud.currentMotCle");
            JsfUtil.addErrorMessage("The motCle with id " + requestMotCleString + " no longer exists.");
            return relatedOrListOutcome();
        }
        return destination;
    }

    public String edit() {
        String motCleString = converter.getAsString(FacesContext.getCurrentInstance(), null, motCle);
        String currentMotCleString = JsfUtil.getRequestParameter("jsfcrud.currentMotCle");
        if (motCleString == null || motCleString.length() == 0 || !motCleString.equals(currentMotCleString)) {
            String outcome = editSetup();
            if ("motCle_edit".equals(outcome)) {
                JsfUtil.addErrorMessage("Could not edit motCle. Try again.");
            }
            return outcome;
        }
        try {
            utx.begin();
        } catch (Exception ex) {
        }
        try {
            Exception transactionException = null;
            getJpaController().edit(motCle);
            try {
                utx.commit();
            } catch (javax.transaction.RollbackException ex) {
                transactionException = ex;
            } catch (Exception ex) {
            }
            if (transactionException == null) {
                JsfUtil.addSuccessMessage("MotCle was successfully updated.");
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
        String idAsString = JsfUtil.getRequestParameter("jsfcrud.currentMotCle");
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
                JsfUtil.addSuccessMessage("MotCle was successfully deleted.");
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

    public List<MotCle> getMotCleItems() {
        if (motCleItems == null) {
            getPagingInfo();
            motCleItems = getJpaController().findRange(new int[]{pagingInfo.getFirstItem(), pagingInfo.getFirstItem() + pagingInfo.getBatchSize()});
        }
        return motCleItems;
    }

    public String next() {
        reset(false);
        getPagingInfo().nextPage();
        return "motCle_list";
    }

    public String prev() {
        reset(false);
        getPagingInfo().previousPage();
        return "motCle_list";
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
        motCle = null;
        motCleItems = null;
        pagingInfo.setItemCount(-1);
        if (resetFirstItem) {
            pagingInfo.setFirstItem(0);
        }
    }

    public void validateCreate(FacesContext facesContext, UIComponent component, Object value) {
        MotCle newMotCle = new MotCle();
        String newMotCleString = converter.getAsString(FacesContext.getCurrentInstance(), null, newMotCle);
        String motCleString = converter.getAsString(FacesContext.getCurrentInstance(), null, motCle);
        if (!newMotCleString.equals(motCleString)) {
            createSetup();
        }
    }

    public Converter getConverter() {
        return converter;
    }
    
}
