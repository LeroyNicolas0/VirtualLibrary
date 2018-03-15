/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package jsf;

import javax.faces.component.UIComponent;
import javax.faces.context.FacesContext;
import javax.faces.convert.Converter;
import jpa.entities.Emprunt;

/**
 *
 * @author Francis
 */
public class EmpruntConverter implements Converter {

    public Object getAsObject(FacesContext facesContext, UIComponent component, String string) {
        if (string == null || string.length() == 0) {
            return null;
        }
        Integer id = new Integer(string);
        EmpruntController controller = (EmpruntController) facesContext.getApplication().getELResolver().getValue(facesContext.getELContext(), null, "emprunt");
        return controller.getJpaController().find(id);
    }

    public String getAsString(FacesContext facesContext, UIComponent component, Object object) {
        if (object == null) {
            return null;
        }
        if (object instanceof Emprunt) {
            Emprunt o = (Emprunt) object;
            return o.getEmpruntId() == null ? "" : o.getEmpruntId().toString();
        } else {
            throw new IllegalArgumentException("object " + object + " is of type " + object.getClass().getName() + "; expected type: jpa.entities.Emprunt");
        }
    }
    
}
