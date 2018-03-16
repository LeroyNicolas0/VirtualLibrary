/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package forms;

import Beans.Participant;
import Beans.TypeParticipant;
import Dao.ParticipantDao;
import Dao.TypeParticipantDAO;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;

/**
 *
 * @author nicolas
 */
public class ModificationParticipantForm {
   private static final String NOM  = "nom";
    private static final String PRENOM   = "prenom";
    private static final String PSEUDONYME   = "pseudonyme";
    private static final String TYPEPARTICIPANT    = "typeparticipant";
    private static final String DATENAISSANCE    = "datenaissance";
    private static final String ID  = "id";
   
    private String              resultat;
    private Map<String, String> erreurs      = new HashMap<String, String>();

    private ParticipantDao     participantDao;
     private TypeParticipantDAO typeParticipantDAO;

    public ModificationParticipantForm(ParticipantDao participantDao, TypeParticipantDAO typeParticipantDAO) {
        this.participantDao = participantDao;
        this.typeParticipantDAO = typeParticipantDAO;
    }
    
    
    public String getResultat() {
        return resultat;
    }

    public Map<String, String> getErreurs() {
        return erreurs;
    }
    
    public Participant modificationParticipant( HttpServletRequest request ) {
        String nom = getValeurChamp( request, NOM );
        String prenom = getValeurChamp( request, PRENOM );
        String pseudo = getValeurChamp( request, PSEUDONYME );
        String type = getValeurChamp( request, TYPEPARTICIPANT );
        String datenaissance = getValeurChamp( request, DATENAISSANCE );
        String id = getValeurChamp( request, ID );

        Participant participant = new Participant();

        participant.setParticipantId(Integer.parseInt(id));

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
        
        TypeParticipant typeparticipant = new TypeParticipant();
        try {
            typeparticipant = validationType(type );
        } catch ( Exception e ) {
            setErreur( TYPEPARTICIPANT, e.getMessage() );
        }
        participant.setTypeParticpantIdFk(typeparticipant);
        
        Date date = null;
        try {
            date=validationDateNaissance(datenaissance );
        } catch ( Exception e ) {
            setErreur( DATENAISSANCE, e.getMessage() );
        }
        participant.setDateNaissance(date );

        if ( erreurs.isEmpty() ) {
            participantDao.update(participant);
            resultat = "Succès de la modification";
        } else {
            resultat = "Échec de la modification ";
        }

        return participant;
    }
    
    
    private void validationNom( String nom ) throws Exception {
        if ( nom != null && nom.length() < 3 ) {
            throw new Exception( "Le nom d'utilisateur doit contenir au moins 3 caractères." );
        }
    }
        
    private TypeParticipant validationType( String type ) throws Exception {
        TypeParticipant typeParticipant = null;
        if ( type != null && type.length() < 3 ) {
            throw new Exception( "Mauvais type de participant." );
        }
        else if (type == null){
            throw new Exception( "Mauvais type de participant : null" );
        }
        else{
           
           typeParticipant= typeParticipantDAO.trouver(type);
            if (typeParticipant.equals(null) || typeParticipant.getTypeParticipantId() == null){
                 throw new Exception( "Mauvais type de participant.: non trouver"+type );
            }
            else{
                return typeParticipant;
            }
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