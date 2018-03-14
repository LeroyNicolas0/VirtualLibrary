/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package forms;

import Beans.Participant;
import java.util.HashMap;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;

/**
 *
 * @author nicolas
 */
public class AjoutParticipantForm {
    private static final String NOM  = "nom";
    private static final String PRENOM   = "prenom";
    private static final String PSEUDONYME   = "pseudonyme";
    private static final String TYPEPARTICIPANT    = "typeparticipant";
   
    private String              resultat;
    private Map<String, String> erreurs      = new HashMap<String, String>();

    public String getResultat() {
        return resultat;
    }

    public Map<String, String> getErreurs() {
        return erreurs;
    }
    
    public Participant AjoutAuteur( HttpServletRequest request ) {
        String nom = getValeurChamp( request, NOM );
        String prenom = getValeurChamp( request, PRENOM );
        String pseudo = getValeurChamp( request, PSEUDONYME );
        String type = getValeurChamp( request, TYPEPARTICIPANT );

        Participant participant = new Participant();

       

        try {
            validationNom( nom );
        } catch ( Exception e ) {
            setErreur( NOM, e.getMessage() );
        }
        participant.setNom( nom );
        
        try {
            validationNom( prenom );
        } catch ( Exception e ) {
            setErreur( PRENOM, e.getMessage() );
        }
        participant.setPrenom(prenom );
        
        try {
            validationNom( pseudo );
        } catch ( Exception e ) {
            setErreur( PSEUDONYME, e.getMessage() );
        }
        participant.setPseudonyme(pseudo );
        
        try {
            validationType(type );
        } catch ( Exception e ) {
            setErreur( TYPEPARTICIPANT, e.getMessage() );
        }
        participant.setTypeParticipant(type );

        if ( erreurs.isEmpty() ) {
            resultat = "Succès de l'inscription.";
        } else {
            resultat = "Échec de l'inscription.";
        }

        return participant;
    }
    
    
    private void validationNom( String nom ) throws Exception {
        if ( nom != null && nom.length() < 3 ) {
            throw new Exception( "Le nom d'utilisateur doit contenir au moins 3 caractères." );
        }
    }
        
    private void validationType( String type ) throws Exception {
        if ( type != null && type.length() < 3 ) {
            throw new Exception( "Mauvais type de participant." );
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