<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsf/core" prefix="f" %>
<%@taglib uri="http://java.sun.com/jsf/html" prefix="h" %>
<f:view>
    <html>
        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
            <title>Administrateur Detail</title>
            <link rel="stylesheet" type="text/css" href="/VirtualLibraryWeb/faces/jsfcrud.css" />
        </head>
        <body>
            <h:panelGroup id="messagePanel" layout="block">
                <h:messages errorStyle="color: red" infoStyle="color: green" layout="table"/>
            </h:panelGroup>
            <h1>Administrateur Detail</h1>
            <h:form>
                <h:panelGrid columns="2">
                    <h:outputText value="AdministrateurId:"/>
                    <h:outputText value="#{administrateur.administrateur.administrateurId}" title="AdministrateurId" />
                    <h:outputText value="Prenom:"/>
                    <h:outputText value="#{administrateur.administrateur.prenom}" title="Prenom" />
                    <h:outputText value="Nom:"/>
                    <h:outputText value="#{administrateur.administrateur.nom}" title="Nom" />
                    <h:outputText value="DateNaissance:"/>
                    <h:outputText value="#{administrateur.administrateur.dateNaissance}" title="DateNaissance" >
                        <f:convertDateTime pattern="MM/dd/yyyy" />
                    </h:outputText>
                    <h:outputText value="Login:"/>
                    <h:outputText value="#{administrateur.administrateur.login}" title="Login" />
                    <h:outputText value="Password:"/>
                    <h:outputText value="#{administrateur.administrateur.password}" title="Password" />
                    <h:outputText value="Mail:"/>
                    <h:outputText value="#{administrateur.administrateur.mail}" title="Mail" />
                    <h:outputText value="DateInscription:"/>
                    <h:outputText value="#{administrateur.administrateur.dateInscription}" title="DateInscription" >
                        <f:convertDateTime pattern="MM/dd/yyyy" />
                    </h:outputText>


                </h:panelGrid>
                <br />
                <h:commandLink action="#{administrateur.remove}" value="Destroy">
                    <f:param name="jsfcrud.currentAdministrateur" value="#{jsfcrud_class['jsf.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][administrateur.administrateur][administrateur.converter].jsfcrud_invoke}" />
                </h:commandLink>
                <br />
                <br />
                <h:commandLink action="#{administrateur.editSetup}" value="Edit">
                    <f:param name="jsfcrud.currentAdministrateur" value="#{jsfcrud_class['jsf.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][administrateur.administrateur][administrateur.converter].jsfcrud_invoke}" />
                </h:commandLink>
                <br />
                <h:commandLink action="#{administrateur.createSetup}" value="New Administrateur" />
                <br />
                <h:commandLink action="#{administrateur.listSetup}" value="Show All Administrateur Items"/>
                <br />
                <br />
                <h:commandLink value="Index" action="welcome" immediate="true" />

            </h:form>
        </body>
    </html>
</f:view>
