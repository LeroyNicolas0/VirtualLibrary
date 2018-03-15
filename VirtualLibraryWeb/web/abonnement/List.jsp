<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsf/core" prefix="f" %>
<%@taglib uri="http://java.sun.com/jsf/html" prefix="h" %>
<f:view>
    <html>
        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
            <title>Listing Abonnement Items</title>
            <link rel="stylesheet" type="text/css" href="/VirtualLibraryWeb/faces/jsfcrud.css" />
        </head>
        <body>
            <h:panelGroup id="messagePanel" layout="block">
                <h:messages errorStyle="color: red" infoStyle="color: green" layout="table"/>
            </h:panelGroup>
            <h1>Listing Abonnement Items</h1>
            <h:form styleClass="jsfcrud_list_form">
                <h:outputText escape="false" value="(No Abonnement Items Found)<br />" rendered="#{abonnement.pagingInfo.itemCount == 0}" />
                <h:panelGroup rendered="#{abonnement.pagingInfo.itemCount > 0}">
                    <h:outputText value="Item #{abonnement.pagingInfo.firstItem + 1}..#{abonnement.pagingInfo.lastItem} of #{abonnement.pagingInfo.itemCount}"/>&nbsp;
                    <h:commandLink action="#{abonnement.prev}" value="Previous #{abonnement.pagingInfo.batchSize}" rendered="#{abonnement.pagingInfo.firstItem >= abonnement.pagingInfo.batchSize}"/>&nbsp;
                    <h:commandLink action="#{abonnement.next}" value="Next #{abonnement.pagingInfo.batchSize}" rendered="#{abonnement.pagingInfo.lastItem + abonnement.pagingInfo.batchSize <= abonnement.pagingInfo.itemCount}"/>&nbsp;
                    <h:commandLink action="#{abonnement.next}" value="Remaining #{abonnement.pagingInfo.itemCount - abonnement.pagingInfo.lastItem}"
                                   rendered="#{abonnement.pagingInfo.lastItem < abonnement.pagingInfo.itemCount && abonnement.pagingInfo.lastItem + abonnement.pagingInfo.batchSize > abonnement.pagingInfo.itemCount}"/>
                    <h:dataTable value="#{abonnement.abonnementItems}" var="item" border="0" cellpadding="2" cellspacing="0" rowClasses="jsfcrud_odd_row,jsfcrud_even_row" rules="all" style="border:solid 1px">
                        <h:column>
                            <f:facet name="header">
                                <h:outputText value="AbonnementId"/>
                            </f:facet>
                            <h:outputText value="#{item.abonnementId}"/>
                        </h:column>
                        <h:column>
                            <f:facet name="header">
                                <h:outputText value="DateDebut"/>
                            </f:facet>
                            <h:outputText value="#{item.dateDebut}">
                                <f:convertDateTime pattern="MM/dd/yyyy" />
                            </h:outputText>
                        </h:column>
                        <h:column>
                            <f:facet name="header">
                                <h:outputText value="DateFin"/>
                            </f:facet>
                            <h:outputText value="#{item.dateFin}">
                                <f:convertDateTime pattern="MM/dd/yyyy" />
                            </h:outputText>
                        </h:column>
                        <h:column>
                            <f:facet name="header">
                                <h:outputText value="ForfaitIdFk"/>
                            </f:facet>
                            <h:outputText value="#{item.forfaitIdFk}"/>
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
                            <h:commandLink value="Show" action="#{abonnement.detailSetup}">
                                <f:param name="jsfcrud.currentAbonnement" value="#{jsfcrud_class['jsf.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][item][abonnement.converter].jsfcrud_invoke}"/>
                            </h:commandLink>
                            <h:outputText value=" "/>
                            <h:commandLink value="Edit" action="#{abonnement.editSetup}">
                                <f:param name="jsfcrud.currentAbonnement" value="#{jsfcrud_class['jsf.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][item][abonnement.converter].jsfcrud_invoke}"/>
                            </h:commandLink>
                            <h:outputText value=" "/>
                            <h:commandLink value="Destroy" action="#{abonnement.remove}">
                                <f:param name="jsfcrud.currentAbonnement" value="#{jsfcrud_class['jsf.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][item][abonnement.converter].jsfcrud_invoke}"/>
                            </h:commandLink>
                        </h:column>

                    </h:dataTable>
                </h:panelGroup>
                <br />
                <h:commandLink action="#{abonnement.createSetup}" value="New Abonnement"/>
                <br />
                <br />
                <h:commandLink value="Index" action="welcome" immediate="true" />


            </h:form>
        </body>
    </html>
</f:view>
