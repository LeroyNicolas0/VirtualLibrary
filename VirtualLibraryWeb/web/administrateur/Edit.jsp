<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsf/core" prefix="f" %>
<%@taglib uri="http://java.sun.com/jsf/html" prefix="h" %>
<f:view>
    <html>
        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
            <title>Editing Administrateur</title>
            <link rel="stylesheet" type="text/css" href="/VirtualLibraryWeb/faces/jsfcrud.css" />
        </head>
        <body>
            <h:panelGroup id="messagePanel" layout="block">
                <h:messages errorStyle="color: red" infoStyle="color: green" layout="table"/>
            </h:panelGroup>
            <h1>Editing Administrateur</h1>
            <h:form>
                <h:panelGrid columns="2">
                    <h:outputText value="AdministrateurId:"/>
                    <h:outputText value="#{administrateur.administrateur.administrateurId}" title="AdministrateurId" />
                    <h:outputText value="Prenom:"/>
                    <h:inputText id="prenom" value="#{administrateur.administrateur.prenom}" title="Prenom" required="true" requiredMessage="The prenom field is required." />
                    <h:outputText value="Nom:"/>
                    <h:inputText id="nom" value="#{administrateur.administrateur.nom}" title="Nom" required="true" requiredMessage="The nom field is required." />
                    <h:outputText value="DateNaissance (MM/dd/yyyy):"/>
                    <h:inputText id="dateNaissance" value="#{administrateur.administrateur.dateNaissance}" title="DateNaissance" required="true" requiredMessage="The dateNaissance field is required." >
                        <f:convertDateTime pattern="MM/dd/yyyy" />
                    </h:inputText>
                    <h:outputText value="Login:"/>
                    <h:inputText id="login" value="#{administrateur.administrateur.login}" title="Login" required="true" requiredMessage="The login field is required." />
                    <h:outputText value="Password:"/>
                    <h:inputText id="password" value="#{administrateur.administrateur.password}" title="Password" required="true" requiredMessage="The password field is required." />
                    <h:outputText value="Mail:"/>
                    <h:inputText id="mail" value="#{administrateur.administrateur.mail}" title="Mail" required="true" requiredMessage="The mail field is required." />
                    <h:outputText value="DateInscription (MM/dd/yyyy):"/>
                    <h:inputText id="dateInscription" value="#{administrateur.administrateur.dateInscription}" title="DateInscription" required="true" requiredMessage="The dateInscription field is required." >
                        <f:convertDateTime pattern="MM/dd/yyyy" />
                    </h:inputText>

                </h:panelGrid>
                <br />
                <h:commandLink action="#{administrateur.edit}" value="Save">
                    <f:param name="jsfcrud.currentAdministrateur" value="#{jsfcrud_class['jsf.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][administrateur.administrateur][administrateur.converter].jsfcrud_invoke}"/>
                </h:commandLink>
                <br />
                <br />
                <h:commandLink action="#{administrateur.detailSetup}" value="Show" immediate="true">
                    <f:param name="jsfcrud.currentAdministrateur" value="#{jsfcrud_class['jsf.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][administrateur.administrateur][administrateur.converter].jsfcrud_invoke}"/>
                </h:commandLink>
                <br />
                <h:commandLink action="#{administrateur.listSetup}" value="Show All Administrateur Items" immediate="true"/>
                <br />
                <br />
                <h:commandLink value="Index" action="welcome" immediate="true" />

            </h:form>
        </body>
    </html>
</f:view>
