<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsf/core" prefix="f" %>
<%@taglib uri="http://java.sun.com/jsf/html" prefix="h" %>
<f:view>
    <html>
        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
            <title>New Forfait</title>
            <link rel="stylesheet" type="text/css" href="/VirtualLibraryWeb/faces/jsfcrud.css" />
        </head>
        <body>
            <h:panelGroup id="messagePanel" layout="block">
                <h:messages errorStyle="color: red" infoStyle="color: green" layout="table"/>
            </h:panelGroup>
            <h1>New Forfait</h1>
            <h:form>
                <h:inputHidden id="validateCreateField" validator="#{forfait.validateCreate}" value="value"/>
                <h:panelGrid columns="2">
                    <h:outputText value="Nom:"/>
                    <h:inputText id="nom" value="#{forfait.forfait.nom}" title="Nom" required="true" requiredMessage="The nom field is required." />
                    <h:outputText value="Tarif:"/>
                    <h:inputText id="tarif" value="#{forfait.forfait.tarif}" title="Tarif" required="true" requiredMessage="The tarif field is required." />
                    <h:outputText value="Duree:"/>
                    <h:inputText id="duree" value="#{forfait.forfait.duree}" title="Duree" required="true" requiredMessage="The duree field is required." />

                </h:panelGrid>
                <br />
                <h:commandLink action="#{forfait.create}" value="Create"/>
                <br />
                <br />
                <h:commandLink action="#{forfait.listSetup}" value="Show All Forfait Items" immediate="true"/>
                <br />
                <br />
                <h:commandLink value="Index" action="welcome" immediate="true" />

            </h:form>
        </body>
    </html>
</f:view>
