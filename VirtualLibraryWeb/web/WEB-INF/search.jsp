<%-- 
    Document   : search
    Created on : 16 mars 2018, 06:57:18
    Author     : nicolas
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link type="text/css" rel="stylesheet" href="inc/style.css" />
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">
        <title>JSP Page</title>
    </head>
    <body>
        <c:import url="/inc/header.jsp" />
        
        <div class="wrap">
            <div class="search">
              <form method="post" action="/Search">
                <fieldset>
                <input type="text" name ="searchTerm" class="searchTerm" placeholder="What are you looking for?">
                <select  id="choixsearch" name="choixsearch">
                    <option value="Titre">Titre</option>
                    <option value="Auteur">Auteur</option>
                </select>        
                <button type="submit" class="searchButton">
                     <i class="fa fa-search"></i>
                </button>
               </fieldset>
             </form>
            </div>
        </div>
        
        <c:import url="/inc/footer.jsp" />            
    </body>
</html>

