<%-- 
    Document   : afficheResultSearch
    Created on : 16 mars 2018, 07:10:21
    Author     : nicolas
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8" />
        <title>Liste des Participant</title>
        <link type="text/css" rel="stylesheet" href="/VirtualLibraryWeb/inc/style.css" />
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
         
         <table>
            <tr>
              <th>Titre</th>
              <th>Auteur</th>
              <th>Date de parution</th>
              <th>Description</th>
              <th>Modifier</th> 
              <th>Supprimer</th>
            </tr>
            <c:forEach var="livre" items="${list}">
                <tr>
                  <td><c:out value="${livre.titre}" /></td>
                  <td><ul><c:forEach var="parti" items="${livre.participant}"> <il><c:out value="${parti.nom}" /></il> </ul></td>
                  <td><c:out value="${livre.dateParution}" /></td>
                  <td><c:out value="${livre.description}" /></td>
                  <td><form action = "/VirtualLibraryWeb/Bibliotecaire/ModificationParticipant" method = "post"> 
                          <input type="hidden" id="id" name="id" value="${livre.DocumentId}">
                          <input type="submit" name="modifier" value="Modifier"> </input>
                      </form></td>
                  <td><form action = "" method = "post"> 
                          <input type="hidden" id="id" name="id" value="${livre.DocumentId}">
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


