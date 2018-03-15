/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package jsf;

import javax.faces.component.UIComponent;
import javax.faces.context.FacesContext;
import javax.faces.convert.Converter;
import jpa.entities.Administrateur;

/**
 *
 * @author Francis
 */
public class AdministrateurConverter implements Converter {

    public Object getAsObject(FacesContext facesContext, UIComponent component, String string) {
        if (string == null || string.length() == 0) {
            return null;
        }
        Integer id = new Integer(string);
        AdministrateurController controller = (AdministrateurController) facesContext.getApplication().getELResolver().getValue(facesContext.getELContext(), null, "administrateur");
        return controller.getJpaController().find(id);
    }

    public String getAsString(FacesContext facesContext, UIComponent component, Object object) {
        if (object == null) {
            return null;
        }
        if (object instanceof Administrateur) {
            Administrateur o = (Administrateur) object;
            return o.getAdministrateurId() == null ? "" : o.getAdministrateurId().toString();
        } else {
            throw new IllegalArgumentException("object " + object + " is of type " + object.getClass().getName() + "; expected type: jpa.entities.Administrateur");
        }
    }
    
}
