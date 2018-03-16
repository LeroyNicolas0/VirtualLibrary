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
        
        <div class="wrap">
            <div class="search">
              <form method="post" action="/VirtualLibraryWeb/Search">
                <fieldset>
                <input type="text" name="searchTerm" class="searchTerm" placeholder="What are you looking for?">
                <!--<select  id="choixsearch" name="choixsearch">
                    <option value="Titre">Titre</option>
                    <option value="Auteur">Auteur</option>
                </select> -->       
                <button type="submit" class="searchButton">
                     <i class="fa fa-search"></i>
                </button>
               </fieldset>
             </form>
            </div>
        </div>
        
        
        
        <div class="under-search">
          <%-- Vérification de la présence d'un objet utilisateur en session --%>
            <c:if test="${!empty sessionScope.sessionUtilisateur}">
                <div id="content">
				<div id="content-inner">
				
					<main id="contentbar">
						<div class="article">
                                                    <h3><p><a href="<c:url value="/Bibliotecaire/ListeForfait"/>">Liste forfait</a></p></h3>
						
							<h3><p><a href="<c:url value="/Bibliotecaire/ListeMotCle"/>">Liste Tag</a></p></h3>
						
							<h3><p><a href="<c:url value="/Bibliotecaire/ListeParticipant"/>">Liste Auteur</a></p></h3>
						</div>
                                               
					</main>
                                    </div>
                    </div>
               
            </c:if>
        </div>   
            
        <c:import url="/inc/footer.jsp" />            
    </body>
</html>
