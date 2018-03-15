<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsf/core" prefix="f" %>
<%@taglib uri="http://java.sun.com/jsf/html" prefix="h" %>
<f:view>
    <html>
        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
            <title>Listing Forfait Items</title>
            <link rel="stylesheet" type="text/css" href="/VirtualLibraryWeb/faces/jsfcrud.css" />
        </head>
        <body>
            <h:panelGroup id="messagePanel" layout="block">
                <h:messages errorStyle="color: red" infoStyle="color: green" layout="table"/>
            </h:panelGroup>
            <h1>Listing Forfait Items</h1>
            <h:form styleClass="jsfcrud_list_form">
                <h:outputText escape="false" value="(No Forfait Items Found)<br />" rendered="#{forfait.pagingInfo.itemCount == 0}" />
                <h:panelGroup rendered="#{forfait.pagingInfo.itemCount > 0}">
                    <h:outputText value="Item #{forfait.pagingInfo.firstItem + 1}..#{forfait.pagingInfo.lastItem} of #{forfait.pagingInfo.itemCount}"/>&nbsp;
                    <h:commandLink action="#{forfait.prev}" value="Previous #{forfait.pagingInfo.batchSize}" rendered="#{forfait.pagingInfo.firstItem >= forfait.pagingInfo.batchSize}"/>&nbsp;
                    <h:commandLink action="#{forfait.next}" value="Next #{forfait.pagingInfo.batchSize}" rendered="#{forfait.pagingInfo.lastItem + forfait.pagingInfo.batchSize <= forfait.pagingInfo.itemCount}"/>&nbsp;
                    <h:commandLink action="#{forfait.next}" value="Remaining #{forfait.pagingInfo.itemCount - forfait.pagingInfo.lastItem}"
                                   rendered="#{forfait.pagingInfo.lastItem < forfait.pagingInfo.itemCount && forfait.pagingInfo.lastItem + forfait.pagingInfo.batchSize > forfait.pagingInfo.itemCount}"/>
                    <h:dataTable value="#{forfait.forfaitItems}" var="item" border="0" cellpadding="2" cellspacing="0" rowClasses="jsfcrud_odd_row,jsfcrud_even_row" rules="all" style="border:solid 1px">
                        <h:column>
                            <f:facet name="header">
                                <h:outputText value="ForfaitId"/>
                            </f:facet>
                            <h:outputText value="#{item.forfaitId}"/>
                        </h:column>
                        <h:column>
                            <f:facet name="header">
                                <h:outputText value="Nom"/>
                            </f:facet>
                            <h:outputText value="#{item.nom}"/>
                        </h:column>
                        <h:column>
                            <f:facet name="header">
                                <h:outputText value="Tarif"/>
                            </f:facet>
                            <h:outputText value="#{item.tarif}"/>
                        </h:column>
                        <h:column>
                            <f:facet name="header">
                                <h:outputText value="Duree"/>
                            </f:facet>
                            <h:outputText value="#{item.duree}"/>
                        </h:column>
                        <h:column>
                            <f:facet name="header">
                                <h:outputText escape="false" value="&nbsp;"/>
                            </f:facet>
                            <h:commandLink value="Show" action="#{forfait.detailSetup}">
                                <f:param name="jsfcrud.currentForfait" value="#{jsfcrud_class['jsf.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][item][forfait.converter].jsfcrud_invoke}"/>
                            </h:commandLink>
                            <h:outputText value=" "/>
                            <h:commandLink value="Edit" action="#{forfait.editSetup}">
                                <f:param name="jsfcrud.currentForfait" value="#{jsfcrud_class['jsf.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][item][forfait.converter].jsfcrud_invoke}"/>
                            </h:commandLink>
                            <h:outputText value=" "/>
                            <h:commandLink value="Destroy" action="#{forfait.remove}">
                                <f:param name="jsfcrud.currentForfait" value="#{jsfcrud_class['jsf.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][item][forfait.converter].jsfcrud_invoke}"/>
                            </h:commandLink>
                        </h:column>

                    </h:dataTable>
                </h:panelGroup>
                <br />
                <h:commandLink action="#{forfait.createSetup}" value="New Forfait"/>
                <br />
                <br />
                <h:commandLink value="Index" action="welcome" immediate="true" />


            </h:form>
        </body>
    </html>
</f:view>
