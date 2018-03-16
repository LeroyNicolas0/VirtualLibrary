/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlets;

import Beans.Forfait;
import Dao.ForfaitDao;
import forms.ModificationForfaitForm;
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
 * @author Francis
 */
public class ModificationForfait extends HttpServlet {
    public static final String ATT_ID = "id";
    public static final String ATT_FORM = "form";
    public static final String ATT_SESSION_USER = "sessionUtilisateur";
    public static final String ATT_MOD = "modifier";
    public static final String ATT_FORFAIT = "forfait";
    
    public static final String VUE_SUCCES = "/Bibliotecaire/modificationForfait.jsp";
    public static final String VUE_FORM   = "/Bibliotecaire/modificationForfait.jsp";
    
    @EJB
    private ForfaitDao forfaitDao;
    	
    public void doGet( HttpServletRequest request, HttpServletResponse response ) throws ServletException, IOException{
        /* Affichage de la page d'inscription */
        this.getServletContext().getRequestDispatcher( VUE_FORM  ).forward( request, response );
    }
	
    public void doPost( HttpServletRequest request, HttpServletResponse response ) throws ServletException, IOException{
        if(request.getParameter(ATT_MOD)!=null){
            
            int id=Integer.parseInt(request.getParameter(ATT_ID).toString());             
            Forfait forfait=forfaitDao.trouverParId(id);          
            request.setAttribute(ATT_FORFAIT, forfait);

            this.getServletContext().getRequestDispatcher( VUE_FORM ).forward( request, response );
        }
        else {
            /* Préparation de l'objet formulaire */
            ModificationForfaitForm form = new ModificationForfaitForm(forfaitDao);

            /* Appel au traitement et à la validation de la requête, et récupération du bean en résultant */
            Forfait forfait = form.modificationForfait( request );
            /* Récupération de la session depuis la requête */
            HttpSession session = request.getSession();	
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
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
}