/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package forms;

import Beans.Bibliothecaire;
import Beans.Lecteur;
import Beans.Utilisateur;
import Dao.UtilisateurDao;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
/**
 *
 * @author nicolas
 */
public final class ConnexionForm {
    private static final String CHAMP_EMAIL  = "email";
    private static final String CHAMP_PASS   = "motdepasse";

    private String              resultat;
    private Map<String, String> erreurs      = new HashMap<String, String>();
    private UtilisateurDao utilisateurDao;

    public ConnexionForm( UtilisateurDao utilisateurDao ) {
        this.utilisateurDao = utilisateurDao;
    }

    public String getResultat() {
        return resultat;
    }

    public Map<String, String> getErreurs() {
        return erreurs;
    }

    public Utilisateur connecterUtilisateur( HttpServletRequest request ) {
        /* Récupération des champs du formulaire */
        String email = getValeurChamp( request, CHAMP_EMAIL );
        String motDePasse = getValeurChamp( request, CHAMP_PASS );
        Boolean success=false;
        Utilisateur utilisateur;

        /* Validation du champ email. */
        try {
            validationEmail( email );
        } catch ( Exception e ) {
            setErreur( CHAMP_EMAIL, e.getMessage() );
        }
        
        Utilisateur utilverif = this.utilisateurDao.trouver(email);
        
        if(utilverif != null){
            /* Validation du champ mot de passe. */
                try {
                   success= validationMotDePasse( motDePasse, utilverif.getMotDePasse() );
                } catch ( Exception e ) {
                    setErreur( CHAMP_PASS, e.getMessage() );
                }
        }
        if(success == false){
            setErreur( "non trouve", " non trouve " );
        }
        
        

        /* Initialisation du résultat global de la validation. */
        if ( erreurs.isEmpty() && success) {
            resultat = "Succès de la connexion.";
        } else {
            resultat = "Échec de la connexion.: Mot de passe ou email invalide";
        }
        
        //TODO check dans la bd
        if(false) {
            utilisateur = new Lecteur();
        }
        else {
            utilisateur = new Bibliothecaire();
        }
        utilisateur.setEmail( email );
        utilisateur.setMotDePasse( motDePasse );

        return utilisateur;
    }

    /**
     * Valide l'adresse email saisie.
     */
    private void validationEmail( String email ) throws Exception {
        if ( email != null && !email.matches( "([^.@]+)(\\.[^.@]+)*@([^.@]+\\.)+([^.@]+)" ) ) {
            throw new Exception( "Merci de saisir une adresse mail valide." );
        }
    }

    /**
     * Valide le mot de passe saisi.
     */
    private Boolean validationMotDePasse( String motDePasse, String motDePasse2) throws Exception {
        if ( motDePasse != null ) {
            return motDePasse2.equals(motDePasse);
        } else {
            throw new Exception( "Merci de saisir votre mot de passe." );
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
            return valeur;
        }
    }
}