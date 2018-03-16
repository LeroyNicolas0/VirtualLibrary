<%-- 
    Document   : Inscription
    Created on : 13 mars 2018, 14:19:42
    Author     : nicolas
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8" />
        <title>Inscription</title>
        <link type="text/css" rel="stylesheet" href="inc/style.css" />
    </head>
    <body>
        <c:import url="/inc/header.jsp" />
        
        <form method="post" action="Inscription">
            <fieldset>
                <legend>Inscription</legend>
                <p>Vous pouvez vous inscrire via ce formulaire.</p>

                <label for="email">Adresse email <span class="requis">*</span></label>
                <input type="email" id="email" name="email" value="<c:out value="${utilisateur.email}"/>" size="20" maxlength="60" />
                <span class="erreur">${form.erreurs['email']}</span>
                <br />

                <label for="motdepasse">Mot de passe <span class="requis">*</span></label>
                <input type="password" id="motdepasse" name="motdepasse" value="" size="20" maxlength="20" />
                <span class="erreur">${form.erreurs['motdepasse']}</span>
                <br />

                <label for="confirmation">Confirmation du mot de passe <span class="requis">*</span></label>
                <input type="password" id="confirmation" name="confirmation" value="" size="20" maxlength="20" />
                <span class="erreur">${form.erreurs['confirmation']}</span>
                <br />

                <label for="nom">Login</label>
                <input type="text" id="login" name="login" value="<c:out value="${utilisateur.login}"/>" size="20" maxlength="20" />
                <span class="erreur">${form.erreurs['login']}</span>
                <br />
                
                <label for="nom">Nom</label>
                <input type="text" id="nom" name="nom" value="<c:out value="${utilisateur.nom}"/>" size="20" maxlength="20" />
                <span class="erreur">${form.erreurs['nom']}</span>
                <br />
                
                <label for="nom">Prenom</label>
                <input type="text" id="prenom" name="prenom" value="<c:out value="${utilisateur.prenom}"/>" size="20" maxlength="20" />
                <span class="erreur">${form.erreurs['prenom']}</span>
                <br />
                
                <label for="dateparution">Date de naissance</label>
                <input type="date" name="datenaissance" value="<c:out value="${utilisateur.dateNaissance}"/>" >
                <span class="erreur">${form.erreurs['datenaissance']}</span>
                <br />

                <input type="submit" value="Inscription" class="sansLabel" />
                <br />
                
                <p class="${empty form.erreurs ? 'succes' : 'erreur'}">${form.resultat}</p>
            </fieldset>
        </form>
                                
        <c:import url="/inc/footer.jsp" />  
    </body>
</html>