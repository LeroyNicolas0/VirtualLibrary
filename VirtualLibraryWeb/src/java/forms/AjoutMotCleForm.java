/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package forms;

import Beans.MotCle;
import Beans.Utilisateur;
import Dao.MotCleDao;
import Dao.UtilisateurDao;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;

/**
 *
 * @author atyla
 */
public class AjoutMotCleForm {
    private static final String NOM  = "nom";
    
    private String resultat;
    private Map<String, String> erreurs      = new HashMap<String, String>();
    private MotCleDao motcleDao;

    public AjoutMotCleForm( MotCleDao motCleDao ) {
        this.motcleDao = motCleDao;
    }
    
    public String getResultat() {
        return resultat;
    }

    public Map<String, String> getErreurs() {
        return erreurs;
    }
    
    public MotCle ajoutMotCle( HttpServletRequest request ) {
        String nom = getValeurChamp( request, NOM );

        MotCle motCle = new MotCle();

        try {
            validationNom( nom );
        } catch ( Exception e ) {
            setErreur( NOM, e.getMessage() );
        }
        motCle.setNom( nom );
        
        if ( erreurs.isEmpty() ) {
            motcleDao.creer( motCle );
            resultat = "Succès de l'ajout.";
        } else {
            resultat = "Échec de l'ajout.";
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
