<%-- 
    Document   : modificationForfait
    Created on : 16 mars 2018, 06:13:02
    Author     : Francis
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8" />
        <title>Modification de forfait</title>
        <link type="text/css" rel="stylesheet" href="/VirtualLibraryWeb/inc/style.css" />
    </head>
    <body>
         <c:import url="/inc/header.jsp" />
        
        <form method="post" action="">
            <fieldset>
                <legend>Modification de forfait</legend>
                <p>Vous pouvez modifier un forfait via ce formulaire.</p>

                <label for="nom">Forfait </label>
                <input type="hidden" id="id" name="id" value="${forfait.forfaitID}">
                <input type="nom" id="nom" name="nom" value="<c:out value="${forfait.nom}"/>" size="20" maxlength="20" />
                <span class="erreur">${form.erreurs['nom']}</span>
                <br />
                
                <label for="nom">tarif </label>
                <input type="hidden" id="id" name="id" value="${forfait.forfaitID}">
                <input type="tarif" id="tarif" name="tarif" value="<c:out value="${forfait.tarif}"/>" min="0" />
                <span class="erreur">${form.erreurs['tarif']}</span>
                <br />
                
                <label for="nom">duree </label>
                <input type="hidden" id="id" name="id" value="${forfait.forfaitID}">
                <input type="duree" id="duree" name="duree" value="<c:out value="${forfait.duree}"/>" min="1"/>
                <span class="erreur">${form.erreurs['duree']}</span>
                <br />
                

                
                <input type="submit" value="modification" class="sansLabel" />
                <br />
                
                <p class="${empty form.erreurs ? 'succes' : 'erreur'}">${form.resultat}</p>
            </fieldset>
        </form>
                                
        <c:import url="/inc/footer.jsp" />  
    </body>
</html>
