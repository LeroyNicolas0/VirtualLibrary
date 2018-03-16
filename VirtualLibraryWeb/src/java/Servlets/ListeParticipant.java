/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlets;

import Beans.Participant;
import Dao.DAOException;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;
import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import Dao.ParticipantDao;
import java.util.List;

/**
 *
 * @author nicolas
 */
public class ListeParticipant extends HttpServlet {
 public static final String ATT_LIST = "list";
     public static final String ATT_ID = "id";
     private Map<String, String> erreurs      = new HashMap<String, String>();

    public static final String VUE_LIST   = "/Bibliotecaire/listeParticipant.jsp";
    @EJB
    private ParticipantDao    participantDao;
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Participant> participantList=participantDao.getAll();
        request.setAttribute(ATT_LIST, participantList);
        request.setAttribute(ATT_ID, "");
        this.getServletContext().getRequestDispatcher( VUE_LIST  ).forward( request, response );
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
        if(request.getParameter(ATT_ID)==null){
            throw new DAOException("nullnull");
        }
        int id=Integer.parseInt(request.getParameter(ATT_ID).toString());
                
        Participant participant=participantDao.trouverParId(id);
        try {
           participantDao.delete(participant); 
        } catch ( Exception e ) {
            setErreur("e", e.getMessage());
        }
        
        request.setAttribute("erreur", erreurs);
        List<Participant> participantList=participantDao.getAll();
        request.setAttribute(ATT_LIST, participantList);
        this.getServletContext().getRequestDispatcher( VUE_LIST  ).forward( request, response );
    }
    
    public Map<String, String> getErreurs() {
        return erreurs;
    }
    
    private void setErreur( String champ, String message ) {
        erreurs.put( champ, message );
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