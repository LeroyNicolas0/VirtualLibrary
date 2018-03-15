<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@taglib prefix="f" uri="http://java.sun.com/jsf/core"%>
<%@taglib prefix="h" uri="http://java.sun.com/jsf/html"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<%--
    This file is an entry point for JavaServer Faces application.
--%>
<f:view>
    <html>
        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
            <title>JSP Page</title>
<link rel="stylesheet" type="text/css" href="/VirtualLibraryWeb/faces/jsfcrud.css" />
        </head>
        <body>
            <h1><h:outputText value="JavaServer Faces"/></h1>
                <h:form>
                    <h:commandLink action="#{typeParticipant.listSetup}" value="Show All TypeParticipant Items"/>
                </h:form>

                <h:form>
                    <h:commandLink action="#{typeDocument.listSetup}" value="Show All TypeDocument Items"/>
                </h:form>

                <h:form>
                    <h:commandLink action="#{reservation.listSetup}" value="Show All Reservation Items"/>
                </h:form>

                <h:form>
                    <h:commandLink action="#{paysInterdit.listSetup}" value="Show All PaysInterdit Items"/>
                </h:form>

                <h:form>
                    <h:commandLink action="#{participant.listSetup}" value="Show All Participant Items"/>
                </h:form>

                <h:form>
                    <h:commandLink action="#{motCle.listSetup}" value="Show All MotCle Items"/>
                </h:form>

                <h:form>
                    <h:commandLink action="#{lecteur.listSetup}" value="Show All Lecteur Items"/>
                </h:form>

                <h:form>
                    <h:commandLink action="#{forfait.listSetup}" value="Show All Forfait Items"/>
                </h:form>

                <h:form>
                    <h:commandLink action="#{emprunt.listSetup}" value="Show All Emprunt Items"/>
                </h:form>

                <h:form>
                    <h:commandLink action="#{document.listSetup}" value="Show All Document Items"/>
                </h:form>

                <h:form>
                    <h:commandLink action="#{administrateur.listSetup}" value="Show All Administrateur Items"/>
                </h:form>

                <h:form>
                    <h:commandLink action="#{abonnement.listSetup}" value="Show All Abonnement Items"/>
                </h:form>

        </body>
    </html>
</f:view>
