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
import jpa.entities.Administrateur;
import jpa.session.AdministrateurFacade;
import jsf.util.JsfUtil;
import jsf.util.PagingInfo;

/**
 *
 * @author Francis
 */
public class AdministrateurController {

    public AdministrateurController() {
        pagingInfo = new PagingInfo();
        converter = new AdministrateurConverter();
    }
    private Administrateur administrateur = null;
    private List<Administrateur> administrateurItems = null;
    private AdministrateurFacade jpaController = null;
    private AdministrateurConverter converter = null;
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

    public AdministrateurFacade getJpaController() {
        if (jpaController == null) {
            FacesContext facesContext = FacesContext.getCurrentInstance();
            jpaController = (AdministrateurFacade) facesContext.getApplication().getELResolver().getValue(facesContext.getELContext(), null, "administrateurJpa");
        }
        return jpaController;
    }

    public SelectItem[] getAdministrateurItemsAvailableSelectMany() {
        return JsfUtil.getSelectItems(getJpaController().findAll(), false);
    }

    public SelectItem[] getAdministrateurItemsAvailableSelectOne() {
        return JsfUtil.getSelectItems(getJpaController().findAll(), true);
    }

    public Administrateur getAdministrateur() {
        if (administrateur == null) {
            administrateur = (Administrateur) JsfUtil.getObjectFromRequestParameter("jsfcrud.currentAdministrateur", converter, null);
        }
        if (administrateur == null) {
            administrateur = new Administrateur();
        }
        return administrateur;
    }

    public String listSetup() {
        reset(true);
        return "administrateur_list";
    }

    public String createSetup() {
        reset(false);
        administrateur = new Administrateur();
        return "administrateur_create";
    }

    public String create() {
        try {
            utx.begin();
        } catch (Exception ex) {
        }
        try {
            Exception transactionException = null;
            getJpaController().create(administrateur);
            try {
                utx.commit();
            } catch (javax.transaction.RollbackException ex) {
                transactionException = ex;
            } catch (Exception ex) {
            }
            if (transactionException == null) {
                JsfUtil.addSuccessMessage("Administrateur was successfully created.");
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
        return scalarSetup("administrateur_detail");
    }

    public String editSetup() {
        return scalarSetup("administrateur_edit");
    }

    private String scalarSetup(String destination) {
        reset(false);
        administrateur = (Administrateur) JsfUtil.getObjectFromRequestParameter("jsfcrud.currentAdministrateur", converter, null);
        if (administrateur == null) {
            String requestAdministrateurString = JsfUtil.getRequestParameter("jsfcrud.currentAdministrateur");
            JsfUtil.addErrorMessage("The administrateur with id " + requestAdministrateurString + " no longer exists.");
            return relatedOrListOutcome();
        }
        return destination;
    }

    public String edit() {
        String administrateurString = converter.getAsString(FacesContext.getCurrentInstance(), null, administrateur);
        String currentAdministrateurString = JsfUtil.getRequestParameter("jsfcrud.currentAdministrateur");
        if (administrateurString == null || administrateurString.length() == 0 || !administrateurString.equals(currentAdministrateurString)) {
            String outcome = editSetup();
            if ("administrateur_edit".equals(outcome)) {
                JsfUtil.addErrorMessage("Could not edit administrateur. Try again.");
            }
            return outcome;
        }
        try {
            utx.begin();
        } catch (Exception ex) {
        }
        try {
            Exception transactionException = null;
            getJpaController().edit(administrateur);
            try {
                utx.commit();
            } catch (javax.transaction.RollbackException ex) {
                transactionException = ex;
            } catch (Exception ex) {
            }
            if (transactionException == null) {
                JsfUtil.addSuccessMessage("Administrateur was successfully updated.");
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
        String idAsString = JsfUtil.getRequestParameter("jsfcrud.currentAdministrateur");
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
                JsfUtil.addSuccessMessage("Administrateur was successfully deleted.");
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

    public List<Administrateur> getAdministrateurItems() {
        if (administrateurItems == null) {
            getPagingInfo();
            administrateurItems = getJpaController().findRange(new int[]{pagingInfo.getFirstItem(), pagingInfo.getFirstItem() + pagingInfo.getBatchSize()});
        }
        return administrateurItems;
    }

    public String next() {
        reset(false);
        getPagingInfo().nextPage();
        return "administrateur_list";
    }

    public String prev() {
        reset(false);
        getPagingInfo().previousPage();
        return "administrateur_list";
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
        administrateur = null;
        administrateurItems = null;
        pagingInfo.setItemCount(-1);
        if (resetFirstItem) {
            pagingInfo.setFirstItem(0);
        }
    }

    public void validateCreate(FacesContext facesContext, UIComponent component, Object value) {
        Administrateur newAdministrateur = new Administrateur();
        String newAdministrateurString = converter.getAsString(FacesContext.getCurrentInstance(), null, newAdministrateur);
        String administrateurString = converter.getAsString(FacesContext.getCurrentInstance(), null, administrateur);
        if (!newAdministrateurString.equals(administrateurString)) {
            createSetup();
        }
    }

    public Converter getConverter() {
        return converter;
    }
    
}
