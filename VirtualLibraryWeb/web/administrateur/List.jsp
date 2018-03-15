<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsf/core" prefix="f" %>
<%@taglib uri="http://java.sun.com/jsf/html" prefix="h" %>
<f:view>
    <html>
        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
            <title>Listing Administrateur Items</title>
            <link rel="stylesheet" type="text/css" href="/VirtualLibraryWeb/faces/jsfcrud.css" />
        </head>
        <body>
            <h:panelGroup id="messagePanel" layout="block">
                <h:messages errorStyle="color: red" infoStyle="color: green" layout="table"/>
            </h:panelGroup>
            <h1>Listing Administrateur Items</h1>
            <h:form styleClass="jsfcrud_list_form">
                <h:outputText escape="false" value="(No Administrateur Items Found)<br />" rendered="#{administrateur.pagingInfo.itemCount == 0}" />
                <h:panelGroup rendered="#{administrateur.pagingInfo.itemCount > 0}">
                    <h:outputText value="Item #{administrateur.pagingInfo.firstItem + 1}..#{administrateur.pagingInfo.lastItem} of #{administrateur.pagingInfo.itemCount}"/>&nbsp;
                    <h:commandLink action="#{administrateur.prev}" value="Previous #{administrateur.pagingInfo.batchSize}" rendered="#{administrateur.pagingInfo.firstItem >= administrateur.pagingInfo.batchSize}"/>&nbsp;
                    <h:commandLink action="#{administrateur.next}" value="Next #{administrateur.pagingInfo.batchSize}" rendered="#{administrateur.pagingInfo.lastItem + administrateur.pagingInfo.batchSize <= administrateur.pagingInfo.itemCount}"/>&nbsp;
                    <h:commandLink action="#{administrateur.next}" value="Remaining #{administrateur.pagingInfo.itemCount - administrateur.pagingInfo.lastItem}"
                                   rendered="#{administrateur.pagingInfo.lastItem < administrateur.pagingInfo.itemCount && administrateur.pagingInfo.lastItem + administrateur.pagingInfo.batchSize > administrateur.pagingInfo.itemCount}"/>
                    <h:dataTable value="#{administrateur.administrateurItems}" var="item" border="0" cellpadding="2" cellspacing="0" rowClasses="jsfcrud_odd_row,jsfcrud_even_row" rules="all" style="border:solid 1px">
                        <h:column>
                            <f:facet name="header">
                                <h:outputText value="AdministrateurId"/>
                            </f:facet>
                            <h:outputText value="#{item.administrateurId}"/>
                        </h:column>
                        <h:column>
                            <f:facet name="header">
                                <h:outputText value="Prenom"/>
                            </f:facet>
                            <h:outputText value="#{item.prenom}"/>
                        </h:column>
                        <h:column>
                            <f:facet name="header">
                                <h:outputText value="Nom"/>
                            </f:facet>
                            <h:outputText value="#{item.nom}"/>
                        </h:column>
                        <h:column>
                            <f:facet name="header">
                                <h:outputText value="DateNaissance"/>
                            </f:facet>
                            <h:outputText value="#{item.dateNaissance}">
                                <f:convertDateTime pattern="MM/dd/yyyy" />
                            </h:outputText>
                        </h:column>
                        <h:column>
                            <f:facet name="header">
                                <h:outputText value="Login"/>
                            </f:facet>
                            <h:outputText value="#{item.login}"/>
                        </h:column>
                        <h:column>
                            <f:facet name="header">
                                <h:outputText value="Password"/>
                            </f:facet>
                            <h:outputText value="#{item.password}"/>
                        </h:column>
                        <h:column>
                            <f:facet name="header">
                                <h:outputText value="Mail"/>
                            </f:facet>
                            <h:outputText value="#{item.mail}"/>
                        </h:column>
                        <h:column>
                            <f:facet name="header">
                                <h:outputText value="DateInscription"/>
                            </f:facet>
                            <h:outputText value="#{item.dateInscription}">
                                <f:convertDateTime pattern="MM/dd/yyyy" />
                            </h:outputText>
                        </h:column>
                        <h:column>
                            <f:facet name="header">
                                <h:outputText escape="false" value="&nbsp;"/>
                            </f:facet>
                            <h:commandLink value="Show" action="#{administrateur.detailSetup}">
                                <f:param name="jsfcrud.currentAdministrateur" value="#{jsfcrud_class['jsf.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][item][administrateur.converter].jsfcrud_invoke}"/>
                            </h:commandLink>
                            <h:outputText value=" "/>
                            <h:commandLink value="Edit" action="#{administrateur.editSetup}">
                                <f:param name="jsfcrud.currentAdministrateur" value="#{jsfcrud_class['jsf.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][item][administrateur.converter].jsfcrud_invoke}"/>
                            </h:commandLink>
                            <h:outputText value=" "/>
                            <h:commandLink value="Destroy" action="#{administrateur.remove}">
                                <f:param name="jsfcrud.currentAdministrateur" value="#{jsfcrud_class['jsf.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][item][administrateur.converter].jsfcrud_invoke}"/>
                            </h:commandLink>
                        </h:column>

                    </h:dataTable>
                </h:panelGroup>
                <br />
                <h:commandLink action="#{administrateur.createSetup}" value="New Administrateur"/>
                <br />
                <br />
                <h:commandLink value="Index" action="welcome" immediate="true" />


            </h:form>
        </body>
    </html>
</f:view>
