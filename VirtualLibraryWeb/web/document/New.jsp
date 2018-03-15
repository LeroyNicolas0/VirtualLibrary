<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsf/core" prefix="f" %>
<%@taglib uri="http://java.sun.com/jsf/html" prefix="h" %>
<f:view>
    <html>
        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
            <title>New Document</title>
            <link rel="stylesheet" type="text/css" href="/VirtualLibraryWeb/faces/jsfcrud.css" />
        </head>
        <body>
            <h:panelGroup id="messagePanel" layout="block">
                <h:messages errorStyle="color: red" infoStyle="color: green" layout="table"/>
            </h:panelGroup>
            <h1>New Document</h1>
            <h:form>
                <h:inputHidden id="validateCreateField" validator="#{document.validateCreate}" value="value"/>
                <h:panelGrid columns="2">
                    <h:outputText value="Titre:"/>
                    <h:inputText id="titre" value="#{document.document.titre}" title="Titre" required="true" requiredMessage="The titre field is required." />
                    <h:outputText value="DateParution (MM/dd/yyyy):"/>
                    <h:inputText id="dateParution" value="#{document.document.dateParution}" title="DateParution" required="true" requiredMessage="The dateParution field is required." >
                        <f:convertDateTime pattern="MM/dd/yyyy" />
                    </h:inputText>
                    <h:outputText value="Description:"/>
                    <h:inputTextarea rows="4" cols="30" id="description" value="#{document.document.description}" title="Description" required="true" requiredMessage="The description field is required." />
                    <h:outputText value="NombrePages:"/>
                    <h:inputText id="nombrePages" value="#{document.document.nombrePages}" title="NombrePages" />
                    <h:outputText value="Isbn:"/>
                    <h:inputText id="isbn" value="#{document.document.isbn}" title="Isbn" />
                    <h:outputText value="Langue:"/>
                    <h:inputText id="langue" value="#{document.document.langue}" title="Langue" required="true" requiredMessage="The langue field is required." />
                    <h:outputText value="Editeur:"/>
                    <h:inputText id="editeur" value="#{document.document.editeur}" title="Editeur" />
                    <h:outputText value="Validation:"/>
                    <h:inputText id="validation" value="#{document.document.validation}" title="Validation" />
                    <h:outputText value="MaisonDisque:"/>
                    <h:inputText id="maisonDisque" value="#{document.document.maisonDisque}" title="MaisonDisque" />
                    <h:outputText value="NombrePiste:"/>
                    <h:inputText id="nombrePiste" value="#{document.document.nombrePiste}" title="NombrePiste" />
                    <h:outputText value="SocieteProduction:"/>
                    <h:inputText id="societeProduction" value="#{document.document.societeProduction}" title="SocieteProduction" />
                    <h:outputText value="MaisonEdition:"/>
                    <h:inputText id="maisonEdition" value="#{document.document.maisonEdition}" title="MaisonEdition" />
                    <h:outputText value="Duree:"/>
                    <h:inputText id="duree" value="#{document.document.duree}" title="Duree" />
                    <h:outputText value="PublicVise:"/>
                    <h:inputText id="publicVise" value="#{document.document.publicVise}" title="PublicVise" />
                    <h:outputText value="TypePeriodique:"/>
                    <h:inputText id="typePeriodique" value="#{document.document.typePeriodique}" title="TypePeriodique" />
                    <h:outputText value="Issn:"/>
                    <h:inputText id="issn" value="#{document.document.issn}" title="Issn" />
                    <h:outputText value="NumeroMagazine:"/>
                    <h:inputText id="numeroMagazine" value="#{document.document.numeroMagazine}" title="NumeroMagazine" />
                    <h:outputText value="VisibleLecteur:"/>
                    <h:inputText id="visibleLecteur" value="#{document.document.visibleLecteur}" title="VisibleLecteur" required="true" requiredMessage="The visibleLecteur field is required." />
                    <h:outputText value="LienCouverture:"/>
                    <h:inputTextarea rows="4" cols="30" id="lienCouverture" value="#{document.document.lienCouverture}" title="LienCouverture" />
                    <h:outputText value="NombreExemplaire:"/>
                    <h:inputText id="nombreExemplaire" value="#{document.document.nombreExemplaire}" title="NombreExemplaire" required="true" requiredMessage="The nombreExemplaire field is required." />
                    <h:outputText value="PaysInterditCollection:"/>
                    <h:selectManyListbox id="paysInterditCollection" value="#{document.document.jsfcrud_transform[jsfcrud_class['jsf.util.JsfUtil'].jsfcrud_method.collectionToArray][jsfcrud_class['jsf.util.JsfUtil'].jsfcrud_method.arrayToList].paysInterditCollection}" title="PaysInterditCollection" size="6" converter="#{paysInterdit.converter}" >
                        <f:selectItems value="#{paysInterdit.paysInterditItemsAvailableSelectMany}"/>
                    </h:selectManyListbox>
                    <h:outputText value="MotCleCollection:"/>
                    <h:selectManyListbox id="motCleCollection" value="#{document.document.jsfcrud_transform[jsfcrud_class['jsf.util.JsfUtil'].jsfcrud_method.collectionToArray][jsfcrud_class['jsf.util.JsfUtil'].jsfcrud_method.arrayToList].motCleCollection}" title="MotCleCollection" size="6" converter="#{motCle.converter}" >
                        <f:selectItems value="#{motCle.motCleItemsAvailableSelectMany}"/>
                    </h:selectManyListbox>
                    <h:outputText value="ParticipantCollection:"/>
                    <h:selectManyListbox id="participantCollection" value="#{document.document.jsfcrud_transform[jsfcrud_class['jsf.util.JsfUtil'].jsfcrud_method.collectionToArray][jsfcrud_class['jsf.util.JsfUtil'].jsfcrud_method.arrayToList].participantCollection}" title="ParticipantCollection" size="6" converter="#{participant.converter}" >
                        <f:selectItems value="#{participant.participantItemsAvailableSelectMany}"/>
                    </h:selectManyListbox>
                    <h:outputText value="EmpruntCollection:"/>
                    <h:selectManyListbox id="empruntCollection" value="#{document.document.jsfcrud_transform[jsfcrud_class['jsf.util.JsfUtil'].jsfcrud_method.collectionToArray][jsfcrud_class['jsf.util.JsfUtil'].jsfcrud_method.arrayToList].empruntCollection}" title="EmpruntCollection" size="6" converter="#{emprunt.converter}" >
                        <f:selectItems value="#{emprunt.empruntItemsAvailableSelectMany}"/>
                    </h:selectManyListbox>
                    <h:outputText value="TypeDocumentIdFk:"/>
                    <h:selectOneMenu id="typeDocumentIdFk" value="#{document.document.typeDocumentIdFk}" title="TypeDocumentIdFk" required="true" requiredMessage="The typeDocumentIdFk field is required." >
                        <f:selectItems value="#{typeDocument.typeDocumentItemsAvailableSelectOne}"/>
                    </h:selectOneMenu>
                    <h:outputText value="ReservationCollection:"/>
                    <h:selectManyListbox id="reservationCollection" value="#{document.document.jsfcrud_transform[jsfcrud_class['jsf.util.JsfUtil'].jsfcrud_method.collectionToArray][jsfcrud_class['jsf.util.JsfUtil'].jsfcrud_method.arrayToList].reservationCollection}" title="ReservationCollection" size="6" converter="#{reservation.converter}" >
                        <f:selectItems value="#{reservation.reservationItemsAvailableSelectMany}"/>
                    </h:selectManyListbox>

                </h:panelGrid>
                <br />
                <h:commandLink action="#{document.create}" value="Create"/>
                <br />
                <br />
                <h:commandLink action="#{document.listSetup}" value="Show All Document Items" immediate="true"/>
                <br />
                <br />
                <h:commandLink value="Index" action="welcome" immediate="true" />

            </h:form>
        </body>
    </html>
</f:view>
