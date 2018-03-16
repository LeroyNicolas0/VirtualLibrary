<%-- 
    Document   : ajoutForfait
    Created on : 16 mars 2018, 00:40:35
    Author     : Francis
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8" />
        <title>Inscription</title>
        <link type="text/css" rel="stylesheet" href="<c:url value="/inc/style.css"/>" />
    </head>
    <body>
        <form method="post" action="AjoutForfait">
            <fieldset>
                <legend>Ajouter un forfait</legend>
                <p>Vous pouvez ajouter un forfait via ce formulaire.</p>

                <label for="nom">Nom </label>
                <input type="text" id="nom" name="nom" value="<c:out value="${forfait.nom}"/>" size="20" maxlength="20" />
                <span class="erreur">${form.erreurs['nom']}</span>
                <br />
                
                <label for="tarif">Tarif</label>
                <input type="text" id="tarif" name="tarif" value="<c:out value="${forfait.tarif}"/>" min="0" />
                <span class="erreur">${form.erreurs['tarif']}</span>
                <br />
                
                <label for="duree">Duree</label>
                <input type="text" id="duree" name="duree" value="<c:out value="${forfait.duree}"/>" min="1" />
                <span class="erreur">${form.erreurs['duree']}</span>
                <br />
                
                
                <input type="submit" value="Ajout Forfait" class="sansLabel" />
                <br />
                
                <p class="${empty form.erreurs ? 'succes' : 'erreur'}">${form.resultat}</p>
            </fieldset>
        </form>
    </body>
</html>
