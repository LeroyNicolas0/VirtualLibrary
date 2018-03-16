/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlets;

import Beans.Document;
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
public class Search extends HttpServlet {
    public static final String ATT_LIST = "list";
    public static final String ATT_SERC = "searchTerm";
    public static final String VUE_FORM   = "/WEB-INF/search.jsp";
    public static final String VUE_SUCCES = "/WEB-INF/afficheResultSearch.jsp";
    
    //@EJB
    //private LivreDao     livreDao;
    
    public void doGet( HttpServletRequest request, HttpServletResponse response ) throws ServletException, IOException{
        /* Affichage de la page d'inscription */
        this.getServletContext().getRequestDispatcher( VUE_FORM  ).forward( request, response );
    }
    
    public void doPost( HttpServletRequest request, HttpServletResponse response ) throws ServletException, IOException{
       /* if(request.getAttribute(ATT_SERC) == null)
        List<Document> docList = livreDao.getAll();
        request.setAttribute(ATT_LIST, docList);
        */
        this.getServletContext().getRequestDispatcher( VUE_SUCCES  ).forward( request, response );
    }
    
}
