<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsf/core" prefix="f" %>
<%@taglib uri="http://java.sun.com/jsf/html" prefix="h" %>
<f:view>
    <html>
        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
            <title>Listing Reservation Items</title>
            <link rel="stylesheet" type="text/css" href="/VirtualLibraryWeb/faces/jsfcrud.css" />
        </head>
        <body>
            <h:panelGroup id="messagePanel" layout="block">
                <h:messages errorStyle="color: red" infoStyle="color: green" layout="table"/>
            </h:panelGroup>
            <h1>Listing Reservation Items</h1>
            <h:form styleClass="jsfcrud_list_form">
                <h:outputText escape="false" value="(No Reservation Items Found)<br />" rendered="#{reservation.pagingInfo.itemCount == 0}" />
                <h:panelGroup rendered="#{reservation.pagingInfo.itemCount > 0}">
                    <h:outputText value="Item #{reservation.pagingInfo.firstItem + 1}..#{reservation.pagingInfo.lastItem} of #{reservation.pagingInfo.itemCount}"/>&nbsp;
                    <h:commandLink action="#{reservation.prev}" value="Previous #{reservation.pagingInfo.batchSize}" rendered="#{reservation.pagingInfo.firstItem >= reservation.pagingInfo.batchSize}"/>&nbsp;
                    <h:commandLink action="#{reservation.next}" value="Next #{reservation.pagingInfo.batchSize}" rendered="#{reservation.pagingInfo.lastItem + reservation.pagingInfo.batchSize <= reservation.pagingInfo.itemCount}"/>&nbsp;
                    <h:commandLink action="#{reservation.next}" value="Remaining #{reservation.pagingInfo.itemCount - reservation.pagingInfo.lastItem}"
                                   rendered="#{reservation.pagingInfo.lastItem < reservation.pagingInfo.itemCount && reservation.pagingInfo.lastItem + reservation.pagingInfo.batchSize > reservation.pagingInfo.itemCount}"/>
                    <h:dataTable value="#{reservation.reservationItems}" var="item" border="0" cellpadding="2" cellspacing="0" rowClasses="jsfcrud_odd_row,jsfcrud_even_row" rules="all" style="border:solid 1px">
                        <h:column>
                            <f:facet name="header">
                                <h:outputText value="ReservationId"/>
                            </f:facet>
                            <h:outputText value="#{item.reservationId}"/>
                        </h:column>
                        <h:column>
                            <f:facet name="header">
                                <h:outputText value="DateReservation"/>
                            </f:facet>
                            <h:outputText value="#{item.dateReservation}">
                                <f:convertDateTime pattern="MM/dd/yyyy" />
                            </h:outputText>
                        </h:column>
                        <h:column>
                            <f:facet name="header">
                                <h:outputText value="DocumentIdFk"/>
                            </f:facet>
                            <h:outputText value="#{item.documentIdFk}"/>
                        </h:column>
                        <h:column>
                            <f:facet name="header">
                                <h:outputText value="LecteurIdFk"/>
                            </f:facet>
                            <h:outputText value="#{item.lecteurIdFk}"/>
                        </h:column>
                        <h:column>
                            <f:facet name="header">
                                <h:outputText escape="false" value="&nbsp;"/>
                            </f:facet>
                            <h:commandLink value="Show" action="#{reservation.detailSetup}">
                                <f:param name="jsfcrud.currentReservation" value="#{jsfcrud_class['jsf.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][item][reservation.converter].jsfcrud_invoke}"/>
                            </h:commandLink>
                            <h:outputText value=" "/>
                            <h:commandLink value="Edit" action="#{reservation.editSetup}">
                                <f:param name="jsfcrud.currentReservation" value="#{jsfcrud_class['jsf.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][item][reservation.converter].jsfcrud_invoke}"/>
                            </h:commandLink>
                            <h:outputText value=" "/>
                            <h:commandLink value="Destroy" action="#{reservation.remove}">
                                <f:param name="jsfcrud.currentReservation" value="#{jsfcrud_class['jsf.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][item][reservation.converter].jsfcrud_invoke}"/>
                            </h:commandLink>
                        </h:column>

                    </h:dataTable>
                </h:panelGroup>
                <br />
                <h:commandLink action="#{reservation.createSetup}" value="New Reservation"/>
                <br />
                <br />
                <h:commandLink value="Index" action="welcome" immediate="true" />


            </h:form>
        </body>
    </html>
</f:view>
