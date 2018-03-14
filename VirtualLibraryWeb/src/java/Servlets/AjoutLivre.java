/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlets;

import Beans.Livre;
import forms.AjoutLivreForm;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author nicolas
 */
public class AjoutLivre extends HttpServlet {
    public static final String ATT_LIVRE = "livre";
    public static final String ATT_FORM = "form";

    public static final String VUE_FORM   = "/Bibliotecaire/ajoutLivre.jsp";
		
    public void doGet( HttpServletRequest request, HttpServletResponse response ) throws ServletException, IOException{
        /* Affichage de la page d'inscription */
        this.getServletContext().getRequestDispatcher( VUE_FORM  ).forward( request, response );
    }
	
    public void doPost( HttpServletRequest request, HttpServletResponse response ) throws ServletException, IOException{
        /* Préparation de l'objet formulaire */
        AjoutLivreForm form = new AjoutLivreForm();
		
        /* Appel au traitement et à la validation de la requête, et récupération du bean en résultant */
        Livre participant = form.AjoutLivre(request);
		
        /* Stockage du formulaire et du bean dans l'objet request */
        request.setAttribute( ATT_FORM, form );
        request.setAttribute( ATT_LIVRE, participant );
		
        this.getServletContext().getRequestDispatcher( VUE_FORM ).forward( request, response );
   
    }
}
