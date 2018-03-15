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
import jpa.entities.Abonnement;
import jpa.session.AbonnementFacade;
import jsf.util.JsfUtil;
import jsf.util.PagingInfo;

/**
 *
 * @author Francis
 */
public class AbonnementController {

    public AbonnementController() {
        pagingInfo = new PagingInfo();
        converter = new AbonnementConverter();
    }
    private Abonnement abonnement = null;
    private List<Abonnement> abonnementItems = null;
    private AbonnementFacade jpaController = null;
    private AbonnementConverter converter = null;
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

    public AbonnementFacade getJpaController() {
        if (jpaController == null) {
            FacesContext facesContext = FacesContext.getCurrentInstance();
            jpaController = (AbonnementFacade) facesContext.getApplication().getELResolver().getValue(facesContext.getELContext(), null, "abonnementJpa");
        }
        return jpaController;
    }

    public SelectItem[] getAbonnementItemsAvailableSelectMany() {
        return JsfUtil.getSelectItems(getJpaController().findAll(), false);
    }

    public SelectItem[] getAbonnementItemsAvailableSelectOne() {
        return JsfUtil.getSelectItems(getJpaController().findAll(), true);
    }

    public Abonnement getAbonnement() {
        if (abonnement == null) {
            abonnement = (Abonnement) JsfUtil.getObjectFromRequestParameter("jsfcrud.currentAbonnement", converter, null);
        }
        if (abonnement == null) {
            abonnement = new Abonnement();
        }
        return abonnement;
    }

    public String listSetup() {
        reset(true);
        return "abonnement_list";
    }

    public String createSetup() {
        reset(false);
        abonnement = new Abonnement();
        return "abonnement_create";
    }

    public String create() {
        try {
            utx.begin();
        } catch (Exception ex) {
        }
        try {
            Exception transactionException = null;
            getJpaController().create(abonnement);
            try {
                utx.commit();
            } catch (javax.transaction.RollbackException ex) {
                transactionException = ex;
            } catch (Exception ex) {
            }
            if (transactionException == null) {
                JsfUtil.addSuccessMessage("Abonnement was successfully created.");
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
        return scalarSetup("abonnement_detail");
    }

    public String editSetup() {
        return scalarSetup("abonnement_edit");
    }

    private String scalarSetup(String destination) {
        reset(false);
        abonnement = (Abonnement) JsfUtil.getObjectFromRequestParameter("jsfcrud.currentAbonnement", converter, null);
        if (abonnement == null) {
            String requestAbonnementString = JsfUtil.getRequestParameter("jsfcrud.currentAbonnement");
            JsfUtil.addErrorMessage("The abonnement with id " + requestAbonnementString + " no longer exists.");
            return relatedOrListOutcome();
        }
        return destination;
    }

    public String edit() {
        String abonnementString = converter.getAsString(FacesContext.getCurrentInstance(), null, abonnement);
        String currentAbonnementString = JsfUtil.getRequestParameter("jsfcrud.currentAbonnement");
        if (abonnementString == null || abonnementString.length() == 0 || !abonnementString.equals(currentAbonnementString)) {
            String outcome = editSetup();
            if ("abonnement_edit".equals(outcome)) {
                JsfUtil.addErrorMessage("Could not edit abonnement. Try again.");
            }
            return outcome;
        }
        try {
            utx.begin();
        } catch (Exception ex) {
        }
        try {
            Exception transactionException = null;
            getJpaController().edit(abonnement);
            try {
                utx.commit();
            } catch (javax.transaction.RollbackException ex) {
                transactionException = ex;
            } catch (Exception ex) {
            }
            if (transactionException == null) {
                JsfUtil.addSuccessMessage("Abonnement was successfully updated.");
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
        String idAsString = JsfUtil.getRequestParameter("jsfcrud.currentAbonnement");
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
                JsfUtil.addSuccessMessage("Abonnement was successfully deleted.");
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

    public List<Abonnement> getAbonnementItems() {
        if (abonnementItems == null) {
            getPagingInfo();
            abonnementItems = getJpaController().findRange(new int[]{pagingInfo.getFirstItem(), pagingInfo.getFirstItem() + pagingInfo.getBatchSize()});
        }
        return abonnementItems;
    }

    public String next() {
        reset(false);
        getPagingInfo().nextPage();
        return "abonnement_list";
    }

    public String prev() {
        reset(false);
        getPagingInfo().previousPage();
        return "abonnement_list";
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
        abonnement = null;
        abonnementItems = null;
        pagingInfo.setItemCount(-1);
        if (resetFirstItem) {
            pagingInfo.setFirstItem(0);
        }
    }

    public void validateCreate(FacesContext facesContext, UIComponent component, Object value) {
        Abonnement newAbonnement = new Abonnement();
        String newAbonnementString = converter.getAsString(FacesContext.getCurrentInstance(), null, newAbonnement);
        String abonnementString = converter.getAsString(FacesContext.getCurrentInstance(), null, abonnement);
        if (!newAbonnementString.equals(abonnementString)) {
            createSetup();
        }
    }

    public Converter getConverter() {
        return converter;
    }
    
}
