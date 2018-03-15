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
import jpa.entities.PaysInterdit;
import jpa.session.PaysInterditFacade;
import jsf.util.JsfUtil;
import jsf.util.PagingInfo;

/**
 *
 * @author Francis
 */
public class PaysInterditController {

    public PaysInterditController() {
        pagingInfo = new PagingInfo();
        converter = new PaysInterditConverter();
    }
    private PaysInterdit paysInterdit = null;
    private List<PaysInterdit> paysInterditItems = null;
    private PaysInterditFacade jpaController = null;
    private PaysInterditConverter converter = null;
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

    public PaysInterditFacade getJpaController() {
        if (jpaController == null) {
            FacesContext facesContext = FacesContext.getCurrentInstance();
            jpaController = (PaysInterditFacade) facesContext.getApplication().getELResolver().getValue(facesContext.getELContext(), null, "paysInterditJpa");
        }
        return jpaController;
    }

    public SelectItem[] getPaysInterditItemsAvailableSelectMany() {
        return JsfUtil.getSelectItems(getJpaController().findAll(), false);
    }

    public SelectItem[] getPaysInterditItemsAvailableSelectOne() {
        return JsfUtil.getSelectItems(getJpaController().findAll(), true);
    }

    public PaysInterdit getPaysInterdit() {
        if (paysInterdit == null) {
            paysInterdit = (PaysInterdit) JsfUtil.getObjectFromRequestParameter("jsfcrud.currentPaysInterdit", converter, null);
        }
        if (paysInterdit == null) {
            paysInterdit = new PaysInterdit();
        }
        return paysInterdit;
    }

    public String listSetup() {
        reset(true);
        return "paysInterdit_list";
    }

    public String createSetup() {
        reset(false);
        paysInterdit = new PaysInterdit();
        return "paysInterdit_create";
    }

    public String create() {
        try {
            utx.begin();
        } catch (Exception ex) {
        }
        try {
            Exception transactionException = null;
            getJpaController().create(paysInterdit);
            try {
                utx.commit();
            } catch (javax.transaction.RollbackException ex) {
                transactionException = ex;
            } catch (Exception ex) {
            }
            if (transactionException == null) {
                JsfUtil.addSuccessMessage("PaysInterdit was successfully created.");
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
        return scalarSetup("paysInterdit_detail");
    }

    public String editSetup() {
        return scalarSetup("paysInterdit_edit");
    }

    private String scalarSetup(String destination) {
        reset(false);
        paysInterdit = (PaysInterdit) JsfUtil.getObjectFromRequestParameter("jsfcrud.currentPaysInterdit", converter, null);
        if (paysInterdit == null) {
            String requestPaysInterditString = JsfUtil.getRequestParameter("jsfcrud.currentPaysInterdit");
            JsfUtil.addErrorMessage("The paysInterdit with id " + requestPaysInterditString + " no longer exists.");
            return relatedOrListOutcome();
        }
        return destination;
    }

    public String edit() {
        String paysInterditString = converter.getAsString(FacesContext.getCurrentInstance(), null, paysInterdit);
        String currentPaysInterditString = JsfUtil.getRequestParameter("jsfcrud.currentPaysInterdit");
        if (paysInterditString == null || paysInterditString.length() == 0 || !paysInterditString.equals(currentPaysInterditString)) {
            String outcome = editSetup();
            if ("paysInterdit_edit".equals(outcome)) {
                JsfUtil.addErrorMessage("Could not edit paysInterdit. Try again.");
            }
            return outcome;
        }
        try {
            utx.begin();
        } catch (Exception ex) {
        }
        try {
            Exception transactionException = null;
            getJpaController().edit(paysInterdit);
            try {
                utx.commit();
            } catch (javax.transaction.RollbackException ex) {
                transactionException = ex;
            } catch (Exception ex) {
            }
            if (transactionException == null) {
                JsfUtil.addSuccessMessage("PaysInterdit was successfully updated.");
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
        String idAsString = JsfUtil.getRequestParameter("jsfcrud.currentPaysInterdit");
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
                JsfUtil.addSuccessMessage("PaysInterdit was successfully deleted.");
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

    public List<PaysInterdit> getPaysInterditItems() {
        if (paysInterditItems == null) {
            getPagingInfo();
            paysInterditItems = getJpaController().findRange(new int[]{pagingInfo.getFirstItem(), pagingInfo.getFirstItem() + pagingInfo.getBatchSize()});
        }
        return paysInterditItems;
    }

    public String next() {
        reset(false);
        getPagingInfo().nextPage();
        return "paysInterdit_list";
    }

    public String prev() {
        reset(false);
        getPagingInfo().previousPage();
        return "paysInterdit_list";
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
        paysInterdit = null;
        paysInterditItems = null;
        pagingInfo.setItemCount(-1);
        if (resetFirstItem) {
            pagingInfo.setFirstItem(0);
        }
    }

    public void validateCreate(FacesContext facesContext, UIComponent component, Object value) {
        PaysInterdit newPaysInterdit = new PaysInterdit();
        String newPaysInterditString = converter.getAsString(FacesContext.getCurrentInstance(), null, newPaysInterdit);
        String paysInterditString = converter.getAsString(FacesContext.getCurrentInstance(), null, paysInterdit);
        if (!newPaysInterditString.equals(paysInterditString)) {
            createSetup();
        }
    }

    public Converter getConverter() {
        return converter;
    }
    
}
