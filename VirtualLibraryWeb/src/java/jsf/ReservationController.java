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
import jpa.entities.Reservation;
import jpa.session.ReservationFacade;
import jsf.util.JsfUtil;
import jsf.util.PagingInfo;

/**
 *
 * @author Francis
 */
public class ReservationController {

    public ReservationController() {
        pagingInfo = new PagingInfo();
        converter = new ReservationConverter();
    }
    private Reservation reservation = null;
    private List<Reservation> reservationItems = null;
    private ReservationFacade jpaController = null;
    private ReservationConverter converter = null;
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

    public ReservationFacade getJpaController() {
        if (jpaController == null) {
            FacesContext facesContext = FacesContext.getCurrentInstance();
            jpaController = (ReservationFacade) facesContext.getApplication().getELResolver().getValue(facesContext.getELContext(), null, "reservationJpa");
        }
        return jpaController;
    }

    public SelectItem[] getReservationItemsAvailableSelectMany() {
        return JsfUtil.getSelectItems(getJpaController().findAll(), false);
    }

    public SelectItem[] getReservationItemsAvailableSelectOne() {
        return JsfUtil.getSelectItems(getJpaController().findAll(), true);
    }

    public Reservation getReservation() {
        if (reservation == null) {
            reservation = (Reservation) JsfUtil.getObjectFromRequestParameter("jsfcrud.currentReservation", converter, null);
        }
        if (reservation == null) {
            reservation = new Reservation();
        }
        return reservation;
    }

    public String listSetup() {
        reset(true);
        return "reservation_list";
    }

    public String createSetup() {
        reset(false);
        reservation = new Reservation();
        return "reservation_create";
    }

    public String create() {
        try {
            utx.begin();
        } catch (Exception ex) {
        }
        try {
            Exception transactionException = null;
            getJpaController().create(reservation);
            try {
                utx.commit();
            } catch (javax.transaction.RollbackException ex) {
                transactionException = ex;
            } catch (Exception ex) {
            }
            if (transactionException == null) {
                JsfUtil.addSuccessMessage("Reservation was successfully created.");
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
        return scalarSetup("reservation_detail");
    }

    public String editSetup() {
        return scalarSetup("reservation_edit");
    }

    private String scalarSetup(String destination) {
        reset(false);
        reservation = (Reservation) JsfUtil.getObjectFromRequestParameter("jsfcrud.currentReservation", converter, null);
        if (reservation == null) {
            String requestReservationString = JsfUtil.getRequestParameter("jsfcrud.currentReservation");
            JsfUtil.addErrorMessage("The reservation with id " + requestReservationString + " no longer exists.");
            return relatedOrListOutcome();
        }
        return destination;
    }

    public String edit() {
        String reservationString = converter.getAsString(FacesContext.getCurrentInstance(), null, reservation);
        String currentReservationString = JsfUtil.getRequestParameter("jsfcrud.currentReservation");
        if (reservationString == null || reservationString.length() == 0 || !reservationString.equals(currentReservationString)) {
            String outcome = editSetup();
            if ("reservation_edit".equals(outcome)) {
                JsfUtil.addErrorMessage("Could not edit reservation. Try again.");
            }
            return outcome;
        }
        try {
            utx.begin();
        } catch (Exception ex) {
        }
        try {
            Exception transactionException = null;
            getJpaController().edit(reservation);
            try {
                utx.commit();
            } catch (javax.transaction.RollbackException ex) {
                transactionException = ex;
            } catch (Exception ex) {
            }
            if (transactionException == null) {
                JsfUtil.addSuccessMessage("Reservation was successfully updated.");
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
        String idAsString = JsfUtil.getRequestParameter("jsfcrud.currentReservation");
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
                JsfUtil.addSuccessMessage("Reservation was successfully deleted.");
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

    public List<Reservation> getReservationItems() {
        if (reservationItems == null) {
            getPagingInfo();
            reservationItems = getJpaController().findRange(new int[]{pagingInfo.getFirstItem(), pagingInfo.getFirstItem() + pagingInfo.getBatchSize()});
        }
        return reservationItems;
    }

    public String next() {
        reset(false);
        getPagingInfo().nextPage();
        return "reservation_list";
    }

    public String prev() {
        reset(false);
        getPagingInfo().previousPage();
        return "reservation_list";
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
        reservation = null;
        reservationItems = null;
        pagingInfo.setItemCount(-1);
        if (resetFirstItem) {
            pagingInfo.setFirstItem(0);
        }
    }

    public void validateCreate(FacesContext facesContext, UIComponent component, Object value) {
        Reservation newReservation = new Reservation();
        String newReservationString = converter.getAsString(FacesContext.getCurrentInstance(), null, newReservation);
        String reservationString = converter.getAsString(FacesContext.getCurrentInstance(), null, reservation);
        if (!newReservationString.equals(reservationString)) {
            createSetup();
        }
    }

    public Converter getConverter() {
        return converter;
    }
    
}
