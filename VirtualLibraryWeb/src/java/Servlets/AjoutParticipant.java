/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlets;

import Beans.Participant;
import forms.AjoutParticipantForm;
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
public class AjoutParticipant extends HttpServlet {
    public static final String ATT_PARTICIPANT = "participant";
    public static final String ATT_FORM = "form";

    public static final String VUE_FORM   = "/Bibliotecaire/ajoutParticipant.jsp";
		
    public void doGet( HttpServletRequest request, HttpServletResponse response ) throws ServletException, IOException{
        /* Affichage de la page d'inscription */
     //   HttpServletResponse res = (HttpServletResponse) response;
        this.getServletContext().getRequestDispatcher( VUE_FORM  ).forward( request, response );
       // res.sendRedirect( VUE_FORM );
    }
	
    public void doPost( HttpServletRequest request, HttpServletResponse response ) throws ServletException, IOException{
        /* Préparation de l'objet formulaire */
        AjoutParticipantForm form = new AjoutParticipantForm();
		
        /* Appel au traitement et à la validation de la requête, et récupération du bean en résultant */
        Participant participant = form.AjoutAuteur(request );
		
        /* Stockage du formulaire et du bean dans l'objet request */
        request.setAttribute( ATT_FORM, form );
        request.setAttribute( ATT_PARTICIPANT, participant );
		
      
        this.getServletContext().getRequestDispatcher( VUE_FORM ).forward( request, response );
   
    }
}