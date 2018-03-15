<%-- 
    Document   : index
    Created on : 3 mars 2018, 15:53:01
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
        
        <h1>Hello World!</h1>
        <p><a href="<c:url value="/Inscription"/>">Créer un nouveau client</a></p>
        <p><a href="<c:url value="/Connexion"/>">Connexion client</a></p>
         <%-- Vérification de la présence d'un objet utilisateur en session --%>
                <c:if test="${!empty sessionScope.sessionUtilisateur}">
                    <p><a href="<c:url value="/Deconnexion"/>">Deconnexion</a></p>
                    <p><a href="<c:url value="/Bibliotecaire/AjoutParticipant"/>">Ajout participant</a></p>
                    <p><a href="<c:url value="/Bibliotecaire/AjoutLivre"/>">Ajout livre</a></p>
                </c:if>
        <div class="wrap">
   <div class="search">
      <input type="text" class="searchTerm" placeholder="What are you looking for?">
      <select  id="choixsearch" name="choixsearch">
                <option value="Titre">Titre</option>
                <option value="Auteur">Auteur</option>
      </select>        
      <button type="submit" class="searchButton">
        <i class="fa fa-search"></i>
     </button>
   </div>
</div>
        <c:import url="/inc/footer.jsp" />            
    </body>
</html>
