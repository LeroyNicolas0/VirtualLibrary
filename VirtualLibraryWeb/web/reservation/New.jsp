<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsf/core" prefix="f" %>
<%@taglib uri="http://java.sun.com/jsf/html" prefix="h" %>
<f:view>
    <html>
        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
            <title>New Reservation</title>
            <link rel="stylesheet" type="text/css" href="/VirtualLibraryWeb/faces/jsfcrud.css" />
        </head>
        <body>
            <h:panelGroup id="messagePanel" layout="block">
                <h:messages errorStyle="color: red" infoStyle="color: green" layout="table"/>
            </h:panelGroup>
            <h1>New Reservation</h1>
            <h:form>
                <h:inputHidden id="validateCreateField" validator="#{reservation.validateCreate}" value="value"/>
                <h:panelGrid columns="2">
                    <h:outputText value="DateReservation (MM/dd/yyyy):"/>
                    <h:inputText id="dateReservation" value="#{reservation.reservation.dateReservation}" title="DateReservation" required="true" requiredMessage="The dateReservation field is required." >
                        <f:convertDateTime pattern="MM/dd/yyyy" />
                    </h:inputText>
                    <h:outputText value="DocumentIdFk:"/>
                    <h:selectOneMenu id="documentIdFk" value="#{reservation.reservation.documentIdFk}" title="DocumentIdFk" required="true" requiredMessage="The documentIdFk field is required." >
                        <f:selectItems value="#{document.documentItemsAvailableSelectOne}"/>
                    </h:selectOneMenu>
                    <h:outputText value="LecteurIdFk:"/>
                    <h:selectOneMenu id="lecteurIdFk" value="#{reservation.reservation.lecteurIdFk}" title="LecteurIdFk" required="true" requiredMessage="The lecteurIdFk field is required." >
                        <f:selectItems value="#{lecteur.lecteurItemsAvailableSelectOne}"/>
                    </h:selectOneMenu>

                </h:panelGrid>
                <br />
                <h:commandLink action="#{reservation.create}" value="Create"/>
                <br />
                <br />
                <h:commandLink action="#{reservation.listSetup}" value="Show All Reservation Items" immediate="true"/>
                <br />
                <br />
                <h:commandLink value="Index" action="welcome" immediate="true" />

            </h:form>
        </body>
    </html>
</f:view>
