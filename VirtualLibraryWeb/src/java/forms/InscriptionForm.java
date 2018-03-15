/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package forms;

import Beans.Lecteur;
import Beans.Utilisateur;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

/**
 *
 * @author nicolas
 */
public final class InscriptionForm {
    private static final String EMAIL  = "email";
    private static final String PASS   = "motdepasse";
    private static final String CONF   = "confirmation";
    private static final String LOGIN    = "nom";
   
    private String              resultat;
    private Map<String, String> erreurs      = new HashMap<String, String>();

    public String getResultat() {
        return resultat;
    }

    public Map<String, String> getErreurs() {
        return erreurs;
    }
    
    public Utilisateur inscrireUtilisateur( HttpServletRequest request ) {
        String email = getValeurChamp( request, EMAIL );
        String motDePasse = getValeurChamp( request, PASS );
        String confirmation = getValeurChamp( request, CONF );
        String nom = getValeurChamp( request, LOGIN );

        Utilisateur utilisateur = new Lecteur();

        try {
            validationEmail( email );
        } catch ( Exception e ) {
            setErreur( EMAIL, e.getMessage() );
        }
        utilisateur.setEmail( email );

        try {
            validationMotsDePasse( motDePasse, confirmation );
        } catch ( Exception e ) {
            setErreur( PASS, e.getMessage() );
            setErreur( CONF, null );
        }
        utilisateur.setMotDePasse( motDePasse );

        try {
            validationNom( nom );
        } catch ( Exception e ) {
            setErreur( LOGIN, e.getMessage() );
        }
        utilisateur.setNom( nom );

        if ( erreurs.isEmpty() ) {
            resultat = "Succès de l'inscription.";
        } else {
            resultat = "Échec de l'inscription.";
        }

        return utilisateur;
    }
    
    private void validationEmail( String email ) throws Exception {
    if ( email != null ) {
        if ( !email.matches( "([^.@]+)(\\.[^.@]+)*@([^.@]+\\.)+([^.@]+)" ) ) {
            throw new Exception( "Merci de saisir une adresse mail valide." );
        }
    } else {
        throw new Exception( "Merci de saisir une adresse mail." );
    }
}

    private void validationMotsDePasse( String motDePasse, String confirmation ) throws Exception {
        if ( motDePasse != null && confirmation != null ) {
            if ( !motDePasse.equals( confirmation ) ) {
                throw new Exception( "Les mots de passe entrés sont différents, merci de les saisir à nouveau." );
            } else if ( motDePasse.length() < 3 ) {
                throw new Exception( "Les mots de passe doivent contenir au moins 3 caractères." );
            }
        } else {
            throw new Exception( "Merci de saisir et confirmer votre mot de passe." );
        }
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