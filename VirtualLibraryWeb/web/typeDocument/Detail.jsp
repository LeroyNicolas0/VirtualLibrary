<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsf/core" prefix="f" %>
<%@taglib uri="http://java.sun.com/jsf/html" prefix="h" %>
<f:view>
    <html>
        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
            <title>TypeDocument Detail</title>
            <link rel="stylesheet" type="text/css" href="/VirtualLibraryWeb/faces/jsfcrud.css" />
        </head>
        <body>
            <h:panelGroup id="messagePanel" layout="block">
                <h:messages errorStyle="color: red" infoStyle="color: green" layout="table"/>
            </h:panelGroup>
            <h1>TypeDocument Detail</h1>
            <h:form>
                <h:panelGrid columns="2">
                    <h:outputText value="TypeDocumentId:"/>
                    <h:outputText value="#{typeDocument.typeDocument.typeDocumentId}" title="TypeDocumentId" />
                    <h:outputText value="Nom:"/>
                    <h:outputText value="#{typeDocument.typeDocument.nom}" title="Nom" />

                    <h:outputText value="DocumentCollection:" />
                    <h:panelGroup>
                        <h:outputText rendered="#{empty typeDocument.typeDocument.documentCollection}" value="(No Items)"/>
                        <h:dataTable value="#{typeDocument.typeDocument.documentCollection}" var="item" 
                                     border="0" cellpadding="2" cellspacing="0" rowClasses="jsfcrud_odd_row,jsfcrud_even_row" rules="all" style="border:solid 1px" 
                                     rendered="#{not empty typeDocument.typeDocument.documentCollection}">
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
                                    <f:param name="jsfcrud.currentTypeDocument" value="#{jsfcrud_class['jsf.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][typeDocument.typeDocument][typeDocument.converter].jsfcrud_invoke}"/>
                                    <f:param name="jsfcrud.currentDocument" value="#{jsfcrud_class['jsf.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][item][document.converter].jsfcrud_invoke}"/>
                                    <f:param name="jsfcrud.relatedController" value="typeDocument" />
                                    <f:param name="jsfcrud.relatedControllerType" value="jsf.TypeDocumentController" />
                                </h:commandLink>
                                <h:outputText value=" "/>
                                <h:commandLink value="Edit" action="#{document.editSetup}">
                                    <f:param name="jsfcrud.currentTypeDocument" value="#{jsfcrud_class['jsf.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][typeDocument.typeDocument][typeDocument.converter].jsfcrud_invoke}"/>
                                    <f:param name="jsfcrud.currentDocument" value="#{jsfcrud_class['jsf.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][item][document.converter].jsfcrud_invoke}"/>
                                    <f:param name="jsfcrud.relatedController" value="typeDocument" />
                                    <f:param name="jsfcrud.relatedControllerType" value="jsf.TypeDocumentController" />
                                </h:commandLink>
                                <h:outputText value=" "/>
                                <h:commandLink value="Destroy" action="#{document.destroy}">
                                    <f:param name="jsfcrud.currentTypeDocument" value="#{jsfcrud_class['jsf.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][typeDocument.typeDocument][typeDocument.converter].jsfcrud_invoke}"/>
                                    <f:param name="jsfcrud.currentDocument" value="#{jsfcrud_class['jsf.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][item][document.converter].jsfcrud_invoke}"/>
                                    <f:param name="jsfcrud.relatedController" value="typeDocument" />
                                    <f:param name="jsfcrud.relatedControllerType" value="jsf.TypeDocumentController" />
                                </h:commandLink>
                            </h:column>
                        </h:dataTable>
                    </h:panelGroup>

                </h:panelGrid>
                <br />
                <h:commandLink action="#{typeDocument.remove}" value="Destroy">
                    <f:param name="jsfcrud.currentTypeDocument" value="#{jsfcrud_class['jsf.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][typeDocument.typeDocument][typeDocument.converter].jsfcrud_invoke}" />
                </h:commandLink>
                <br />
                <br />
                <h:commandLink action="#{typeDocument.editSetup}" value="Edit">
                    <f:param name="jsfcrud.currentTypeDocument" value="#{jsfcrud_class['jsf.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][typeDocument.typeDocument][typeDocument.converter].jsfcrud_invoke}" />
                </h:commandLink>
                <br />
                <h:commandLink action="#{typeDocument.createSetup}" value="New TypeDocument" />
                <br />
                <h:commandLink action="#{typeDocument.listSetup}" value="Show All TypeDocument Items"/>
                <br />
                <br />
                <h:commandLink value="Index" action="welcome" immediate="true" />

            </h:form>
        </body>
    </html>
</f:view>
