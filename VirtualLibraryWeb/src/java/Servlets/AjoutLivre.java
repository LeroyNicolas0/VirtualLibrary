/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlets;

import Beans.Document;
import Beans.MotCle;
import Beans.Participant;
import Dao.LivreDao;
import Dao.MotCleDao;
import Dao.ParticipantDao;
import forms.AjoutLivreForm;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.ejb.EJB;
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
    public static final String ATT_MOTCLE = "listMotCle";
    public static final String ATT_AUTEUR = "listAuteur";
    public static final String ATT_FORM = "form";

    public static final String VUE_FORM   = "/Bibliotecaire/ajoutLivre.jsp";
	
    @EJB
    private LivreDao livreDao;
    
    @EJB
    private ParticipantDao participantDao;
    
    @EJB
    private MotCleDao motCleDao;
    
    public void doGet( HttpServletRequest request, HttpServletResponse response ) throws ServletException, IOException{
        List<MotCle> listMotCle=motCleDao.getAll();
        request.setAttribute(ATT_MOTCLE, listMotCle);
        List<Participant> listAuteur=participantDao.getAll();
        request.setAttribute(ATT_AUTEUR, listAuteur);
       
        this.getServletContext().getRequestDispatcher( VUE_FORM  ).forward( request, response );
    }
	
    public void doPost( HttpServletRequest request, HttpServletResponse response ) throws ServletException, IOException{
        /* Préparation de l'objet formulaire */
        AjoutLivreForm form = new AjoutLivreForm(livreDao,participantDao, motCleDao);
		
        /* Appel au traitement et à la validation de la requête, et récupération du bean en résultant */
        Document livre = form.AjoutLivre(request);
	    
        /* Stockage du formulaire et du bean dans l'objet request */
        request.setAttribute( ATT_FORM, form );
        request.setAttribute( ATT_LIVRE, livre );
		
        this.getServletContext().getRequestDispatcher( VUE_FORM ).forward( request, response );
   
    }
}
