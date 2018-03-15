<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsf/core" prefix="f" %>
<%@taglib uri="http://java.sun.com/jsf/html" prefix="h" %>
<f:view>
    <html>
        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
            <title>Listing Emprunt Items</title>
            <link rel="stylesheet" type="text/css" href="/VirtualLibraryWeb/faces/jsfcrud.css" />
        </head>
        <body>
            <h:panelGroup id="messagePanel" layout="block">
                <h:messages errorStyle="color: red" infoStyle="color: green" layout="table"/>
            </h:panelGroup>
            <h1>Listing Emprunt Items</h1>
            <h:form styleClass="jsfcrud_list_form">
                <h:outputText escape="false" value="(No Emprunt Items Found)<br />" rendered="#{emprunt.pagingInfo.itemCount == 0}" />
                <h:panelGroup rendered="#{emprunt.pagingInfo.itemCount > 0}">
                    <h:outputText value="Item #{emprunt.pagingInfo.firstItem + 1}..#{emprunt.pagingInfo.lastItem} of #{emprunt.pagingInfo.itemCount}"/>&nbsp;
                    <h:commandLink action="#{emprunt.prev}" value="Previous #{emprunt.pagingInfo.batchSize}" rendered="#{emprunt.pagingInfo.firstItem >= emprunt.pagingInfo.batchSize}"/>&nbsp;
                    <h:commandLink action="#{emprunt.next}" value="Next #{emprunt.pagingInfo.batchSize}" rendered="#{emprunt.pagingInfo.lastItem + emprunt.pagingInfo.batchSize <= emprunt.pagingInfo.itemCount}"/>&nbsp;
                    <h:commandLink action="#{emprunt.next}" value="Remaining #{emprunt.pagingInfo.itemCount - emprunt.pagingInfo.lastItem}"
                                   rendered="#{emprunt.pagingInfo.lastItem < emprunt.pagingInfo.itemCount && emprunt.pagingInfo.lastItem + emprunt.pagingInfo.batchSize > emprunt.pagingInfo.itemCount}"/>
                    <h:dataTable value="#{emprunt.empruntItems}" var="item" border="0" cellpadding="2" cellspacing="0" rowClasses="jsfcrud_odd_row,jsfcrud_even_row" rules="all" style="border:solid 1px">
                        <h:column>
                            <f:facet name="header">
                                <h:outputText value="EmpruntId"/>
                            </f:facet>
                            <h:outputText value="#{item.empruntId}"/>
                        </h:column>
                        <h:column>
                            <f:facet name="header">
                                <h:outputText value="DateEmprunt"/>
                            </f:facet>
                            <h:outputText value="#{item.dateEmprunt}">
                                <f:convertDateTime pattern="MM/dd/yyyy" />
                            </h:outputText>
                        </h:column>
                        <h:column>
                            <f:facet name="header">
                                <h:outputText value="DateRetour"/>
                            </f:facet>
                            <h:outputText value="#{item.dateRetour}">
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
                            <h:commandLink value="Show" action="#{emprunt.detailSetup}">
                                <f:param name="jsfcrud.currentEmprunt" value="#{jsfcrud_class['jsf.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][item][emprunt.converter].jsfcrud_invoke}"/>
                            </h:commandLink>
                            <h:outputText value=" "/>
                            <h:commandLink value="Edit" action="#{emprunt.editSetup}">
                                <f:param name="jsfcrud.currentEmprunt" value="#{jsfcrud_class['jsf.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][item][emprunt.converter].jsfcrud_invoke}"/>
                            </h:commandLink>
                            <h:outputText value=" "/>
                            <h:commandLink value="Destroy" action="#{emprunt.remove}">
                                <f:param name="jsfcrud.currentEmprunt" value="#{jsfcrud_class['jsf.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][item][emprunt.converter].jsfcrud_invoke}"/>
                            </h:commandLink>
                        </h:column>

                    </h:dataTable>
                </h:panelGroup>
                <br />
                <h:commandLink action="#{emprunt.createSetup}" value="New Emprunt"/>
                <br />
                <br />
                <h:commandLink value="Index" action="welcome" immediate="true" />


            </h:form>
        </body>
    </html>
</f:view>
