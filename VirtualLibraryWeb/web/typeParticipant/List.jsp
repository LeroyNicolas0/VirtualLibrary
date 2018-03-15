<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsf/core" prefix="f" %>
<%@taglib uri="http://java.sun.com/jsf/html" prefix="h" %>
<f:view>
    <html>
        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
            <title>Listing TypeParticipant Items</title>
            <link rel="stylesheet" type="text/css" href="/VirtualLibraryWeb/faces/jsfcrud.css" />
        </head>
        <body>
            <h:panelGroup id="messagePanel" layout="block">
                <h:messages errorStyle="color: red" infoStyle="color: green" layout="table"/>
            </h:panelGroup>
            <h1>Listing TypeParticipant Items</h1>
            <h:form styleClass="jsfcrud_list_form">
                <h:outputText escape="false" value="(No TypeParticipant Items Found)<br />" rendered="#{typeParticipant.pagingInfo.itemCount == 0}" />
                <h:panelGroup rendered="#{typeParticipant.pagingInfo.itemCount > 0}">
                    <h:outputText value="Item #{typeParticipant.pagingInfo.firstItem + 1}..#{typeParticipant.pagingInfo.lastItem} of #{typeParticipant.pagingInfo.itemCount}"/>&nbsp;
                    <h:commandLink action="#{typeParticipant.prev}" value="Previous #{typeParticipant.pagingInfo.batchSize}" rendered="#{typeParticipant.pagingInfo.firstItem >= typeParticipant.pagingInfo.batchSize}"/>&nbsp;
                    <h:commandLink action="#{typeParticipant.next}" value="Next #{typeParticipant.pagingInfo.batchSize}" rendered="#{typeParticipant.pagingInfo.lastItem + typeParticipant.pagingInfo.batchSize <= typeParticipant.pagingInfo.itemCount}"/>&nbsp;
                    <h:commandLink action="#{typeParticipant.next}" value="Remaining #{typeParticipant.pagingInfo.itemCount - typeParticipant.pagingInfo.lastItem}"
                                   rendered="#{typeParticipant.pagingInfo.lastItem < typeParticipant.pagingInfo.itemCount && typeParticipant.pagingInfo.lastItem + typeParticipant.pagingInfo.batchSize > typeParticipant.pagingInfo.itemCount}"/>
                    <h:dataTable value="#{typeParticipant.typeParticipantItems}" var="item" border="0" cellpadding="2" cellspacing="0" rowClasses="jsfcrud_odd_row,jsfcrud_even_row" rules="all" style="border:solid 1px">
                        <h:column>
                            <f:facet name="header">
                                <h:outputText value="TypeParticipantId"/>
                            </f:facet>
                            <h:outputText value="#{item.typeParticipantId}"/>
                        </h:column>
                        <h:column>
                            <f:facet name="header">
                                <h:outputText value="Nom"/>
                            </f:facet>
                            <h:outputText value="#{item.nom}"/>
                        </h:column>
                        <h:column>
                            <f:facet name="header">
                                <h:outputText escape="false" value="&nbsp;"/>
                            </f:facet>
                            <h:commandLink value="Show" action="#{typeParticipant.detailSetup}">
                                <f:param name="jsfcrud.currentTypeParticipant" value="#{jsfcrud_class['jsf.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][item][typeParticipant.converter].jsfcrud_invoke}"/>
                            </h:commandLink>
                            <h:outputText value=" "/>
                            <h:commandLink value="Edit" action="#{typeParticipant.editSetup}">
                                <f:param name="jsfcrud.currentTypeParticipant" value="#{jsfcrud_class['jsf.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][item][typeParticipant.converter].jsfcrud_invoke}"/>
                            </h:commandLink>
                            <h:outputText value=" "/>
                            <h:commandLink value="Destroy" action="#{typeParticipant.remove}">
                                <f:param name="jsfcrud.currentTypeParticipant" value="#{jsfcrud_class['jsf.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][item][typeParticipant.converter].jsfcrud_invoke}"/>
                            </h:commandLink>
                        </h:column>

                    </h:dataTable>
                </h:panelGroup>
                <br />
                <h:commandLink action="#{typeParticipant.createSetup}" value="New TypeParticipant"/>
                <br />
                <br />
                <h:commandLink value="Index" action="welcome" immediate="true" />


            </h:form>
        </body>
    </html>
</f:view>
