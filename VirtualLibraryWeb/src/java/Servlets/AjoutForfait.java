/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlets;

import Beans.Forfait;
import Dao.ForfaitDao;
import forms.AjoutForfaitForm;
import java.io.IOException;
import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author nicolas
 */
public class AjoutForfait extends HttpServlet {
    public static final String ATT_FORFAIT = "forfait";
    public static final String ATT_FORM = "form";

    public static final String VUE_FORM   = "/Bibliotecaire/ajoutForfait.jsp";
     public static final String VUE_SUCCES = "/Bibliotecaire/ajoutForfait.jsp";
    
     @EJB
    private ForfaitDao forfaitDao;
		
    public void doGet( HttpServletRequest request, HttpServletResponse response ) throws ServletException, IOException{
        /* Affichage de la page d'inscription */
     //   HttpServletResponse res = (HttpServletResponse) response;
        this.getServletContext().getRequestDispatcher( VUE_FORM  ).forward( request, response );
       // res.sendRedirect( VUE_FORM );
    }
	
    public void doPost( HttpServletRequest request, HttpServletResponse response ) throws ServletException, IOException{
        /* Préparation de l'objet formulaire */
        AjoutForfaitForm form = new AjoutForfaitForm(forfaitDao);
		
        /* Appel au traitement et à la validation de la requête, et récupération du bean en résultant */
        Forfait forfait = form.AjoutForfait(request );
		
        /* Stockage du formulaire et du bean dans l'objet request */
        request.setAttribute( ATT_FORM, form );
        request.setAttribute( ATT_FORFAIT, forfait );
		
      
        if ( form.getErreurs().isEmpty() ) {
            /* Si aucune erreur, alors affichage de la fiche récapitulative */
            this.getServletContext().getRequestDispatcher( VUE_FORM ).forward( request, response );
        } else {
            /* Sinon, ré-affichage du formulaire de création avec les erreurs */
            this.getServletContext().getRequestDispatcher( VUE_FORM ).forward( request, response );
        }
   
    }
}