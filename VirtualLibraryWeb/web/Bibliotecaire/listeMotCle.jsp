<%-- 
    Document   : listeMotCle
    Created on : Mar 16, 2018, 1:49:05 AM
    Author     : atyla
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8" />
        <title>Liste des mots-clés</title>
        <link type="text/css" rel="stylesheet" href="/VirtualLibraryWeb/inc/style.css" />
    </head>
    <body>
         <c:import url="/inc/header.jsp" />
        
         <table>
            <tr>
              <th>Mot-cé</th>
              <th>Modifier</th> 
              <th>Supprimer</th>
            </tr>
            <c:forEach var="motcle" items="${list}">
                <tr>
                  <td><c:out value="${motcle.nom}" /></td>
                  <td><c:out value="mod" /></td>
                  <td><c:out value="sup" /></td>
               </tr>
              </c:forEach>
          </table>                                
        <c:import url="/inc/footer.jsp" />  
    </body>
</html>
