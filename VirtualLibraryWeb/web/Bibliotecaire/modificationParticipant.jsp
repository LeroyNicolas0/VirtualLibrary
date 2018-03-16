<%-- 
    Document   : modificationParticipant
    Created on : 16 mars 2018, 06:07:33
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
         <c:import url="/inc/header.jsp" />
        <form method="post" action="">
            <fieldset>
                <legend>Modifier un participant</legend>
                <p>Vous pouvez modifier un participant via ce formulaire.</p>
                 <input type="hidden" id="id" name="id" value="${participant.participantId}">
                
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
                
                <label for="dateparution">Date de naissance</label>
                <input type="date" name="datenaissance" value="<c:out value="${participant.dateNaissance}"/>" >
                <span class="erreur">${form.erreurs['datenaissance']}</span>
                <br />
                
                <label for="typeparticipant">Type Participant</label>
                <input list="typeparticipant" name="typeparticipant">
                    <datalist id="typeparticipant" >
                        
                      <c:forEach var="name"  items="${requestScope['typeparti']}" >
                            <option value="${name}">
                        </c:forEach>
                    </datalist>
                <span class="erreur">${form.erreurs['typeparticipant']}</span>
                <br />
                
                <input type="submit" value="Modifier Participant" class="sansLabel" />
                <br />
                
                <p class="${empty form.erreurs ? 'succes' : 'erreur'}">${form.resultat}</p>
            </fieldset>
        </form>
             <c:import url="/inc/footer.jsp" />            
    </body>
</html>