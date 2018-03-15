<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsf/core" prefix="f" %>
<%@taglib uri="http://java.sun.com/jsf/html" prefix="h" %>
<f:view>
    <html>
        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
            <title>Listing Lecteur Items</title>
            <link rel="stylesheet" type="text/css" href="/VirtualLibraryWeb/faces/jsfcrud.css" />
        </head>
        <body>
            <h:panelGroup id="messagePanel" layout="block">
                <h:messages errorStyle="color: red" infoStyle="color: green" layout="table"/>
            </h:panelGroup>
            <h1>Listing Lecteur Items</h1>
            <h:form styleClass="jsfcrud_list_form">
                <h:outputText escape="false" value="(No Lecteur Items Found)<br />" rendered="#{lecteur.pagingInfo.itemCount == 0}" />
                <h:panelGroup rendered="#{lecteur.pagingInfo.itemCount > 0}">
                    <h:outputText value="Item #{lecteur.pagingInfo.firstItem + 1}..#{lecteur.pagingInfo.lastItem} of #{lecteur.pagingInfo.itemCount}"/>&nbsp;
                    <h:commandLink action="#{lecteur.prev}" value="Previous #{lecteur.pagingInfo.batchSize}" rendered="#{lecteur.pagingInfo.firstItem >= lecteur.pagingInfo.batchSize}"/>&nbsp;
                    <h:commandLink action="#{lecteur.next}" value="Next #{lecteur.pagingInfo.batchSize}" rendered="#{lecteur.pagingInfo.lastItem + lecteur.pagingInfo.batchSize <= lecteur.pagingInfo.itemCount}"/>&nbsp;
                    <h:commandLink action="#{lecteur.next}" value="Remaining #{lecteur.pagingInfo.itemCount - lecteur.pagingInfo.lastItem}"
                                   rendered="#{lecteur.pagingInfo.lastItem < lecteur.pagingInfo.itemCount && lecteur.pagingInfo.lastItem + lecteur.pagingInfo.batchSize > lecteur.pagingInfo.itemCount}"/>
                    <h:dataTable value="#{lecteur.lecteurItems}" var="item" border="0" cellpadding="2" cellspacing="0" rowClasses="jsfcrud_odd_row,jsfcrud_even_row" rules="all" style="border:solid 1px">
                        <h:column>
                            <f:facet name="header">
                                <h:outputText value="LecteurId"/>
                            </f:facet>
                            <h:outputText value="#{item.lecteurId}"/>
                        </h:column>
                        <h:column>
                            <f:facet name="header">
                                <h:outputText value="EstBibliothecaire"/>
                            </f:facet>
                            <h:outputText value="#{item.estBibliothecaire}"/>
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
                            <h:commandLink value="Show" action="#{lecteur.detailSetup}">
                                <f:param name="jsfcrud.currentLecteur" value="#{jsfcrud_class['jsf.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][item][lecteur.converter].jsfcrud_invoke}"/>
                            </h:commandLink>
                            <h:outputText value=" "/>
                            <h:commandLink value="Edit" action="#{lecteur.editSetup}">
                                <f:param name="jsfcrud.currentLecteur" value="#{jsfcrud_class['jsf.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][item][lecteur.converter].jsfcrud_invoke}"/>
                            </h:commandLink>
                            <h:outputText value=" "/>
                            <h:commandLink value="Destroy" action="#{lecteur.remove}">
                                <f:param name="jsfcrud.currentLecteur" value="#{jsfcrud_class['jsf.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][item][lecteur.converter].jsfcrud_invoke}"/>
                            </h:commandLink>
                        </h:column>

                    </h:dataTable>
                </h:panelGroup>
                <br />
                <h:commandLink action="#{lecteur.createSetup}" value="New Lecteur"/>
                <br />
                <br />
                <h:commandLink value="Index" action="welcome" immediate="true" />


            </h:form>
        </body>
    </html>
</f:view>
