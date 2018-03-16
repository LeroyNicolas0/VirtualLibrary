/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlets;

import Beans.MotCle;
import Beans.Utilisateur;
import Dao.MotCleDao;
import Dao.UtilisateurDao;
import forms.AjoutMotCleForm;
import forms.InscriptionForm;
import java.io.IOException;
import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author atyla
 */
public class AjoutMotCle extends HttpServlet {

    public static final String ATT_USER = "motcle";
    public static final String ATT_FORM = "form";
    public static final String ATT_SESSION_USER = "sessionUtilisateur";
    
    public static final String VUE_SUCCES = "/Bibliotecaire/ajoutMotCle.jsp";
    public static final String VUE_FORM   = "/Bibliotecaire/ajoutMotCle.jsp";
    
    @EJB
    private MotCleDao motCleDao;
    	
    public void doGet( HttpServletRequest request, HttpServletResponse response ) throws ServletException, IOException{
        /* Affichage de la page d'inscription */
        this.getServletContext().getRequestDispatcher( VUE_FORM  ).forward( request, response );
    }
	
    public void doPost( HttpServletRequest request, HttpServletResponse response ) throws ServletException, IOException{
        /* Préparation de l'objet formulaire */
        AjoutMotCleForm form = new AjoutMotCleForm(motCleDao);
		
        /* Appel au traitement et à la validation de la requête, et récupération du bean en résultant */
        MotCle motCle = form.ajoutMotCle( request );
	/* Récupération de la session depuis la requête */
        HttpSession session = request.getSession();	
        /* Stockage du formulaire et du bean dans l'objet request */
        request.setAttribute( ATT_FORM, form );
        request.setAttribute( ATT_USER, motCle );
		
        if ( form.getErreurs().isEmpty() ) {
            /* Si aucune erreur, alors affichage de la fiche récapitulative */
            this.getServletContext().getRequestDispatcher( VUE_FORM ).forward( request, response );
        } else {
            /* Sinon, ré-affichage du formulaire de création avec les erreurs */
            this.getServletContext().getRequestDispatcher( VUE_FORM ).forward( request, response );
        }
    }
}
