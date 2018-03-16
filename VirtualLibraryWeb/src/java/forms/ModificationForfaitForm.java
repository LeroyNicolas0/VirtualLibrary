/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package forms;

import Beans.Forfait;
import Dao.ForfaitDao;
import java.util.HashMap;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;

/**
 *
 * @author atyla
 */
public class ModificationForfaitForm {
    private static final String NOM  = "nom";
    private static final String TARIF = "tarif";
    private static final String DUREE = "duree";
    private static final String ID  = "id";
    
    private String resultat;
    private Map<String, String> erreurs      = new HashMap<String, String>();
    private ForfaitDao forfaitDao;

    public ModificationForfaitForm( ForfaitDao forfaitDao ) {
        this.forfaitDao = forfaitDao;
    }
    
    public String getResultat() {
        return resultat;
    }

    public Map<String, String> getErreurs() {
        return erreurs;
    }
    
    public Forfait modificationForfait( HttpServletRequest request ) {
        String nom = getValeurChamp( request, NOM );
        String tarif = getValeurChamp( request, TARIF );
        String duree = getValeurChamp( request, DUREE );
        String id = getValeurChamp( request, ID );
        
        Forfait forfait = new Forfait();

       try {
            validationNom( nom );
        } catch ( Exception e ) {
            setErreur( NOM, e.getMessage() );
        }
        forfait.setNom( nom );
        
        Float tarifFloat = new Float("0f");
        try {
            tarifFloat=validationTarif( tarif );
        } catch ( Exception e ) {
            setErreur( TARIF, e.getMessage() );
        }
        forfait.setTarif( tarifFloat );
        
        Integer dureeInt=1;
        try {
            dureeInt=validationDuree( duree );
        } catch ( Exception e ) {
            setErreur( DUREE, e.getMessage() );
        }
        forfait.setDuree(dureeInt );
        
        forfait.setForfaitID(Integer.parseInt(id));
        
        if ( erreurs.isEmpty() ) {
            forfaitDao.update( forfait );
            resultat = "Succès de la modification.";
        } else {
            resultat = "Échec de la modification.";
        }
        
        return forfait;
    }
    
    private void validationNom( String nom ) throws Exception {
        if ( nom != null && nom.length() < 3 ) {
            throw new Exception( "Le nom d'utilisateur doit contenir au moins 3 caractères." );
        }
    }
    
    private float validationTarif( String tarif ) throws Exception {
        if ( tarif==null || (tarif != null && tarif.length() < 0) ) {
            throw new Exception( "Veuillez entrer un tarif correct." );
        }
        Float tarifFloat=Float.parseFloat(tarif);
        if(tarifFloat<0) {
            throw new Exception( "Le tarif est erroné." );
        }
        return tarifFloat;
    }
        
    private Integer validationDuree( String duree ) throws Exception {
        if ( duree==null || (duree != null && duree.length() < 1) ) {
            throw new Exception( "Veuillez entrer une durée correcte." );
        }
        Integer dureeInt=Integer.parseInt(duree);
        if(dureeInt<1) {
            throw new Exception( "La durée est erronée." );
        }
        return dureeInt;
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