<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsf/core" prefix="f" %>
<%@taglib uri="http://java.sun.com/jsf/html" prefix="h" %>
<f:view>
    <html>
        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
            <title>TypeParticipant Detail</title>
            <link rel="stylesheet" type="text/css" href="/VirtualLibraryWeb/faces/jsfcrud.css" />
        </head>
        <body>
            <h:panelGroup id="messagePanel" layout="block">
                <h:messages errorStyle="color: red" infoStyle="color: green" layout="table"/>
            </h:panelGroup>
            <h1>TypeParticipant Detail</h1>
            <h:form>
                <h:panelGrid columns="2">
                    <h:outputText value="TypeParticipantId:"/>
                    <h:outputText value="#{typeParticipant.typeParticipant.typeParticipantId}" title="TypeParticipantId" />
                    <h:outputText value="Nom:"/>
                    <h:outputText value="#{typeParticipant.typeParticipant.nom}" title="Nom" />

                    <h:outputText value="ParticipantCollection:" />
                    <h:panelGroup>
                        <h:outputText rendered="#{empty typeParticipant.typeParticipant.participantCollection}" value="(No Items)"/>
                        <h:dataTable value="#{typeParticipant.typeParticipant.participantCollection}" var="item" 
                                     border="0" cellpadding="2" cellspacing="0" rowClasses="jsfcrud_odd_row,jsfcrud_even_row" rules="all" style="border:solid 1px" 
                                     rendered="#{not empty typeParticipant.typeParticipant.participantCollection}">
                            <h:column>
                                <f:facet name="header">
                                    <h:outputText value="ParticipantId"/>
                                </f:facet>
                                <h:outputText value="#{item.participantId}"/>
                            </h:column>
                            <h:column>
                                <f:facet name="header">
                                    <h:outputText value="Pseudonyme"/>
                                </f:facet>
                                <h:outputText value="#{item.pseudonyme}"/>
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
                                    <h:outputText value="TypeParticpantIdFk"/>
                                </f:facet>
                                <h:outputText value="#{item.typeParticpantIdFk}"/>
                            </h:column>
                            <h:column>
                                <f:facet name="header">
                                    <h:outputText escape="false" value="&nbsp;"/>
                                </f:facet>
                                <h:commandLink value="Show" action="#{participant.detailSetup}">
                                    <f:param name="jsfcrud.currentTypeParticipant" value="#{jsfcrud_class['jsf.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][typeParticipant.typeParticipant][typeParticipant.converter].jsfcrud_invoke}"/>
                                    <f:param name="jsfcrud.currentParticipant" value="#{jsfcrud_class['jsf.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][item][participant.converter].jsfcrud_invoke}"/>
                                    <f:param name="jsfcrud.relatedController" value="typeParticipant" />
                                    <f:param name="jsfcrud.relatedControllerType" value="jsf.TypeParticipantController" />
                                </h:commandLink>
                                <h:outputText value=" "/>
                                <h:commandLink value="Edit" action="#{participant.editSetup}">
                                    <f:param name="jsfcrud.currentTypeParticipant" value="#{jsfcrud_class['jsf.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][typeParticipant.typeParticipant][typeParticipant.converter].jsfcrud_invoke}"/>
                                    <f:param name="jsfcrud.currentParticipant" value="#{jsfcrud_class['jsf.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][item][participant.converter].jsfcrud_invoke}"/>
                                    <f:param name="jsfcrud.relatedController" value="typeParticipant" />
                                    <f:param name="jsfcrud.relatedControllerType" value="jsf.TypeParticipantController" />
                                </h:commandLink>
                                <h:outputText value=" "/>
                                <h:commandLink value="Destroy" action="#{participant.destroy}">
                                    <f:param name="jsfcrud.currentTypeParticipant" value="#{jsfcrud_class['jsf.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][typeParticipant.typeParticipant][typeParticipant.converter].jsfcrud_invoke}"/>
                                    <f:param name="jsfcrud.currentParticipant" value="#{jsfcrud_class['jsf.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][item][participant.converter].jsfcrud_invoke}"/>
                                    <f:param name="jsfcrud.relatedController" value="typeParticipant" />
                                    <f:param name="jsfcrud.relatedControllerType" value="jsf.TypeParticipantController" />
                                </h:commandLink>
                            </h:column>
                        </h:dataTable>
                    </h:panelGroup>

                </h:panelGrid>
                <br />
                <h:commandLink action="#{typeParticipant.remove}" value="Destroy">
                    <f:param name="jsfcrud.currentTypeParticipant" value="#{jsfcrud_class['jsf.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][typeParticipant.typeParticipant][typeParticipant.converter].jsfcrud_invoke}" />
                </h:commandLink>
                <br />
                <br />
                <h:commandLink action="#{typeParticipant.editSetup}" value="Edit">
                    <f:param name="jsfcrud.currentTypeParticipant" value="#{jsfcrud_class['jsf.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][typeParticipant.typeParticipant][typeParticipant.converter].jsfcrud_invoke}" />
                </h:commandLink>
                <br />
                <h:commandLink action="#{typeParticipant.createSetup}" value="New TypeParticipant" />
                <br />
                <h:commandLink action="#{typeParticipant.listSetup}" value="Show All TypeParticipant Items"/>
                <br />
                <br />
                <h:commandLink value="Index" action="welcome" immediate="true" />

            </h:form>
        </body>
    </html>
</f:view>
