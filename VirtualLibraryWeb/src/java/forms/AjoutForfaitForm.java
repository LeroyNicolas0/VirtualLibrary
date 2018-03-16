/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package forms;

import Beans.Forfait;
import java.util.HashMap;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;

/**
 *
 * @author francis
 */
public class AjoutForfaitForm {
    private static final String NOM  = "nom";
    private static final String TARIF   = "tarif";
    private static final String DUREE   = "duree";
   
    private String              resultat;
    private Map<String, String> erreurs      = new HashMap<String, String>();

    public String getResultat() {
        return resultat;
    }

    public Map<String, String> getErreurs() {
        return erreurs;
    }
    
    public Forfait AjoutForfait( HttpServletRequest request ) {
        String nom = getValeurChamp( request, NOM );
        String tarif = getValeurChamp( request, TARIF );
        String duree = getValeurChamp( request, DUREE );

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
        

        if ( erreurs.isEmpty() ) {
            resultat = dureeInt.toString();
        } else {
            resultat = "Échec de l'inscription.";
        }

        return forfait;
    }
    
    
    private void validationNom( String nom ) throws Exception {
        if ( nom != null && nom.length() < 5 ) {
            throw new Exception( "Le nom du forfait est trop court." );
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