/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlets;

import Beans.Forfait;
import Dao.DAOException;
import Dao.ForfaitDao;
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
 * @author Francis
 */
public class ListeForfait extends HttpServlet {
public static final String ATT_LIST = "list";
     public static final String ATT_ID = "id";
     private Map<String, String> erreurs      = new HashMap<String, String>();

    public static final String VUE_LIST   = "/Bibliotecaire/listeForfait.jsp";
    @EJB
    private ForfaitDao     forfaitDao;
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Forfait> forfaitList=forfaitDao.getAll();
        request.setAttribute(ATT_LIST, forfaitList);
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
                
        Forfait forfait=forfaitDao.trouverParId(id);
        try {
           forfaitDao.delete(forfait); 
        } catch ( Exception e ) {
            setErreur("e", e.getMessage());
        }
        
        request.setAttribute("erreur", erreurs);
        List<Forfait> forfaitList=forfaitDao.getAll();
        request.setAttribute(ATT_LIST, forfaitList);
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
