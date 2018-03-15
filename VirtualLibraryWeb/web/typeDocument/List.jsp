<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsf/core" prefix="f" %>
<%@taglib uri="http://java.sun.com/jsf/html" prefix="h" %>
<f:view>
    <html>
        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
            <title>Listing TypeDocument Items</title>
            <link rel="stylesheet" type="text/css" href="/VirtualLibraryWeb/faces/jsfcrud.css" />
        </head>
        <body>
            <h:panelGroup id="messagePanel" layout="block">
                <h:messages errorStyle="color: red" infoStyle="color: green" layout="table"/>
            </h:panelGroup>
            <h1>Listing TypeDocument Items</h1>
            <h:form styleClass="jsfcrud_list_form">
                <h:outputText escape="false" value="(No TypeDocument Items Found)<br />" rendered="#{typeDocument.pagingInfo.itemCount == 0}" />
                <h:panelGroup rendered="#{typeDocument.pagingInfo.itemCount > 0}">
                    <h:outputText value="Item #{typeDocument.pagingInfo.firstItem + 1}..#{typeDocument.pagingInfo.lastItem} of #{typeDocument.pagingInfo.itemCount}"/>&nbsp;
                    <h:commandLink action="#{typeDocument.prev}" value="Previous #{typeDocument.pagingInfo.batchSize}" rendered="#{typeDocument.pagingInfo.firstItem >= typeDocument.pagingInfo.batchSize}"/>&nbsp;
                    <h:commandLink action="#{typeDocument.next}" value="Next #{typeDocument.pagingInfo.batchSize}" rendered="#{typeDocument.pagingInfo.lastItem + typeDocument.pagingInfo.batchSize <= typeDocument.pagingInfo.itemCount}"/>&nbsp;
                    <h:commandLink action="#{typeDocument.next}" value="Remaining #{typeDocument.pagingInfo.itemCount - typeDocument.pagingInfo.lastItem}"
                                   rendered="#{typeDocument.pagingInfo.lastItem < typeDocument.pagingInfo.itemCount && typeDocument.pagingInfo.lastItem + typeDocument.pagingInfo.batchSize > typeDocument.pagingInfo.itemCount}"/>
                    <h:dataTable value="#{typeDocument.typeDocumentItems}" var="item" border="0" cellpadding="2" cellspacing="0" rowClasses="jsfcrud_odd_row,jsfcrud_even_row" rules="all" style="border:solid 1px">
                        <h:column>
                            <f:facet name="header">
                                <h:outputText value="TypeDocumentId"/>
                            </f:facet>
                            <h:outputText value="#{item.typeDocumentId}"/>
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
                            <h:commandLink value="Show" action="#{typeDocument.detailSetup}">
                                <f:param name="jsfcrud.currentTypeDocument" value="#{jsfcrud_class['jsf.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][item][typeDocument.converter].jsfcrud_invoke}"/>
                            </h:commandLink>
                            <h:outputText value=" "/>
                            <h:commandLink value="Edit" action="#{typeDocument.editSetup}">
                                <f:param name="jsfcrud.currentTypeDocument" value="#{jsfcrud_class['jsf.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][item][typeDocument.converter].jsfcrud_invoke}"/>
                            </h:commandLink>
                            <h:outputText value=" "/>
                            <h:commandLink value="Destroy" action="#{typeDocument.remove}">
                                <f:param name="jsfcrud.currentTypeDocument" value="#{jsfcrud_class['jsf.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][item][typeDocument.converter].jsfcrud_invoke}"/>
                            </h:commandLink>
                        </h:column>

                    </h:dataTable>
                </h:panelGroup>
                <br />
                <h:commandLink action="#{typeDocument.createSetup}" value="New TypeDocument"/>
                <br />
                <br />
                <h:commandLink value="Index" action="welcome" immediate="true" />


            </h:form>
        </body>
    </html>
</f:view>
