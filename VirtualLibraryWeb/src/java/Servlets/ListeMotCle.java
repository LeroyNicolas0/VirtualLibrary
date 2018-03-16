/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlets;

import Beans.MotCle;
import Dao.DAOException;
import Dao.MotCleDao;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author atyla
 */
public class ListeMotCle extends HttpServlet {
     public static final String ATT_LIST = "list";
     public static final String ATT_ID = "id";
     public static final String ATT_SUP = "supprimer";
     private Map<String, String> erreurs      = new HashMap<String, String>();

    public static final String VUE_LIST   = "/Bibliotecaire/listeMotCle.jsp";
    @EJB
    private MotCleDao     motCleDao;
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<MotCle> motCleList=motCleDao.getAll();
        request.setAttribute(ATT_LIST, motCleList);
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
        int id=Integer.parseInt(request.getParameter(ATT_ID).toString());
                
        MotCle motCle=motCleDao.trouverParId(id);
        try {
           motCleDao.delete(motCle); 
        } catch ( Exception e ) {
            setErreur("e", e.getMessage());
        }
        
        request.setAttribute("erreur", erreurs);
        List<MotCle> motCleList=motCleDao.getAll();
        request.setAttribute(ATT_LIST, motCleList);
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
