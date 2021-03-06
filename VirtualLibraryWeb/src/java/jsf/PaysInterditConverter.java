/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package jsf;

import javax.faces.component.UIComponent;
import javax.faces.context.FacesContext;
import javax.faces.convert.Converter;
import jpa.entities.PaysInterdit;

/**
 *
 * @author Francis
 */
public class PaysInterditConverter implements Converter {

    public Object getAsObject(FacesContext facesContext, UIComponent component, String string) {
        if (string == null || string.length() == 0) {
            return null;
        }
        Integer id = new Integer(string);
        PaysInterditController controller = (PaysInterditController) facesContext.getApplication().getELResolver().getValue(facesContext.getELContext(), null, "paysInterdit");
        return controller.getJpaController().find(id);
    }

    public String getAsString(FacesContext facesContext, UIComponent component, Object object) {
        if (object == null) {
            return null;
        }
        if (object instanceof PaysInterdit) {
            PaysInterdit o = (PaysInterdit) object;
            return o.getPaysId() == null ? "" : o.getPaysId().toString();
        } else {
            throw new IllegalArgumentException("object " + object + " is of type " + object.getClass().getName() + "; expected type: jpa.entities.PaysInterdit");
        }
    }
    
}
