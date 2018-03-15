<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsf/core" prefix="f" %>
<%@taglib uri="http://java.sun.com/jsf/html" prefix="h" %>
<f:view>
    <html>
        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
            <title>Listing PaysInterdit Items</title>
            <link rel="stylesheet" type="text/css" href="/VirtualLibraryWeb/faces/jsfcrud.css" />
        </head>
        <body>
            <h:panelGroup id="messagePanel" layout="block">
                <h:messages errorStyle="color: red" infoStyle="color: green" layout="table"/>
            </h:panelGroup>
            <h1>Listing PaysInterdit Items</h1>
            <h:form styleClass="jsfcrud_list_form">
                <h:outputText escape="false" value="(No PaysInterdit Items Found)<br />" rendered="#{paysInterdit.pagingInfo.itemCount == 0}" />
                <h:panelGroup rendered="#{paysInterdit.pagingInfo.itemCount > 0}">
                    <h:outputText value="Item #{paysInterdit.pagingInfo.firstItem + 1}..#{paysInterdit.pagingInfo.lastItem} of #{paysInterdit.pagingInfo.itemCount}"/>&nbsp;
                    <h:commandLink action="#{paysInterdit.prev}" value="Previous #{paysInterdit.pagingInfo.batchSize}" rendered="#{paysInterdit.pagingInfo.firstItem >= paysInterdit.pagingInfo.batchSize}"/>&nbsp;
                    <h:commandLink action="#{paysInterdit.next}" value="Next #{paysInterdit.pagingInfo.batchSize}" rendered="#{paysInterdit.pagingInfo.lastItem + paysInterdit.pagingInfo.batchSize <= paysInterdit.pagingInfo.itemCount}"/>&nbsp;
                    <h:commandLink action="#{paysInterdit.next}" value="Remaining #{paysInterdit.pagingInfo.itemCount - paysInterdit.pagingInfo.lastItem}"
                                   rendered="#{paysInterdit.pagingInfo.lastItem < paysInterdit.pagingInfo.itemCount && paysInterdit.pagingInfo.lastItem + paysInterdit.pagingInfo.batchSize > paysInterdit.pagingInfo.itemCount}"/>
                    <h:dataTable value="#{paysInterdit.paysInterditItems}" var="item" border="0" cellpadding="2" cellspacing="0" rowClasses="jsfcrud_odd_row,jsfcrud_even_row" rules="all" style="border:solid 1px">
                        <h:column>
                            <f:facet name="header">
                                <h:outputText value="PaysId"/>
                            </f:facet>
                            <h:outputText value="#{item.paysId}"/>
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
                            <h:commandLink value="Show" action="#{paysInterdit.detailSetup}">
                                <f:param name="jsfcrud.currentPaysInterdit" value="#{jsfcrud_class['jsf.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][item][paysInterdit.converter].jsfcrud_invoke}"/>
                            </h:commandLink>
                            <h:outputText value=" "/>
                            <h:commandLink value="Edit" action="#{paysInterdit.editSetup}">
                                <f:param name="jsfcrud.currentPaysInterdit" value="#{jsfcrud_class['jsf.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][item][paysInterdit.converter].jsfcrud_invoke}"/>
                            </h:commandLink>
                            <h:outputText value=" "/>
                            <h:commandLink value="Destroy" action="#{paysInterdit.remove}">
                                <f:param name="jsfcrud.currentPaysInterdit" value="#{jsfcrud_class['jsf.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][item][paysInterdit.converter].jsfcrud_invoke}"/>
                            </h:commandLink>
                        </h:column>

                    </h:dataTable>
                </h:panelGroup>
                <br />
                <h:commandLink action="#{paysInterdit.createSetup}" value="New PaysInterdit"/>
                <br />
                <br />
                <h:commandLink value="Index" action="welcome" immediate="true" />


            </h:form>
        </body>
    </html>
</f:view>
