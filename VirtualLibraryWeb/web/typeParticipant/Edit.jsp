<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsf/core" prefix="f" %>
<%@taglib uri="http://java.sun.com/jsf/html" prefix="h" %>
<f:view>
    <html>
        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
            <title>Editing TypeParticipant</title>
            <link rel="stylesheet" type="text/css" href="/VirtualLibraryWeb/faces/jsfcrud.css" />
        </head>
        <body>
            <h:panelGroup id="messagePanel" layout="block">
                <h:messages errorStyle="color: red" infoStyle="color: green" layout="table"/>
            </h:panelGroup>
            <h1>Editing TypeParticipant</h1>
            <h:form>
                <h:panelGrid columns="2">
                    <h:outputText value="TypeParticipantId:"/>
                    <h:outputText value="#{typeParticipant.typeParticipant.typeParticipantId}" title="TypeParticipantId" />
                    <h:outputText value="Nom:"/>
                    <h:inputText id="nom" value="#{typeParticipant.typeParticipant.nom}" title="Nom" required="true" requiredMessage="The nom field is required." />
                    <h:outputText value="ParticipantCollection:"/>
                    <h:selectManyListbox id="participantCollection" value="#{typeParticipant.typeParticipant.jsfcrud_transform[jsfcrud_class['jsf.util.JsfUtil'].jsfcrud_method.collectionToArray][jsfcrud_class['jsf.util.JsfUtil'].jsfcrud_method.arrayToList].participantCollection}" title="ParticipantCollection" size="6" converter="#{participant.converter}" >
                        <f:selectItems value="#{participant.participantItemsAvailableSelectMany}"/>
                    </h:selectManyListbox>

                </h:panelGrid>
                <br />
                <h:commandLink action="#{typeParticipant.edit}" value="Save">
                    <f:param name="jsfcrud.currentTypeParticipant" value="#{jsfcrud_class['jsf.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][typeParticipant.typeParticipant][typeParticipant.converter].jsfcrud_invoke}"/>
                </h:commandLink>
                <br />
                <br />
                <h:commandLink action="#{typeParticipant.detailSetup}" value="Show" immediate="true">
                    <f:param name="jsfcrud.currentTypeParticipant" value="#{jsfcrud_class['jsf.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][typeParticipant.typeParticipant][typeParticipant.converter].jsfcrud_invoke}"/>
                </h:commandLink>
                <br />
                <h:commandLink action="#{typeParticipant.listSetup}" value="Show All TypeParticipant Items" immediate="true"/>
                <br />
                <br />
                <h:commandLink value="Index" action="welcome" immediate="true" />

            </h:form>
        </body>
    </html>
</f:view>
