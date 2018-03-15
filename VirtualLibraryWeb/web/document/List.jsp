<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsf/core" prefix="f" %>
<%@taglib uri="http://java.sun.com/jsf/html" prefix="h" %>
<f:view>
    <html>
        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
            <title>Listing Document Items</title>
            <link rel="stylesheet" type="text/css" href="/VirtualLibraryWeb/faces/jsfcrud.css" />
        </head>
        <body>
            <h:panelGroup id="messagePanel" layout="block">
                <h:messages errorStyle="color: red" infoStyle="color: green" layout="table"/>
            </h:panelGroup>
            <h1>Listing Document Items</h1>
            <h:form styleClass="jsfcrud_list_form">
                <h:outputText escape="false" value="(No Document Items Found)<br />" rendered="#{document.pagingInfo.itemCount == 0}" />
                <h:panelGroup rendered="#{document.pagingInfo.itemCount > 0}">
                    <h:outputText value="Item #{document.pagingInfo.firstItem + 1}..#{document.pagingInfo.lastItem} of #{document.pagingInfo.itemCount}"/>&nbsp;
                    <h:commandLink action="#{document.prev}" value="Previous #{document.pagingInfo.batchSize}" rendered="#{document.pagingInfo.firstItem >= document.pagingInfo.batchSize}"/>&nbsp;
                    <h:commandLink action="#{document.next}" value="Next #{document.pagingInfo.batchSize}" rendered="#{document.pagingInfo.lastItem + document.pagingInfo.batchSize <= document.pagingInfo.itemCount}"/>&nbsp;
                    <h:commandLink action="#{document.next}" value="Remaining #{document.pagingInfo.itemCount - document.pagingInfo.lastItem}"
                                   rendered="#{document.pagingInfo.lastItem < document.pagingInfo.itemCount && document.pagingInfo.lastItem + document.pagingInfo.batchSize > document.pagingInfo.itemCount}"/>
                    <h:dataTable value="#{document.documentItems}" var="item" border="0" cellpadding="2" cellspacing="0" rowClasses="jsfcrud_odd_row,jsfcrud_even_row" rules="all" style="border:solid 1px">
                        <h:column>
                            <f:facet name="header">
                                <h:outputText value="DocumentId"/>
                            </f:facet>
                            <h:outputText value="#{item.documentId}"/>
                        </h:column>
                        <h:column>
                            <f:facet name="header">
                                <h:outputText value="Titre"/>
                            </f:facet>
                            <h:outputText value="#{item.titre}"/>
                        </h:column>
                        <h:column>
                            <f:facet name="header">
                                <h:outputText value="DateParution"/>
                            </f:facet>
                            <h:outputText value="#{item.dateParution}">
                                <f:convertDateTime pattern="MM/dd/yyyy" />
                            </h:outputText>
                        </h:column>
                        <h:column>
                            <f:facet name="header">
                                <h:outputText value="Description"/>
                            </f:facet>
                            <h:outputText value="#{item.description}"/>
                        </h:column>
                        <h:column>
                            <f:facet name="header">
                                <h:outputText value="NombrePages"/>
                            </f:facet>
                            <h:outputText value="#{item.nombrePages}"/>
                        </h:column>
                        <h:column>
                            <f:facet name="header">
                                <h:outputText value="Isbn"/>
                            </f:facet>
                            <h:outputText value="#{item.isbn}"/>
                        </h:column>
                        <h:column>
                            <f:facet name="header">
                                <h:outputText value="Langue"/>
                            </f:facet>
                            <h:outputText value="#{item.langue}"/>
                        </h:column>
                        <h:column>
                            <f:facet name="header">
                                <h:outputText value="Editeur"/>
                            </f:facet>
                            <h:outputText value="#{item.editeur}"/>
                        </h:column>
                        <h:column>
                            <f:facet name="header">
                                <h:outputText value="Validation"/>
                            </f:facet>
                            <h:outputText value="#{item.validation}"/>
                        </h:column>
                        <h:column>
                            <f:facet name="header">
                                <h:outputText value="MaisonDisque"/>
                            </f:facet>
                            <h:outputText value="#{item.maisonDisque}"/>
                        </h:column>
                        <h:column>
                            <f:facet name="header">
                                <h:outputText value="NombrePiste"/>
                            </f:facet>
                            <h:outputText value="#{item.nombrePiste}"/>
                        </h:column>
                        <h:column>
                            <f:facet name="header">
                                <h:outputText value="SocieteProduction"/>
                            </f:facet>
                            <h:outputText value="#{item.societeProduction}"/>
                        </h:column>
                        <h:column>
                            <f:facet name="header">
                                <h:outputText value="MaisonEdition"/>
                            </f:facet>
                            <h:outputText value="#{item.maisonEdition}"/>
                        </h:column>
                        <h:column>
                            <f:facet name="header">
                                <h:outputText value="Duree"/>
                            </f:facet>
                            <h:outputText value="#{item.duree}"/>
                        </h:column>
                        <h:column>
                            <f:facet name="header">
                                <h:outputText value="PublicVise"/>
                            </f:facet>
                            <h:outputText value="#{item.publicVise}"/>
                        </h:column>
                        <h:column>
                            <f:facet name="header">
                                <h:outputText value="TypePeriodique"/>
                            </f:facet>
                            <h:outputText value="#{item.typePeriodique}"/>
                        </h:column>
                        <h:column>
                            <f:facet name="header">
                                <h:outputText value="Issn"/>
                            </f:facet>
                            <h:outputText value="#{item.issn}"/>
                        </h:column>
                        <h:column>
                            <f:facet name="header">
                                <h:outputText value="NumeroMagazine"/>
                            </f:facet>
                            <h:outputText value="#{item.numeroMagazine}"/>
                        </h:column>
                        <h:column>
                            <f:facet name="header">
                                <h:outputText value="VisibleLecteur"/>
                            </f:facet>
                            <h:outputText value="#{item.visibleLecteur}"/>
                        </h:column>
                        <h:column>
                            <f:facet name="header">
                                <h:outputText value="LienCouverture"/>
                            </f:facet>
                            <h:outputText value="#{item.lienCouverture}"/>
                        </h:column>
                        <h:column>
                            <f:facet name="header">
                                <h:outputText value="NombreExemplaire"/>
                            </f:facet>
                            <h:outputText value="#{item.nombreExemplaire}"/>
                        </h:column>
                        <h:column>
                            <f:facet name="header">
                                <h:outputText value="TypeDocumentIdFk"/>
                            </f:facet>
                            <h:outputText value="#{item.typeDocumentIdFk}"/>
                        </h:column>
                        <h:column>
                            <f:facet name="header">
                                <h:outputText escape="false" value="&nbsp;"/>
                            </f:facet>
                            <h:commandLink value="Show" action="#{document.detailSetup}">
                                <f:param name="jsfcrud.currentDocument" value="#{jsfcrud_class['jsf.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][item][document.converter].jsfcrud_invoke}"/>
                            </h:commandLink>
                            <h:outputText value=" "/>
                            <h:commandLink value="Edit" action="#{document.editSetup}">
                                <f:param name="jsfcrud.currentDocument" value="#{jsfcrud_class['jsf.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][item][document.converter].jsfcrud_invoke}"/>
                            </h:commandLink>
                            <h:outputText value=" "/>
                            <h:commandLink value="Destroy" action="#{document.remove}">
                                <f:param name="jsfcrud.currentDocument" value="#{jsfcrud_class['jsf.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][item][document.converter].jsfcrud_invoke}"/>
                            </h:commandLink>
                        </h:column>

                    </h:dataTable>
                </h:panelGroup>
                <br />
                <h:commandLink action="#{document.createSetup}" value="New Document"/>
                <br />
                <br />
                <h:commandLink value="Index" action="welcome" immediate="true" />


            </h:form>
        </body>
    </html>
</f:view>
