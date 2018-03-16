/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlets;

import Beans.Participant;
import Dao.ParticipantDao;
import Dao.TypeParticipantDAO;
import forms.ModificationParticipantForm;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.Map;
import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author nicolas
 */
public class ModificationParticipant extends HttpServlet {

 public static final String ATT_LIST = "list";
     public static final String ATT_ID = "id";
    public static final String ATT_FORM = "form";
    public static final String ATT_SESSION_USER = "sessionUtilisateur";
    public static final String ATT_MOD = "modifier";
    public static final String ATT_PARTICIPANT = "participant";
    public static final String ATT_PARTI = "typeparti";
    
    public static final String VUE_SUCCES = "/Bibliotecaire/modificationParticipant.jsp";
    public static final String VUE_FORM   = "/Bibliotecaire/modificationParticipant.jsp";
    
    @EJB
    private ParticipantDao    participantDao;
    @EJB
    private TypeParticipantDAO   tPDao;
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<String> liste = tPDao.FindAllString();
        request.setAttribute( ATT_PARTI, liste );
        this.getServletContext().getRequestDispatcher( VUE_FORM  ).forward( request, response );
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        if(request.getParameter(ATT_MOD)!=null){
            int id=Integer.parseInt(request.getParameter(ATT_ID).toString());             
            Participant participant=participantDao.trouverParId(id);
            request.setAttribute(ATT_PARTICIPANT, participant);
            List<String> liste = tPDao.FindAllString();
            request.setAttribute( ATT_PARTI, liste );
            
            this.getServletContext().getRequestDispatcher( VUE_FORM ).forward( request, response );

        }
        else {
                ModificationParticipantForm form = new ModificationParticipantForm(participantDao,tPDao);
                Participant participant= form.modificationParticipant( request );
                /* Stockage du formulaire et du bean dans l'objet request */
            request.setAttribute( ATT_FORM, form );
            request.setAttribute( ATT_PARTICIPANT, participant );

            if ( form.getErreurs().isEmpty() ) {
                /* Si aucune erreur, alors affichage de la fiche récapitulative */
                this.getServletContext().getRequestDispatcher( VUE_FORM ).forward( request, response );
            } else {
                /* Sinon, ré-affichage du formulaire de création avec les erreurs */
                this.getServletContext().getRequestDispatcher( VUE_FORM ).forward( request, response );
            }        
        }
   }
    
    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}