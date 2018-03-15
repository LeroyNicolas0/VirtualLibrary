<%-- 
    Document   : ajoutParticipant
    Created on : 14 mars 2018, 14:32:42
    Author     : nicolas
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
        <form method="post" action="AjoutParticipant">
            <fieldset>
                <legend>Ajouter un participant</legend>
                <p>Vous pouvez ajouter un participant via ce formulaire.</p>

                <label for="nom">Nom </label>
                <input type="text" id="nom" name="nom" value="<c:out value="${participant.nom}"/>" size="20" maxlength="20" />
                <span class="erreur">${form.erreurs['nom']}</span>
                <br />
                
                <label for="nom">Prenom</label>
                <input type="text" id="prenom" name="prenom" value="<c:out value="${participant.prenom}"/>" size="20" maxlength="20" />
                <span class="erreur">${form.erreurs['prenom']}</span>
                <br />
                
                <label for="nom">Pseudonyme</label>
                <input type="text" id="pseudonyme" name="pseudonyme" value="<c:out value="${participant.pseudonyme}"/>" size="20" maxlength="20" />
                <span class="erreur">${form.erreurs['pseudonyme']}</span>
                <br />
                
                <label for="nom">Type Participant</label>
                <input list="typeparticipant" name="typeparticipant">
                    <datalist id="typeparticipant">
                      <option value="Internet Explorer">
                      <option value="Firefox">
                      <option value="Chrome">
                      <option value="Opera">
                      <option value="Safari">
                    </datalist>
                <span class="erreur">${form.erreurs['typeParticipant']}</span>
                <br />
                
                <input type="submit" value="Ajout Participant" class="sansLabel" />
                <br />
                
                <p class="${empty form.erreurs ? 'succes' : 'erreur'}">${form.resultat}</p>
            </fieldset>
        </form>
    </body>
</html>