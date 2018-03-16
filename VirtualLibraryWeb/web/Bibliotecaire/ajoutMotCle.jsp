<%-- 
    Document   : ajoutMotCle
    Created on : Mar 15, 2018, 11:14:31 PM
    Author     : atyla
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8" />
        <title>Ajout de mot-clé</title>
        <link type="text/css" rel="stylesheet" href="/VirtualLibraryWeb/inc/style.css" />
    </head>
    <body>
         <c:import url="/inc/header.jsp" />
        
        <form method="post" action="/Bibliotecaire/AjoutMotCle">
            <fieldset>
                <legend>Ajout de mot-clé</legend>
                <p>Vous pouvez ajoutez un mot-clé via ce formulaire.</p>

                <label for="nom">Mot-clé <span class="requis">*</span></label>
                <input type="nom" id="nom" name="nom" value="<c:out value="${motcle.nom}"/>" size="20" maxlength="20" />
                <span class="erreur">${form.erreurs['nom']}</span>
                <br />
                
                <input type="submit" value="AjoutMotCle" class="sansLabel" />
                <br />
                
                <p class="${empty form.erreurs ? 'succes' : 'erreur'}">${form.resultat}</p>
            </fieldset>
        </form>
                                
        <c:import url="/inc/footer.jsp" />  
    </body>
</html>
