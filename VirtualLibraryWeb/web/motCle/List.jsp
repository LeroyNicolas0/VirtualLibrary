<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsf/core" prefix="f" %>
<%@taglib uri="http://java.sun.com/jsf/html" prefix="h" %>
<f:view>
    <html>
        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
            <title>Listing MotCle Items</title>
            <link rel="stylesheet" type="text/css" href="/VirtualLibraryWeb/faces/jsfcrud.css" />
        </head>
        <body>
            <h:panelGroup id="messagePanel" layout="block">
                <h:messages errorStyle="color: red" infoStyle="color: green" layout="table"/>
            </h:panelGroup>
            <h1>Listing MotCle Items</h1>
            <h:form styleClass="jsfcrud_list_form">
                <h:outputText escape="false" value="(No MotCle Items Found)<br />" rendered="#{motCle.pagingInfo.itemCount == 0}" />
                <h:panelGroup rendered="#{motCle.pagingInfo.itemCount > 0}">
                    <h:outputText value="Item #{motCle.pagingInfo.firstItem + 1}..#{motCle.pagingInfo.lastItem} of #{motCle.pagingInfo.itemCount}"/>&nbsp;
                    <h:commandLink action="#{motCle.prev}" value="Previous #{motCle.pagingInfo.batchSize}" rendered="#{motCle.pagingInfo.firstItem >= motCle.pagingInfo.batchSize}"/>&nbsp;
                    <h:commandLink action="#{motCle.next}" value="Next #{motCle.pagingInfo.batchSize}" rendered="#{motCle.pagingInfo.lastItem + motCle.pagingInfo.batchSize <= motCle.pagingInfo.itemCount}"/>&nbsp;
                    <h:commandLink action="#{motCle.next}" value="Remaining #{motCle.pagingInfo.itemCount - motCle.pagingInfo.lastItem}"
                                   rendered="#{motCle.pagingInfo.lastItem < motCle.pagingInfo.itemCount && motCle.pagingInfo.lastItem + motCle.pagingInfo.batchSize > motCle.pagingInfo.itemCount}"/>
                    <h:dataTable value="#{motCle.motCleItems}" var="item" border="0" cellpadding="2" cellspacing="0" rowClasses="jsfcrud_odd_row,jsfcrud_even_row" rules="all" style="border:solid 1px">
                        <h:column>
                            <f:facet name="header">
                                <h:outputText value="MotCleId"/>
                            </f:facet>
                            <h:outputText value="#{item.motCleId}"/>
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
                            <h:commandLink value="Show" action="#{motCle.detailSetup}">
                                <f:param name="jsfcrud.currentMotCle" value="#{jsfcrud_class['jsf.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][item][motCle.converter].jsfcrud_invoke}"/>
                            </h:commandLink>
                            <h:outputText value=" "/>
                            <h:commandLink value="Edit" action="#{motCle.editSetup}">
                                <f:param name="jsfcrud.currentMotCle" value="#{jsfcrud_class['jsf.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][item][motCle.converter].jsfcrud_invoke}"/>
                            </h:commandLink>
                            <h:outputText value=" "/>
                            <h:commandLink value="Destroy" action="#{motCle.remove}">
                                <f:param name="jsfcrud.currentMotCle" value="#{jsfcrud_class['jsf.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][item][motCle.converter].jsfcrud_invoke}"/>
                            </h:commandLink>
                        </h:column>

                    </h:dataTable>
                </h:panelGroup>
                <br />
                <h:commandLink action="#{motCle.createSetup}" value="New MotCle"/>
                <br />
                <br />
                <h:commandLink value="Index" action="welcome" immediate="true" />


            </h:form>
        </body>
    </html>
</f:view>
