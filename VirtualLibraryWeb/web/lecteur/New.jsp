<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsf/core" prefix="f" %>
<%@taglib uri="http://java.sun.com/jsf/html" prefix="h" %>
<f:view>
    <html>
        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
            <title>New Lecteur</title>
            <link rel="stylesheet" type="text/css" href="/VirtualLibraryWeb/faces/jsfcrud.css" />
        </head>
        <body>
            <h:panelGroup id="messagePanel" layout="block">
                <h:messages errorStyle="color: red" infoStyle="color: green" layout="table"/>
            </h:panelGroup>
            <h1>New Lecteur</h1>
            <h:form>
                <h:inputHidden id="validateCreateField" validator="#{lecteur.validateCreate}" value="value"/>
                <h:panelGrid columns="2">
                    <h:outputText value="EstBibliothecaire:"/>
                    <h:inputText id="estBibliothecaire" value="#{lecteur.lecteur.estBibliothecaire}" title="EstBibliothecaire" required="true" requiredMessage="The estBibliothecaire field is required." />
                    <h:outputText value="Prenom:"/>
                    <h:inputText id="prenom" value="#{lecteur.lecteur.prenom}" title="Prenom" required="true" requiredMessage="The prenom field is required." />
                    <h:outputText value="Nom:"/>
                    <h:inputText id="nom" value="#{lecteur.lecteur.nom}" title="Nom" required="true" requiredMessage="The nom field is required." />
                    <h:outputText value="DateNaissance (MM/dd/yyyy):"/>
                    <h:inputText id="dateNaissance" value="#{lecteur.lecteur.dateNaissance}" title="DateNaissance" required="true" requiredMessage="The dateNaissance field is required." >
                        <f:convertDateTime pattern="MM/dd/yyyy" />
                    </h:inputText>
                    <h:outputText value="Login:"/>
                    <h:inputText id="login" value="#{lecteur.lecteur.login}" title="Login" required="true" requiredMessage="The login field is required." />
                    <h:outputText value="Password:"/>
                    <h:inputText id="password" value="#{lecteur.lecteur.password}" title="Password" required="true" requiredMessage="The password field is required." />
                    <h:outputText value="Mail:"/>
                    <h:inputText id="mail" value="#{lecteur.lecteur.mail}" title="Mail" required="true" requiredMessage="The mail field is required." />
                    <h:outputText value="DateInscription (MM/dd/yyyy):"/>
                    <h:inputText id="dateInscription" value="#{lecteur.lecteur.dateInscription}" title="DateInscription" required="true" requiredMessage="The dateInscription field is required." >
                        <f:convertDateTime pattern="MM/dd/yyyy" />
                    </h:inputText>
                    <h:outputText value="EmpruntCollection:"/>
                    <h:selectManyListbox id="empruntCollection" value="#{lecteur.lecteur.jsfcrud_transform[jsfcrud_class['jsf.util.JsfUtil'].jsfcrud_method.collectionToArray][jsfcrud_class['jsf.util.JsfUtil'].jsfcrud_method.arrayToList].empruntCollection}" title="EmpruntCollection" size="6" converter="#{emprunt.converter}" >
                        <f:selectItems value="#{emprunt.empruntItemsAvailableSelectMany}"/>
                    </h:selectManyListbox>
                    <h:outputText value="AbonnementCollection:"/>
                    <h:selectManyListbox id="abonnementCollection" value="#{lecteur.lecteur.jsfcrud_transform[jsfcrud_class['jsf.util.JsfUtil'].jsfcrud_method.collectionToArray][jsfcrud_class['jsf.util.JsfUtil'].jsfcrud_method.arrayToList].abonnementCollection}" title="AbonnementCollection" size="6" converter="#{abonnement.converter}" >
                        <f:selectItems value="#{abonnement.abonnementItemsAvailableSelectMany}"/>
                    </h:selectManyListbox>
                    <h:outputText value="ReservationCollection:"/>
                    <h:selectManyListbox id="reservationCollection" value="#{lecteur.lecteur.jsfcrud_transform[jsfcrud_class['jsf.util.JsfUtil'].jsfcrud_method.collectionToArray][jsfcrud_class['jsf.util.JsfUtil'].jsfcrud_method.arrayToList].reservationCollection}" title="ReservationCollection" size="6" converter="#{reservation.converter}" >
                        <f:selectItems value="#{reservation.reservationItemsAvailableSelectMany}"/>
                    </h:selectManyListbox>

                </h:panelGrid>
                <br />
                <h:commandLink action="#{lecteur.create}" value="Create"/>
                <br />
                <br />
                <h:commandLink action="#{lecteur.listSetup}" value="Show All Lecteur Items" immediate="true"/>
                <br />
                <br />
                <h:commandLink value="Index" action="welcome" immediate="true" />

            </h:form>
        </body>
    </html>
</f:view>
