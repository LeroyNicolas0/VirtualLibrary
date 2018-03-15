<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsf/core" prefix="f" %>
<%@taglib uri="http://java.sun.com/jsf/html" prefix="h" %>
<f:view>
    <html>
        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
            <title>Editing Reservation</title>
            <link rel="stylesheet" type="text/css" href="/VirtualLibraryWeb/faces/jsfcrud.css" />
        </head>
        <body>
            <h:panelGroup id="messagePanel" layout="block">
                <h:messages errorStyle="color: red" infoStyle="color: green" layout="table"/>
            </h:panelGroup>
            <h1>Editing Reservation</h1>
            <h:form>
                <h:panelGrid columns="2">
                    <h:outputText value="ReservationId:"/>
                    <h:outputText value="#{reservation.reservation.reservationId}" title="ReservationId" />
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
                <h:commandLink action="#{reservation.edit}" value="Save">
                    <f:param name="jsfcrud.currentReservation" value="#{jsfcrud_class['jsf.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][reservation.reservation][reservation.converter].jsfcrud_invoke}"/>
                </h:commandLink>
                <br />
                <br />
                <h:commandLink action="#{reservation.detailSetup}" value="Show" immediate="true">
                    <f:param name="jsfcrud.currentReservation" value="#{jsfcrud_class['jsf.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][reservation.reservation][reservation.converter].jsfcrud_invoke}"/>
                </h:commandLink>
                <br />
                <h:commandLink action="#{reservation.listSetup}" value="Show All Reservation Items" immediate="true"/>
                <br />
                <br />
                <h:commandLink value="Index" action="welcome" immediate="true" />

            </h:form>
        </body>
    </html>
</f:view>
