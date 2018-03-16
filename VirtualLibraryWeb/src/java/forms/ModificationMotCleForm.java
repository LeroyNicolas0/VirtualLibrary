/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package forms;

import Beans.MotCle;
import Dao.MotCleDao;
import java.util.HashMap;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;

/**
 *
 * @author atyla
 */
public class ModificationMotCleForm {
    private static final String NOM  = "nom";
    private static final String ID  = "id";
    
    private String resultat;
    private Map<String, String> erreurs      = new HashMap<String, String>();
    private MotCleDao motcleDao;

    public ModificationMotCleForm( MotCleDao motCleDao ) {
        this.motcleDao = motCleDao;
    }
    
    public String getResultat() {
        return resultat;
    }

    public Map<String, String> getErreurs() {
        return erreurs;
    }
    
    public MotCle modificationMotCle( HttpServletRequest request ) {
        String nom = getValeurChamp( request, NOM );
        String id = getValeurChamp( request, ID );
        
        MotCle motCle = new MotCle();

        try {
            validationNom( nom );
        } catch ( Exception e ) {
            setErreur( NOM, e.getMessage() );
        }
        motCle.setNom( nom );
        motCle.setMotCleID(Integer.parseInt(id));
        
        if ( erreurs.isEmpty() ) {
            motcleDao.update( motCle );
            resultat = "Succès de la modification.";
        } else {
            resultat = "Échec de la modification.";
        }
        
        return motCle;
    }
    
    private void validationNom( String nom ) throws Exception {
        if ( nom != null && nom.length() < 3 ) {
            throw new Exception( "Le nom d'utilisateur doit contenir au moins 3 caractères." );
        }
    }

    /*
     * Ajoute un message correspondant au champ spécifié à la map des erreurs.
     */
    private void setErreur( String champ, String message ) {
        erreurs.put( champ, message );
    }

    /*
     * Méthode utilitaire qui retourne null si un champ est vide, et son contenu
     * sinon.
     */
    private static String getValeurChamp( HttpServletRequest request, String nomChamp ) {
        String valeur = request.getParameter( nomChamp );
        if ( valeur == null || valeur.trim().length() == 0 ) {
            return null;
        } else {
            return valeur.trim();
        }
    }
}
