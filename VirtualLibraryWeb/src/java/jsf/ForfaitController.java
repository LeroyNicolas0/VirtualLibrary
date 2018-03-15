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
import jpa.entities.Forfait;
import jpa.session.ForfaitFacade;
import jsf.util.JsfUtil;
import jsf.util.PagingInfo;

/**
 *
 * @author Francis
 */
public class ForfaitController {

    public ForfaitController() {
        pagingInfo = new PagingInfo();
        converter = new ForfaitConverter();
    }
    private Forfait forfait = null;
    private List<Forfait> forfaitItems = null;
    private ForfaitFacade jpaController = null;
    private ForfaitConverter converter = null;
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

    public ForfaitFacade getJpaController() {
        if (jpaController == null) {
            FacesContext facesContext = FacesContext.getCurrentInstance();
            jpaController = (ForfaitFacade) facesContext.getApplication().getELResolver().getValue(facesContext.getELContext(), null, "forfaitJpa");
        }
        return jpaController;
    }

    public SelectItem[] getForfaitItemsAvailableSelectMany() {
        return JsfUtil.getSelectItems(getJpaController().findAll(), false);
    }

    public SelectItem[] getForfaitItemsAvailableSelectOne() {
        return JsfUtil.getSelectItems(getJpaController().findAll(), true);
    }

    public Forfait getForfait() {
        if (forfait == null) {
            forfait = (Forfait) JsfUtil.getObjectFromRequestParameter("jsfcrud.currentForfait", converter, null);
        }
        if (forfait == null) {
            forfait = new Forfait();
        }
        return forfait;
    }

    public String listSetup() {
        reset(true);
        return "forfait_list";
    }

    public String createSetup() {
        reset(false);
        forfait = new Forfait();
        return "forfait_create";
    }

    public String create() {
        try {
            utx.begin();
        } catch (Exception ex) {
        }
        try {
            Exception transactionException = null;
            getJpaController().create(forfait);
            try {
                utx.commit();
            } catch (javax.transaction.RollbackException ex) {
                transactionException = ex;
            } catch (Exception ex) {
            }
            if (transactionException == null) {
                JsfUtil.addSuccessMessage("Forfait was successfully created.");
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
        return scalarSetup("forfait_detail");
    }

    public String editSetup() {
        return scalarSetup("forfait_edit");
    }

    private String scalarSetup(String destination) {
        reset(false);
        forfait = (Forfait) JsfUtil.getObjectFromRequestParameter("jsfcrud.currentForfait", converter, null);
        if (forfait == null) {
            String requestForfaitString = JsfUtil.getRequestParameter("jsfcrud.currentForfait");
            JsfUtil.addErrorMessage("The forfait with id " + requestForfaitString + " no longer exists.");
            return relatedOrListOutcome();
        }
        return destination;
    }

    public String edit() {
        String forfaitString = converter.getAsString(FacesContext.getCurrentInstance(), null, forfait);
        String currentForfaitString = JsfUtil.getRequestParameter("jsfcrud.currentForfait");
        if (forfaitString == null || forfaitString.length() == 0 || !forfaitString.equals(currentForfaitString)) {
            String outcome = editSetup();
            if ("forfait_edit".equals(outcome)) {
                JsfUtil.addErrorMessage("Could not edit forfait. Try again.");
            }
            return outcome;
        }
        try {
            utx.begin();
        } catch (Exception ex) {
        }
        try {
            Exception transactionException = null;
            getJpaController().edit(forfait);
            try {
                utx.commit();
            } catch (javax.transaction.RollbackException ex) {
                transactionException = ex;
            } catch (Exception ex) {
            }
            if (transactionException == null) {
                JsfUtil.addSuccessMessage("Forfait was successfully updated.");
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
        String idAsString = JsfUtil.getRequestParameter("jsfcrud.currentForfait");
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
                JsfUtil.addSuccessMessage("Forfait was successfully deleted.");
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

    public List<Forfait> getForfaitItems() {
        if (forfaitItems == null) {
            getPagingInfo();
            forfaitItems = getJpaController().findRange(new int[]{pagingInfo.getFirstItem(), pagingInfo.getFirstItem() + pagingInfo.getBatchSize()});
        }
        return forfaitItems;
    }

    public String next() {
        reset(false);
        getPagingInfo().nextPage();
        return "forfait_list";
    }

    public String prev() {
        reset(false);
        getPagingInfo().previousPage();
        return "forfait_list";
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
        forfait = null;
        forfaitItems = null;
        pagingInfo.setItemCount(-1);
        if (resetFirstItem) {
            pagingInfo.setFirstItem(0);
        }
    }

    public void validateCreate(FacesContext facesContext, UIComponent component, Object value) {
        Forfait newForfait = new Forfait();
        String newForfaitString = converter.getAsString(FacesContext.getCurrentInstance(), null, newForfait);
        String forfaitString = converter.getAsString(FacesContext.getCurrentInstance(), null, forfait);
        if (!newForfaitString.equals(forfaitString)) {
            createSetup();
        }
    }

    public Converter getConverter() {
        return converter;
    }
    
}
