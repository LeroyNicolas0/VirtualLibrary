<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsf/core" prefix="f" %>
<%@taglib uri="http://java.sun.com/jsf/html" prefix="h" %>
<f:view>
    <html>
        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
            <title>New Abonnement</title>
            <link rel="stylesheet" type="text/css" href="/VirtualLibraryWeb/faces/jsfcrud.css" />
        </head>
        <body>
            <h:panelGroup id="messagePanel" layout="block">
                <h:messages errorStyle="color: red" infoStyle="color: green" layout="table"/>
            </h:panelGroup>
            <h1>New Abonnement</h1>
            <h:form>
                <h:inputHidden id="validateCreateField" validator="#{abonnement.validateCreate}" value="value"/>
                <h:panelGrid columns="2">
                    <h:outputText value="DateDebut (MM/dd/yyyy):"/>
                    <h:inputText id="dateDebut" value="#{abonnement.abonnement.dateDebut}" title="DateDebut" required="true" requiredMessage="The dateDebut field is required." >
                        <f:convertDateTime pattern="MM/dd/yyyy" />
                    </h:inputText>
                    <h:outputText value="DateFin (MM/dd/yyyy):"/>
                    <h:inputText id="dateFin" value="#{abonnement.abonnement.dateFin}" title="DateFin" required="true" requiredMessage="The dateFin field is required." >
                        <f:convertDateTime pattern="MM/dd/yyyy" />
                    </h:inputText>
                    <h:outputText value="AbonnementCollection:"/>
                    <h:selectManyListbox id="abonnementCollection" value="#{abonnement.abonnement.jsfcrud_transform[jsfcrud_class['jsf.util.JsfUtil'].jsfcrud_method.collectionToArray][jsfcrud_class['jsf.util.JsfUtil'].jsfcrud_method.arrayToList].abonnementCollection}" title="AbonnementCollection" size="6" converter="#{abonnement.converter}" >
                        <f:selectItems value="#{abonnement.abonnementItemsAvailableSelectMany}"/>
                    </h:selectManyListbox>
                    <h:outputText value="ForfaitIdFk:"/>
                    <h:selectOneMenu id="forfaitIdFk" value="#{abonnement.abonnement.forfaitIdFk}" title="ForfaitIdFk" required="true" requiredMessage="The forfaitIdFk field is required." >
                        <f:selectItems value="#{abonnement.abonnementItemsAvailableSelectOne}"/>
                    </h:selectOneMenu>
                    <h:outputText value="LecteurIdFk:"/>
                    <h:selectOneMenu id="lecteurIdFk" value="#{abonnement.abonnement.lecteurIdFk}" title="LecteurIdFk" required="true" requiredMessage="The lecteurIdFk field is required." >
                        <f:selectItems value="#{lecteur.lecteurItemsAvailableSelectOne}"/>
                    </h:selectOneMenu>

                </h:panelGrid>
                <br />
                <h:commandLink action="#{abonnement.create}" value="Create"/>
                <br />
                <br />
                <h:commandLink action="#{abonnement.listSetup}" value="Show All Abonnement Items" immediate="true"/>
                <br />
                <br />
                <h:commandLink value="Index" action="welcome" immediate="true" />

            </h:form>
        </body>
    </html>
</f:view>
