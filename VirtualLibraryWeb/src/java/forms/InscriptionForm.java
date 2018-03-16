/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package forms;

import Beans.Lecteur;
import Beans.Utilisateur;
import Dao.UtilisateurDao;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Date;
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
    private static final String LOGIN    = "login";
    private static final String NOM    = "nom";
    private static final String PRENOM    = "prenom";
    private static final String DATENAISSANCE    = "datenaissance";
    
    private String              resultat;
    private Map<String, String> erreurs      = new HashMap<String, String>();
    private UtilisateurDao utilisateurDao;

    public InscriptionForm( UtilisateurDao utilisateurDao ) {
        this.utilisateurDao = utilisateurDao;
    }
    
    public String getResultat() {
        return resultat;
    }

    public Map<String, String> getErreurs() {
        return erreurs;
    }
    
    public Utilisateur inscrireUtilisateur( HttpServletRequest request ) {
        String nom = getValeurChamp( request, NOM );
        String datenaissance = getValeurChamp( request, DATENAISSANCE );
        String prenom = getValeurChamp( request, PRENOM );
        String email = getValeurChamp( request, EMAIL );
        String motDePasse = getValeurChamp( request, PASS );
        String confirmation = getValeurChamp( request, CONF );
        String login = getValeurChamp( request, LOGIN );
        Timestamp dateinscription = new Timestamp( System.currentTimeMillis() );


        Utilisateur utilisateur = new Utilisateur();

        try {
            validationEmail( email );
        } catch ( Exception e ) {
            setErreur( EMAIL, e.getMessage() );
        }
        utilisateur.setEmail( email );
        
        try {
            validationNom( login );
        } catch ( Exception e ) {
            setErreur( LOGIN, e.getMessage() );
        }
        utilisateur.setLogin(login );
        
        Date date = null;
        try {
            date=validationDateNaissance(datenaissance );
        } catch ( Exception e ) {
            setErreur( DATENAISSANCE, e.getMessage() );
        }
        utilisateur.setDateNaissance(date );
        
        utilisateur.setDateInscription( date );
        
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
        
        try {
            validationNom( prenom );
        } catch ( Exception e ) {
            setErreur( LOGIN, e.getMessage() );
        }
        utilisateur.setPrenom( prenom );
        
        if ( erreurs.isEmpty() ) {
            utilisateurDao.creer( utilisateur );
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
    
    private Date validationDateNaissance( String stringDate ) throws Exception {
        SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
        Date date =formatter.parse(stringDate);
        if ( date==null ||  date.after(new Date() )) {
            throw new Exception( "La date de naissance ne peut être dans le futur." );
        }
        return date;
    }
}