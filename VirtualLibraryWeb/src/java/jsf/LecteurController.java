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
import jpa.entities.Lecteur;
import jpa.session.LecteurFacade;
import jsf.util.JsfUtil;
import jsf.util.PagingInfo;

/**
 *
 * @author Francis
 */
public class LecteurController {

    public LecteurController() {
        pagingInfo = new PagingInfo();
        converter = new LecteurConverter();
    }
    private Lecteur lecteur = null;
    private List<Lecteur> lecteurItems = null;
    private LecteurFacade jpaController = null;
    private LecteurConverter converter = null;
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

    public LecteurFacade getJpaController() {
        if (jpaController == null) {
            FacesContext facesContext = FacesContext.getCurrentInstance();
            jpaController = (LecteurFacade) facesContext.getApplication().getELResolver().getValue(facesContext.getELContext(), null, "lecteurJpa");
        }
        return jpaController;
    }

    public SelectItem[] getLecteurItemsAvailableSelectMany() {
        return JsfUtil.getSelectItems(getJpaController().findAll(), false);
    }

    public SelectItem[] getLecteurItemsAvailableSelectOne() {
        return JsfUtil.getSelectItems(getJpaController().findAll(), true);
    }

    public Lecteur getLecteur() {
        if (lecteur == null) {
            lecteur = (Lecteur) JsfUtil.getObjectFromRequestParameter("jsfcrud.currentLecteur", converter, null);
        }
        if (lecteur == null) {
            lecteur = new Lecteur();
        }
        return lecteur;
    }

    public String listSetup() {
        reset(true);
        return "lecteur_list";
    }

    public String createSetup() {
        reset(false);
        lecteur = new Lecteur();
        return "lecteur_create";
    }

    public String create() {
        try {
            utx.begin();
        } catch (Exception ex) {
        }
        try {
            Exception transactionException = null;
            getJpaController().create(lecteur);
            try {
                utx.commit();
            } catch (javax.transaction.RollbackException ex) {
                transactionException = ex;
            } catch (Exception ex) {
            }
            if (transactionException == null) {
                JsfUtil.addSuccessMessage("Lecteur was successfully created.");
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
        return scalarSetup("lecteur_detail");
    }

    public String editSetup() {
        return scalarSetup("lecteur_edit");
    }

    private String scalarSetup(String destination) {
        reset(false);
        lecteur = (Lecteur) JsfUtil.getObjectFromRequestParameter("jsfcrud.currentLecteur", converter, null);
        if (lecteur == null) {
            String requestLecteurString = JsfUtil.getRequestParameter("jsfcrud.currentLecteur");
            JsfUtil.addErrorMessage("The lecteur with id " + requestLecteurString + " no longer exists.");
            return relatedOrListOutcome();
        }
        return destination;
    }

    public String edit() {
        String lecteurString = converter.getAsString(FacesContext.getCurrentInstance(), null, lecteur);
        String currentLecteurString = JsfUtil.getRequestParameter("jsfcrud.currentLecteur");
        if (lecteurString == null || lecteurString.length() == 0 || !lecteurString.equals(currentLecteurString)) {
            String outcome = editSetup();
            if ("lecteur_edit".equals(outcome)) {
                JsfUtil.addErrorMessage("Could not edit lecteur. Try again.");
            }
            return outcome;
        }
        try {
            utx.begin();
        } catch (Exception ex) {
        }
        try {
            Exception transactionException = null;
            getJpaController().edit(lecteur);
            try {
                utx.commit();
            } catch (javax.transaction.RollbackException ex) {
                transactionException = ex;
            } catch (Exception ex) {
            }
            if (transactionException == null) {
                JsfUtil.addSuccessMessage("Lecteur was successfully updated.");
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
        String idAsString = JsfUtil.getRequestParameter("jsfcrud.currentLecteur");
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
                JsfUtil.addSuccessMessage("Lecteur was successfully deleted.");
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

    public List<Lecteur> getLecteurItems() {
        if (lecteurItems == null) {
            getPagingInfo();
            lecteurItems = getJpaController().findRange(new int[]{pagingInfo.getFirstItem(), pagingInfo.getFirstItem() + pagingInfo.getBatchSize()});
        }
        return lecteurItems;
    }

    public String next() {
        reset(false);
        getPagingInfo().nextPage();
        return "lecteur_list";
    }

    public String prev() {
        reset(false);
        getPagingInfo().previousPage();
        return "lecteur_list";
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
        lecteur = null;
        lecteurItems = null;
        pagingInfo.setItemCount(-1);
        if (resetFirstItem) {
            pagingInfo.setFirstItem(0);
        }
    }

    public void validateCreate(FacesContext facesContext, UIComponent component, Object value) {
        Lecteur newLecteur = new Lecteur();
        String newLecteurString = converter.getAsString(FacesContext.getCurrentInstance(), null, newLecteur);
        String lecteurString = converter.getAsString(FacesContext.getCurrentInstance(), null, lecteur);
        if (!newLecteurString.equals(lecteurString)) {
            createSetup();
        }
    }

    public Converter getConverter() {
        return converter;
    }
    
}
