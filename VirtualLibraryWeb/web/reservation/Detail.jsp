<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsf/core" prefix="f" %>
<%@taglib uri="http://java.sun.com/jsf/html" prefix="h" %>
<f:view>
    <html>
        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
            <title>Reservation Detail</title>
            <link rel="stylesheet" type="text/css" href="/VirtualLibraryWeb/faces/jsfcrud.css" />
        </head>
        <body>
            <h:panelGroup id="messagePanel" layout="block">
                <h:messages errorStyle="color: red" infoStyle="color: green" layout="table"/>
            </h:panelGroup>
            <h1>Reservation Detail</h1>
            <h:form>
                <h:panelGrid columns="2">
                    <h:outputText value="ReservationId:"/>
                    <h:outputText value="#{reservation.reservation.reservationId}" title="ReservationId" />
                    <h:outputText value="DateReservation:"/>
                    <h:outputText value="#{reservation.reservation.dateReservation}" title="DateReservation" >
                        <f:convertDateTime pattern="MM/dd/yyyy" />
                    </h:outputText>
                    <h:outputText value="DocumentIdFk:"/>
                    <h:panelGroup>
                        <h:outputText value="#{reservation.reservation.documentIdFk}"/>
                        <h:panelGroup rendered="#{reservation.reservation.documentIdFk != null}">
                            <h:outputText value=" ("/>
                            <h:commandLink value="Show" action="#{document.detailSetup}">
                                <f:param name="jsfcrud.currentReservation" value="#{jsfcrud_class['jsf.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][reservation.reservation][reservation.converter].jsfcrud_invoke}"/>
                                <f:param name="jsfcrud.currentDocument" value="#{jsfcrud_class['jsf.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][reservation.reservation.documentIdFk][document.converter].jsfcrud_invoke}"/>
                                <f:param name="jsfcrud.relatedController" value="reservation"/>
                                <f:param name="jsfcrud.relatedControllerType" value="jsf.ReservationController"/>
                            </h:commandLink>
                            <h:outputText value=" "/>
                            <h:commandLink value="Edit" action="#{document.editSetup}">
                                <f:param name="jsfcrud.currentReservation" value="#{jsfcrud_class['jsf.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][reservation.reservation][reservation.converter].jsfcrud_invoke}"/>
                                <f:param name="jsfcrud.currentDocument" value="#{jsfcrud_class['jsf.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][reservation.reservation.documentIdFk][document.converter].jsfcrud_invoke}"/>
                                <f:param name="jsfcrud.relatedController" value="reservation"/>
                                <f:param name="jsfcrud.relatedControllerType" value="jsf.ReservationController"/>
                            </h:commandLink>
                            <h:outputText value=" "/>
                            <h:commandLink value="Destroy" action="#{document.destroy}">
                                <f:param name="jsfcrud.currentReservation" value="#{jsfcrud_class['jsf.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][reservation.reservation][reservation.converter].jsfcrud_invoke}"/>
                                <f:param name="jsfcrud.currentDocument" value="#{jsfcrud_class['jsf.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][reservation.reservation.documentIdFk][document.converter].jsfcrud_invoke}"/>
                                <f:param name="jsfcrud.relatedController" value="reservation"/>
                                <f:param name="jsfcrud.relatedControllerType" value="jsf.ReservationController"/>
                            </h:commandLink>
                            <h:outputText value=" )"/>
                        </h:panelGroup>
                    </h:panelGroup>
                    <h:outputText value="LecteurIdFk:"/>
                    <h:panelGroup>
                        <h:outputText value="#{reservation.reservation.lecteurIdFk}"/>
                        <h:panelGroup rendered="#{reservation.reservation.lecteurIdFk != null}">
                            <h:outputText value=" ("/>
                            <h:commandLink value="Show" action="#{lecteur.detailSetup}">
                                <f:param name="jsfcrud.currentReservation" value="#{jsfcrud_class['jsf.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][reservation.reservation][reservation.converter].jsfcrud_invoke}"/>
                                <f:param name="jsfcrud.currentLecteur" value="#{jsfcrud_class['jsf.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][reservation.reservation.lecteurIdFk][lecteur.converter].jsfcrud_invoke}"/>
                                <f:param name="jsfcrud.relatedController" value="reservation"/>
                                <f:param name="jsfcrud.relatedControllerType" value="jsf.ReservationController"/>
                            </h:commandLink>
                            <h:outputText value=" "/>
                            <h:commandLink value="Edit" action="#{lecteur.editSetup}">
                                <f:param name="jsfcrud.currentReservation" value="#{jsfcrud_class['jsf.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][reservation.reservation][reservation.converter].jsfcrud_invoke}"/>
                                <f:param name="jsfcrud.currentLecteur" value="#{jsfcrud_class['jsf.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][reservation.reservation.lecteurIdFk][lecteur.converter].jsfcrud_invoke}"/>
                                <f:param name="jsfcrud.relatedController" value="reservation"/>
                                <f:param name="jsfcrud.relatedControllerType" value="jsf.ReservationController"/>
                            </h:commandLink>
                            <h:outputText value=" "/>
                            <h:commandLink value="Destroy" action="#{lecteur.destroy}">
                                <f:param name="jsfcrud.currentReservation" value="#{jsfcrud_class['jsf.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][reservation.reservation][reservation.converter].jsfcrud_invoke}"/>
                                <f:param name="jsfcrud.currentLecteur" value="#{jsfcrud_class['jsf.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][reservation.reservation.lecteurIdFk][lecteur.converter].jsfcrud_invoke}"/>
                                <f:param name="jsfcrud.relatedController" value="reservation"/>
                                <f:param name="jsfcrud.relatedControllerType" value="jsf.ReservationController"/>
                            </h:commandLink>
                            <h:outputText value=" )"/>
                        </h:panelGroup>
                    </h:panelGroup>


                </h:panelGrid>
                <br />
                <h:commandLink action="#{reservation.remove}" value="Destroy">
                    <f:param name="jsfcrud.currentReservation" value="#{jsfcrud_class['jsf.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][reservation.reservation][reservation.converter].jsfcrud_invoke}" />
                </h:commandLink>
                <br />
                <br />
                <h:commandLink action="#{reservation.editSetup}" value="Edit">
                    <f:param name="jsfcrud.currentReservation" value="#{jsfcrud_class['jsf.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][reservation.reservation][reservation.converter].jsfcrud_invoke}" />
                </h:commandLink>
                <br />
                <h:commandLink action="#{reservation.createSetup}" value="New Reservation" />
                <br />
                <h:commandLink action="#{reservation.listSetup}" value="Show All Reservation Items"/>
                <br />
                <br />
                <h:commandLink value="Index" action="welcome" immediate="true" />

            </h:form>
        </body>
    </html>
</f:view>
