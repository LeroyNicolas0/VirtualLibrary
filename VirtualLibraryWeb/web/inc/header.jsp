<%-- 
    Document   : header
    Created on : 14 mars 2018, 19:27:20
    Author     : nicolas
--%>

<%@ page pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<header id="header">
        <div id="header-inner">	
                <div id="logo">
                        <h1><a href="#">HelloWorld<span>Library</span></a></h1>
                </div>
                <div id="top-nav">
                        <ul>
                        <c:if test="${empty sessionScope.sessionUtilisateur}">   
                        <li><a href="<c:url value="/Connexion"/>">Sign In</a></li>
                        <li><a href="<c:url value="/Inscription"/>">Sign Up</a></li>
                        </c:if>
                        <c:if test="${!empty sessionScope.sessionUtilisateur}">   
                        <li><a href="#">Welcome, ${sessionScope.sessionUtilisateur.email}</a></li>
                        <li><a href="<c:url value="/Deconnexion"/>">Deconnexion</a></li>
                        </c:if>
                        </ul>
                </div>
                <div class="clr"></div>
        </div>
</header>
<div class="feature">
        <div class="feature-inner">
        <h1>"Qui veut se connaître, qu'il ouvre un livre."</h1>
        <h2> Jean Paulhan </h2>
        </div>
</div>
