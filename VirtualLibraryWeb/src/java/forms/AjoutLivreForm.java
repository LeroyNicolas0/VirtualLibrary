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
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import org.apache.commons.validator.routines.UrlValidator;

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
            validationTitre( titre );
        } catch ( Exception e ) {
            setErreur( TITRE, e.getMessage() );
        }
        livre.setTitre( titre );
        
        Date date = new Date();
        try {
            date=validationDateParution( dateparution );
        } catch ( Exception e ) {
            setErreur( DATEPARUTION, e.getMessage() );
        }
        livre.setDateParution(date );
        
        livre.setDescription(description );
        
        Boolean visibl=validationVisible(visible);
        livre.setVisibleLecteur(visibl);
        
        try {
            validationLien( lien );
        } catch ( Exception e ) {
            setErreur( LIEN, e.getMessage() );
        }
        livre.setLienCouverture(lien );
       
        try {
            validationIsbn( isbn );
        } catch ( Exception e ) {
            setErreur( ISBN, e.getMessage() );
        }
        livre.setIsbn(isbn );
        
        Integer nbPagesInt=0;
        try {
            nbPagesInt=validationNbPages( nbpages );
        } catch ( Exception e ) {
            setErreur( NBPAGES, e.getMessage() );
        }
        livre.setNbPages(nbPagesInt);
        
        try {
            validationLangue( langue );
        } catch ( Exception e ) {
            setErreur( LANGUE, e.getMessage() );
        }
        livre.setLangue(langue );
        
        try {
            validationTypeLivre( typelivre );
        } catch ( Exception e ) {
            setErreur( TYPELIVRE, e.getMessage() );
        }
        livre.setTypeLivre(typelivre );
        
        //TODO s'occuper des auters/mot clés

        if ( erreurs.isEmpty() ) {
            resultat = "Succès de l'inscription.";
        } else {
            resultat = "Échec de l'inscription.";
        }

        return livre;
    }
    
    private void validationTitre( String titre ) throws Exception {
        if ( titre==null || (titre != null && titre.length() < 1 )) {
            throw new Exception( "Le titre doit contenir au moins 1 caractère." );
        }
    }
     
    private Date validationDateParution( String stringDate ) throws Exception {
        SimpleDateFormat formatter = new SimpleDateFormat("MM-dd-yyyy");
        Date date =formatter.parse(stringDate);
        if ( date==null || (date != null && date.before(new Date()) )) {
            throw new Exception( "La date de parution ne peut être dans le futur." );
        }
        return date;
    }
    
    private boolean validationVisible( String visible ) {
        if(visible.equals("yes")) return true;
        else return false;
    }
    
    private void validationLien( String lien ) throws Exception {
        String[] schemes = {"http","https"};
        UrlValidator urlValidator = new UrlValidator(schemes);
        if ( lien!=null && !urlValidator.isValid(lien) ) {
            throw new Exception( "Le lien n'est pas valide." );
        }
    }
    
    private void validationIsbn( String isbn ) throws Exception {
        if ( isbn==null || (isbn != null && isbn.length() != 13) ) {
            throw new Exception( "L'isbn doit faire 13 caractères." );
        }
    }
    
    
    private Integer validationNbPages( String nbPages ) throws Exception {      
        if ( nbPages==null || (nbPages != null && nbPages.length() < 1) ) {
            throw new Exception( "Veuillez entrer un nombre de pages." );
        }
        Integer nbPagesInt=Integer.parseInt(nbPages);
        if(nbPagesInt<1) {
            throw new Exception( "Le nombre de pages est erroné." );
        }
        return nbPagesInt;
    }
    
    private void validationLangue( String langue ) throws Exception {
        if ( langue==null || (langue != null && langue.length() < 3 )) {
            throw new Exception( "La langue doit contenir au moins 3 caractère." );
        }
    }
    
    private void validationTypeLivre( String typelivre ) throws Exception {
        ArrayList<String> typeList = new ArrayList<String>();
        typeList.add("roman");
        typeList.add("manga");
        typeList.add("documentaire");
        if ( typelivre==null || (typelivre != null && typelivre.length() < 1 ) || !typeList.contains(typelivre)) {
            throw new Exception( "Le type doit exister et contenir au moins 1 caractère." );
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