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
import jpa.entities.TypeParticipant;
import jpa.session.TypeParticipantFacade;
import jsf.util.JsfUtil;
import jsf.util.PagingInfo;

/**
 *
 * @author Francis
 */
public class TypeParticipantController {

    public TypeParticipantController() {
        pagingInfo = new PagingInfo();
        converter = new TypeParticipantConverter();
    }
    private TypeParticipant typeParticipant = null;
    private List<TypeParticipant> typeParticipantItems = null;
    private TypeParticipantFacade jpaController = null;
    private TypeParticipantConverter converter = null;
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

    public TypeParticipantFacade getJpaController() {
        if (jpaController == null) {
            FacesContext facesContext = FacesContext.getCurrentInstance();
            jpaController = (TypeParticipantFacade) facesContext.getApplication().getELResolver().getValue(facesContext.getELContext(), null, "typeParticipantJpa");
        }
        return jpaController;
    }

    public SelectItem[] getTypeParticipantItemsAvailableSelectMany() {
        return JsfUtil.getSelectItems(getJpaController().findAll(), false);
    }

    public SelectItem[] getTypeParticipantItemsAvailableSelectOne() {
        return JsfUtil.getSelectItems(getJpaController().findAll(), true);
    }

    public TypeParticipant getTypeParticipant() {
        if (typeParticipant == null) {
            typeParticipant = (TypeParticipant) JsfUtil.getObjectFromRequestParameter("jsfcrud.currentTypeParticipant", converter, null);
        }
        if (typeParticipant == null) {
            typeParticipant = new TypeParticipant();
        }
        return typeParticipant;
    }

    public String listSetup() {
        reset(true);
        return "typeParticipant_list";
    }

    public String createSetup() {
        reset(false);
        typeParticipant = new TypeParticipant();
        return "typeParticipant_create";
    }

    public String create() {
        try {
            utx.begin();
        } catch (Exception ex) {
        }
        try {
            Exception transactionException = null;
            getJpaController().create(typeParticipant);
            try {
                utx.commit();
            } catch (javax.transaction.RollbackException ex) {
                transactionException = ex;
            } catch (Exception ex) {
            }
            if (transactionException == null) {
                JsfUtil.addSuccessMessage("TypeParticipant was successfully created.");
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
        return scalarSetup("typeParticipant_detail");
    }

    public String editSetup() {
        return scalarSetup("typeParticipant_edit");
    }

    private String scalarSetup(String destination) {
        reset(false);
        typeParticipant = (TypeParticipant) JsfUtil.getObjectFromRequestParameter("jsfcrud.currentTypeParticipant", converter, null);
        if (typeParticipant == null) {
            String requestTypeParticipantString = JsfUtil.getRequestParameter("jsfcrud.currentTypeParticipant");
            JsfUtil.addErrorMessage("The typeParticipant with id " + requestTypeParticipantString + " no longer exists.");
            return relatedOrListOutcome();
        }
        return destination;
    }

    public String edit() {
        String typeParticipantString = converter.getAsString(FacesContext.getCurrentInstance(), null, typeParticipant);
        String currentTypeParticipantString = JsfUtil.getRequestParameter("jsfcrud.currentTypeParticipant");
        if (typeParticipantString == null || typeParticipantString.length() == 0 || !typeParticipantString.equals(currentTypeParticipantString)) {
            String outcome = editSetup();
            if ("typeParticipant_edit".equals(outcome)) {
                JsfUtil.addErrorMessage("Could not edit typeParticipant. Try again.");
            }
            return outcome;
        }
        try {
            utx.begin();
        } catch (Exception ex) {
        }
        try {
            Exception transactionException = null;
            getJpaController().edit(typeParticipant);
            try {
                utx.commit();
            } catch (javax.transaction.RollbackException ex) {
                transactionException = ex;
            } catch (Exception ex) {
            }
            if (transactionException == null) {
                JsfUtil.addSuccessMessage("TypeParticipant was successfully updated.");
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
        String idAsString = JsfUtil.getRequestParameter("jsfcrud.currentTypeParticipant");
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
                JsfUtil.addSuccessMessage("TypeParticipant was successfully deleted.");
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

    public List<TypeParticipant> getTypeParticipantItems() {
        if (typeParticipantItems == null) {
            getPagingInfo();
            typeParticipantItems = getJpaController().findRange(new int[]{pagingInfo.getFirstItem(), pagingInfo.getFirstItem() + pagingInfo.getBatchSize()});
        }
        return typeParticipantItems;
    }

    public String next() {
        reset(false);
        getPagingInfo().nextPage();
        return "typeParticipant_list";
    }

    public String prev() {
        reset(false);
        getPagingInfo().previousPage();
        return "typeParticipant_list";
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
        typeParticipant = null;
        typeParticipantItems = null;
        pagingInfo.setItemCount(-1);
        if (resetFirstItem) {
            pagingInfo.setFirstItem(0);
        }
    }

    public void validateCreate(FacesContext facesContext, UIComponent component, Object value) {
        TypeParticipant newTypeParticipant = new TypeParticipant();
        String newTypeParticipantString = converter.getAsString(FacesContext.getCurrentInstance(), null, newTypeParticipant);
        String typeParticipantString = converter.getAsString(FacesContext.getCurrentInstance(), null, typeParticipant);
        if (!newTypeParticipantString.equals(typeParticipantString)) {
            createSetup();
        }
    }

    public Converter getConverter() {
        return converter;
    }
    
}
