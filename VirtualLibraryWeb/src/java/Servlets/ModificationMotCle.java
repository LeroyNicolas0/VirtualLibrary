/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlets;

import Beans.MotCle;
import Dao.MotCleDao;
import forms.ModificationMotCleForm;
import java.io.IOException;
import java.io.PrintWriter;
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
public class ModificationMotCle extends HttpServlet {
    public static final String ATT_ID = "id";
    public static final String ATT_FORM = "form";
    public static final String ATT_SESSION_USER = "sessionUtilisateur";
    public static final String ATT_MOD = "modifier";
    public static final String ATT_MOTCLE = "motcle";
    
    public static final String VUE_SUCCES = "/Bibliotecaire/modificationMotCle.jsp";
    public static final String VUE_FORM   = "/Bibliotecaire/modificationMotCle.jsp";
    
    @EJB
    private MotCleDao motCleDao;
    	
    public void doGet( HttpServletRequest request, HttpServletResponse response ) throws ServletException, IOException{
        /* Affichage de la page d'inscription */
        this.getServletContext().getRequestDispatcher( VUE_FORM  ).forward( request, response );
    }
	
    public void doPost( HttpServletRequest request, HttpServletResponse response ) throws ServletException, IOException{
        if(request.getParameter(ATT_MOD)!=null){
            
            int id=Integer.parseInt(request.getParameter(ATT_ID).toString());             
            MotCle motCle=motCleDao.trouverParId(id);
            request.setAttribute(ATT_MOTCLE, motCle);

            this.getServletContext().getRequestDispatcher( VUE_FORM ).forward( request, response );
        }
        else {
            /* Préparation de l'objet formulaire */
            ModificationMotCleForm form = new ModificationMotCleForm(motCleDao);

            /* Appel au traitement et à la validation de la requête, et récupération du bean en résultant */
            MotCle motCle = form.modificationMotCle( request );
            /* Récupération de la session depuis la requête */
            HttpSession session = request.getSession();	
            /* Stockage du formulaire et du bean dans l'objet request */
            request.setAttribute( ATT_FORM, form );
            request.setAttribute( ATT_MOTCLE, motCle );

            if ( form.getErreurs().isEmpty() ) {
                /* Si aucune erreur, alors affichage de la fiche récapitulative */
                this.getServletContext().getRequestDispatcher( VUE_FORM ).forward( request, response );
            } else {
                /* Sinon, ré-affichage du formulaire de création avec les erreurs */
                this.getServletContext().getRequestDispatcher( VUE_FORM ).forward( request, response );
            }
        }
        
    }
}
