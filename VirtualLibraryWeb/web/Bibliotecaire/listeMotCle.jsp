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
              <th>Mot-clé</th>
              <th>Modifier</th> 
              <th>Supprimer</th>
              <form action = "/VirtualLibraryWeb/Bibliotecaire/AjoutMotCle" method = "get"> 
                          <input type="submit" name="modifier" value="Ajouter"> </input>
                      </form>
            </tr>
            <c:forEach var="motcle" items="${list}">
                <tr>
                  <td><c:out value="${motcle.nom}" /></td>
                  <td><form action = "/VirtualLibraryWeb/Bibliotecaire/ModificationMotCle" method = "post"> 
                          <input type="hidden" id="id" name="id" value="${motcle.motCleID}">
                          <input type="submit" name="modifier" value="Modifier"> </input>
                      </form></td>
                  <td><form action = "" method = "post"> 
                          <input type="hidden" id="id" name="id" value="${motcle.motCleID}">
                          <input type="submit" name="supprimer" value="Supprimer"> </input>
                      </form>
                  </td>
               </tr>
              </c:forEach>
          </table>   
         <span class="erreur">${erreur['e']}</span>
        <c:import url="/inc/footer.jsp" />  
    </body>
</html>
