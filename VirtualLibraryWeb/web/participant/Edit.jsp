<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsf/core" prefix="f" %>
<%@taglib uri="http://java.sun.com/jsf/html" prefix="h" %>
<f:view>
    <html>
        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
            <title>Editing Participant</title>
            <link rel="stylesheet" type="text/css" href="/VirtualLibraryWeb/faces/jsfcrud.css" />
        </head>
        <body>
            <h:panelGroup id="messagePanel" layout="block">
                <h:messages errorStyle="color: red" infoStyle="color: green" layout="table"/>
            </h:panelGroup>
            <h1>Editing Participant</h1>
            <h:form>
                <h:panelGrid columns="2">
                    <h:outputText value="ParticipantId:"/>
                    <h:outputText value="#{participant.participant.participantId}" title="ParticipantId" />
                    <h:outputText value="Pseudonyme:"/>
                    <h:inputText id="pseudonyme" value="#{participant.participant.pseudonyme}" title="Pseudonyme" />
                    <h:outputText value="Prenom:"/>
                    <h:inputText id="prenom" value="#{participant.participant.prenom}" title="Prenom" />
                    <h:outputText value="Nom:"/>
                    <h:inputText id="nom" value="#{participant.participant.nom}" title="Nom" />
                    <h:outputText value="DateNaissance (MM/dd/yyyy):"/>
                    <h:inputText id="dateNaissance" value="#{participant.participant.dateNaissance}" title="DateNaissance" required="true" requiredMessage="The dateNaissance field is required." >
                        <f:convertDateTime pattern="MM/dd/yyyy" />
                    </h:inputText>
                    <h:outputText value="DocumentCollection:"/>
                    <h:selectManyListbox id="documentCollection" value="#{participant.participant.jsfcrud_transform[jsfcrud_class['jsf.util.JsfUtil'].jsfcrud_method.collectionToArray][jsfcrud_class['jsf.util.JsfUtil'].jsfcrud_method.arrayToList].documentCollection}" title="DocumentCollection" size="6" converter="#{document.converter}" >
                        <f:selectItems value="#{document.documentItemsAvailableSelectMany}"/>
                    </h:selectManyListbox>
                    <h:outputText value="TypeParticpantIdFk:"/>
                    <h:selectOneMenu id="typeParticpantIdFk" value="#{participant.participant.typeParticpantIdFk}" title="TypeParticpantIdFk" required="true" requiredMessage="The typeParticpantIdFk field is required." >
                        <f:selectItems value="#{typeParticipant.typeParticipantItemsAvailableSelectOne}"/>
                    </h:selectOneMenu>

                </h:panelGrid>
                <br />
                <h:commandLink action="#{participant.edit}" value="Save">
                    <f:param name="jsfcrud.currentParticipant" value="#{jsfcrud_class['jsf.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][participant.participant][participant.converter].jsfcrud_invoke}"/>
                </h:commandLink>
                <br />
                <br />
                <h:commandLink action="#{participant.detailSetup}" value="Show" immediate="true">
                    <f:param name="jsfcrud.currentParticipant" value="#{jsfcrud_class['jsf.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][participant.participant][participant.converter].jsfcrud_invoke}"/>
                </h:commandLink>
                <br />
                <h:commandLink action="#{participant.listSetup}" value="Show All Participant Items" immediate="true"/>
                <br />
                <br />
                <h:commandLink value="Index" action="welcome" immediate="true" />

            </h:form>
        </body>
    </html>
</f:view>
