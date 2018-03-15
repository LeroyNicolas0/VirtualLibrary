/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package jsf;

import javax.faces.component.UIComponent;
import javax.faces.context.FacesContext;
import javax.faces.convert.Converter;
import jpa.entities.TypeParticipant;

/**
 *
 * @author Francis
 */
public class TypeParticipantConverter implements Converter {

    public Object getAsObject(FacesContext facesContext, UIComponent component, String string) {
        if (string == null || string.length() == 0) {
            return null;
        }
        Integer id = new Integer(string);
        TypeParticipantController controller = (TypeParticipantController) facesContext.getApplication().getELResolver().getValue(facesContext.getELContext(), null, "typeParticipant");
        return controller.getJpaController().find(id);
    }

    public String getAsString(FacesContext facesContext, UIComponent component, Object object) {
        if (object == null) {
            return null;
        }
        if (object instanceof TypeParticipant) {
            TypeParticipant o = (TypeParticipant) object;
            return o.getTypeParticipantId() == null ? "" : o.getTypeParticipantId().toString();
        } else {
            throw new IllegalArgumentException("object " + object + " is of type " + object.getClass().getName() + "; expected type: jpa.entities.TypeParticipant");
        }
    }
    
}
