/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package forms;

import Beans.Livre;
import java.util.HashMap;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;

/**
 *
 * @author nicolas
 */
public class AjoutLivreForm {
    
   private static final String TITRE  = "titre";
   private static final String DATEPARUTION   = "dateparution";
   private static final String DESCRIPTION   = "description";
   private static final String VISIBLE    = "visible";
   private static final String LIEN    = "lien";
   private static final String ISBN    = "isbn";
   private static final String NBPAGES    = "nbpages";
   private static final String LANGUE    = "langue";
   private static final String TYPELIVRE    = "typelivre";
   private static final String AUTEURS    = "auteurs";
   
    private String              resultat;
    private Map<String, String> erreurs      = new HashMap<String, String>();

    public String getResultat() {
        return resultat;
    }

    public Map<String, String> getErreurs() {
        return erreurs;
    }
    
    public Livre AjoutLivre( HttpServletRequest request ) {
        String titre = getValeurChamp( request, TITRE );
        String dateparution = getValeurChamp( request, DATEPARUTION );
        String description = getValeurChamp( request, DESCRIPTION );
        String visible = getValeurChamp( request, VISIBLE );
        String lien = getValeurChamp( request, LIEN );
        String isbn = getValeurChamp( request, ISBN );
        String nbpages = getValeurChamp( request, NBPAGES );
        String langue = getValeurChamp( request, LANGUE );
        String typelivre = getValeurChamp( request, TYPELIVRE );
        String auteurs = getValeurChamp( request, AUTEURS );
        
        Livre livre = new Livre();
    
        try {
            validationNom( titre );
        } catch ( Exception e ) {
            setErreur( TITRE, e.getMessage() );
        }
        livre.setTitre( titre );
       

        if ( erreurs.isEmpty() ) {
            resultat = "Succès de l'inscription.";
        } else {
            resultat = "Échec de l'inscription.";
        }

        return livre;
    }
    
    
    private void validationNom( String nom ) throws Exception {
        if ( nom != null && nom.length() < 3 ) {
            throw new Exception( "Le nom doit contenir au moins 3 caractères." );
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