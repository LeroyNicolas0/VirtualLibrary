<%-- 
    Document   : listeForfait
    Created on : 16 mars 2018, 04:51:37
    Author     : Francis
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8" />
        <title>Liste des forfaits</title>
        <link type="text/css" rel="stylesheet" href="/VirtualLibraryWeb/inc/style.css" />
    </head>
    <body>
         <c:import url="/inc/header.jsp" />
        
         <table>
            <tr>
              <th>Forfait</th>
              <th>Tarif</th>
              <th>Duree</th>
              <th>Modifier</th> 
              <th>Supprimer</th>
              <form action = "/VirtualLibraryWeb/Bibliotecaire/AjoutForfait" method = "post"> 
                          <input type="submit" name="modifier" value="Ajouter"> </input>
                      </form>
            </tr>
            
            <c:forEach var="forfait" items="${list}">
                <tr>
                  <td><c:out value="${forfait.nom}" /></td>
                  <td><c:out value="${forfait.tarif}" /></td>
                  <td><c:out value="${forfait.duree}" /></td>
                  <td><form action = "/VirtualLibraryWeb/Bibliotecaire/ModificationForfait" method = "post"> 
                          <input type="hidden" id="id" name="id" value="${forfait.forfaitID}">
                          <input type="submit" name="modifier" value="Modifier"> </input>
                      </form></td>
                  <td><form action = "" method = "post"> 
                          <input type="hidden" id="id" name="id" value="${forfait.forfaitID}">
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
