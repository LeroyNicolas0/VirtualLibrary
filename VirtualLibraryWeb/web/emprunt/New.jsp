<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsf/core" prefix="f" %>
<%@taglib uri="http://java.sun.com/jsf/html" prefix="h" %>
<f:view>
    <html>
        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
            <title>New Emprunt</title>
            <link rel="stylesheet" type="text/css" href="/VirtualLibraryWeb/faces/jsfcrud.css" />
        </head>
        <body>
            <h:panelGroup id="messagePanel" layout="block">
                <h:messages errorStyle="color: red" infoStyle="color: green" layout="table"/>
            </h:panelGroup>
            <h1>New Emprunt</h1>
            <h:form>
                <h:inputHidden id="validateCreateField" validator="#{emprunt.validateCreate}" value="value"/>
                <h:panelGrid columns="2">
                    <h:outputText value="DateEmprunt (MM/dd/yyyy):"/>
                    <h:inputText id="dateEmprunt" value="#{emprunt.emprunt.dateEmprunt}" title="DateEmprunt" required="true" requiredMessage="The dateEmprunt field is required." >
                        <f:convertDateTime pattern="MM/dd/yyyy" />
                    </h:inputText>
                    <h:outputText value="DateRetour (MM/dd/yyyy):"/>
                    <h:inputText id="dateRetour" value="#{emprunt.emprunt.dateRetour}" title="DateRetour" required="true" requiredMessage="The dateRetour field is required." >
                        <f:convertDateTime pattern="MM/dd/yyyy" />
                    </h:inputText>
                    <h:outputText value="DocumentIdFk:"/>
                    <h:selectOneMenu id="documentIdFk" value="#{emprunt.emprunt.documentIdFk}" title="DocumentIdFk" required="true" requiredMessage="The documentIdFk field is required." >
                        <f:selectItems value="#{document.documentItemsAvailableSelectOne}"/>
                    </h:selectOneMenu>
                    <h:outputText value="LecteurIdFk:"/>
                    <h:selectOneMenu id="lecteurIdFk" value="#{emprunt.emprunt.lecteurIdFk}" title="LecteurIdFk" required="true" requiredMessage="The lecteurIdFk field is required." >
                        <f:selectItems value="#{lecteur.lecteurItemsAvailableSelectOne}"/>
                    </h:selectOneMenu>

                </h:panelGrid>
                <br />
                <h:commandLink action="#{emprunt.create}" value="Create"/>
                <br />
                <br />
                <h:commandLink action="#{emprunt.listSetup}" value="Show All Emprunt Items" immediate="true"/>
                <br />
                <br />
                <h:commandLink value="Index" action="welcome" immediate="true" />

            </h:form>
        </body>
    </html>
</f:view>
