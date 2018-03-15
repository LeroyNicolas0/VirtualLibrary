/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package jsf;

import javax.faces.component.UIComponent;
import javax.faces.context.FacesContext;
import javax.faces.convert.Converter;
import jpa.entities.TypeDocument;

/**
 *
 * @author Francis
 */
public class TypeDocumentConverter implements Converter {

    public Object getAsObject(FacesContext facesContext, UIComponent component, String string) {
        if (string == null || string.length() == 0) {
            return null;
        }
        Integer id = new Integer(string);
        TypeDocumentController controller = (TypeDocumentController) facesContext.getApplication().getELResolver().getValue(facesContext.getELContext(), null, "typeDocument");
        return controller.getJpaController().find(id);
    }

    public String getAsString(FacesContext facesContext, UIComponent component, Object object) {
        if (object == null) {
            return null;
        }
        if (object instanceof TypeDocument) {
            TypeDocument o = (TypeDocument) object;
            return o.getTypeDocumentId() == null ? "" : o.getTypeDocumentId().toString();
        } else {
            throw new IllegalArgumentException("object " + object + " is of type " + object.getClass().getName() + "; expected type: jpa.entities.TypeDocument");
        }
    }
    
}
