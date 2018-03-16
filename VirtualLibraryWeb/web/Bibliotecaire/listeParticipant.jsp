<%-- 
    Document   : listeParticipant
    Created on : 16 mars 2018, 04:33:52
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
        
         <table>
            <tr>
              <th>Participant</th>
              <th>Prenom</th>
              <th>Pseudonyme</th>
              <th>Date de naissance</th>
              <th>Modifier</th> 
              <th>Supprimer</th>
            </tr>
            <c:forEach var="participant" items="${list}">
                <tr>
                  <td><c:out value="${participant.nom}" /></td>
                  <td><c:out value="${participant.prenom}" /></td>
                  <td><c:out value="${participant.pseudonyme}" /></td>
                  <td><c:out value="${participant.dateNaissance}" /></td>
                  <td><c:out value="mod" /></td>
                  <td><form action = "" method = "post"> 
                          <input type="hidden" id="id" name="id" value="${participant.participantId}">
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

