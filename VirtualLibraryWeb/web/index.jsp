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
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>
        <p><a href="<c:url value="/Inscription"/>">Créer un nouveau client</a></p>
        <p><a href="<c:url value="/Connexion"/>">Connexion client</a></p>
         <%-- Vérification de la présence d'un objet utilisateur en session --%>
                <c:if test="${!empty sessionScope.sessionUtilisateur}">
                    <p><a href="<c:url value="/Deconnexion"/>">Deconnexion</a></p>
                </c:if>
    </body>
</html>
