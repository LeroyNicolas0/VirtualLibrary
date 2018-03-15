<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsf/core" prefix="f" %>
<%@taglib uri="http://java.sun.com/jsf/html" prefix="h" %>
<f:view>
    <html>
        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
            <title>Abonnement Detail</title>
            <link rel="stylesheet" type="text/css" href="/VirtualLibraryWeb/faces/jsfcrud.css" />
        </head>
        <body>
            <h:panelGroup id="messagePanel" layout="block">
                <h:messages errorStyle="color: red" infoStyle="color: green" layout="table"/>
            </h:panelGroup>
            <h1>Abonnement Detail</h1>
            <h:form>
                <h:panelGrid columns="2">
                    <h:outputText value="AbonnementId:"/>
                    <h:outputText value="#{abonnement.abonnement.abonnementId}" title="AbonnementId" />
                    <h:outputText value="DateDebut:"/>
                    <h:outputText value="#{abonnement.abonnement.dateDebut}" title="DateDebut" >
                        <f:convertDateTime pattern="MM/dd/yyyy" />
                    </h:outputText>
                    <h:outputText value="DateFin:"/>
                    <h:outputText value="#{abonnement.abonnement.dateFin}" title="DateFin" >
                        <f:convertDateTime pattern="MM/dd/yyyy" />
                    </h:outputText>
                    <h:outputText value="ForfaitIdFk:"/>
                    <h:panelGroup>
                        <h:outputText value="#{abonnement.abonnement.forfaitIdFk}"/>
                        <h:panelGroup rendered="#{abonnement.abonnement.forfaitIdFk != null}">
                            <h:outputText value=" ("/>
                            <h:commandLink value="Show" action="#{abonnement.detailSetup}">
                                <f:param name="jsfcrud.currentAbonnement" value="#{jsfcrud_class['jsf.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][abonnement.abonnement][abonnement.converter].jsfcrud_invoke}"/>
                                <f:param name="jsfcrud.currentAbonnement" value="#{jsfcrud_class['jsf.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][abonnement.abonnement.forfaitIdFk][abonnement.converter].jsfcrud_invoke}"/>
                                <f:param name="jsfcrud.relatedController" value="abonnement"/>
                                <f:param name="jsfcrud.relatedControllerType" value="jsf.AbonnementController"/>
                            </h:commandLink>
                            <h:outputText value=" "/>
                            <h:commandLink value="Edit" action="#{abonnement.editSetup}">
                                <f:param name="jsfcrud.currentAbonnement" value="#{jsfcrud_class['jsf.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][abonnement.abonnement][abonnement.converter].jsfcrud_invoke}"/>
                                <f:param name="jsfcrud.currentAbonnement" value="#{jsfcrud_class['jsf.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][abonnement.abonnement.forfaitIdFk][abonnement.converter].jsfcrud_invoke}"/>
                                <f:param name="jsfcrud.relatedController" value="abonnement"/>
                                <f:param name="jsfcrud.relatedControllerType" value="jsf.AbonnementController"/>
                            </h:commandLink>
                            <h:outputText value=" "/>
                            <h:commandLink value="Destroy" action="#{abonnement.destroy}">
                                <f:param name="jsfcrud.currentAbonnement" value="#{jsfcrud_class['jsf.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][abonnement.abonnement][abonnement.converter].jsfcrud_invoke}"/>
                                <f:param name="jsfcrud.currentAbonnement" value="#{jsfcrud_class['jsf.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][abonnement.abonnement.forfaitIdFk][abonnement.converter].jsfcrud_invoke}"/>
                                <f:param name="jsfcrud.relatedController" value="abonnement"/>
                                <f:param name="jsfcrud.relatedControllerType" value="jsf.AbonnementController"/>
                            </h:commandLink>
                            <h:outputText value=" )"/>
                        </h:panelGroup>
                    </h:panelGroup>
                    <h:outputText value="LecteurIdFk:"/>
                    <h:panelGroup>
                        <h:outputText value="#{abonnement.abonnement.lecteurIdFk}"/>
                        <h:panelGroup rendered="#{abonnement.abonnement.lecteurIdFk != null}">
                            <h:outputText value=" ("/>
                            <h:commandLink value="Show" action="#{lecteur.detailSetup}">
                                <f:param name="jsfcrud.currentAbonnement" value="#{jsfcrud_class['jsf.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][abonnement.abonnement][abonnement.converter].jsfcrud_invoke}"/>
                                <f:param name="jsfcrud.currentLecteur" value="#{jsfcrud_class['jsf.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][abonnement.abonnement.lecteurIdFk][lecteur.converter].jsfcrud_invoke}"/>
                                <f:param name="jsfcrud.relatedController" value="abonnement"/>
                                <f:param name="jsfcrud.relatedControllerType" value="jsf.AbonnementController"/>
                            </h:commandLink>
                            <h:outputText value=" "/>
                            <h:commandLink value="Edit" action="#{lecteur.editSetup}">
                                <f:param name="jsfcrud.currentAbonnement" value="#{jsfcrud_class['jsf.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][abonnement.abonnement][abonnement.converter].jsfcrud_invoke}"/>
                                <f:param name="jsfcrud.currentLecteur" value="#{jsfcrud_class['jsf.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][abonnement.abonnement.lecteurIdFk][lecteur.converter].jsfcrud_invoke}"/>
                                <f:param name="jsfcrud.relatedController" value="abonnement"/>
                                <f:param name="jsfcrud.relatedControllerType" value="jsf.AbonnementController"/>
                            </h:commandLink>
                            <h:outputText value=" "/>
                            <h:commandLink value="Destroy" action="#{lecteur.destroy}">
                                <f:param name="jsfcrud.currentAbonnement" value="#{jsfcrud_class['jsf.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][abonnement.abonnement][abonnement.converter].jsfcrud_invoke}"/>
                                <f:param name="jsfcrud.currentLecteur" value="#{jsfcrud_class['jsf.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][abonnement.abonnement.lecteurIdFk][lecteur.converter].jsfcrud_invoke}"/>
                                <f:param name="jsfcrud.relatedController" value="abonnement"/>
                                <f:param name="jsfcrud.relatedControllerType" value="jsf.AbonnementController"/>
                            </h:commandLink>
                            <h:outputText value=" )"/>
                        </h:panelGroup>
                    </h:panelGroup>

                    <h:outputText value="AbonnementCollection:" />
                    <h:panelGroup>
                        <h:outputText rendered="#{empty abonnement.abonnement.abonnementCollection}" value="(No Items)"/>
                        <h:dataTable value="#{abonnement.abonnement.abonnementCollection}" var="item" 
                                     border="0" cellpadding="2" cellspacing="0" rowClasses="jsfcrud_odd_row,jsfcrud_even_row" rules="all" style="border:solid 1px" 
                                     rendered="#{not empty abonnement.abonnement.abonnementCollection}">
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
                                    <f:param name="jsfcrud.currentAbonnement" value="#{jsfcrud_class['jsf.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][abonnement.abonnement][abonnement.converter].jsfcrud_invoke}"/>
                                    <f:param name="jsfcrud.currentAbonnement" value="#{jsfcrud_class['jsf.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][item][abonnement.converter].jsfcrud_invoke}"/>
                                    <f:param name="jsfcrud.relatedController" value="abonnement" />
                                    <f:param name="jsfcrud.relatedControllerType" value="jsf.AbonnementController" />
                                </h:commandLink>
                                <h:outputText value=" "/>
                                <h:commandLink value="Edit" action="#{abonnement.editSetup}">
                                    <f:param name="jsfcrud.currentAbonnement" value="#{jsfcrud_class['jsf.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][abonnement.abonnement][abonnement.converter].jsfcrud_invoke}"/>
                                    <f:param name="jsfcrud.currentAbonnement" value="#{jsfcrud_class['jsf.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][item][abonnement.converter].jsfcrud_invoke}"/>
                                    <f:param name="jsfcrud.relatedController" value="abonnement" />
                                    <f:param name="jsfcrud.relatedControllerType" value="jsf.AbonnementController" />
                                </h:commandLink>
                                <h:outputText value=" "/>
                                <h:commandLink value="Destroy" action="#{abonnement.destroy}">
                                    <f:param name="jsfcrud.currentAbonnement" value="#{jsfcrud_class['jsf.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][abonnement.abonnement][abonnement.converter].jsfcrud_invoke}"/>
                                    <f:param name="jsfcrud.currentAbonnement" value="#{jsfcrud_class['jsf.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][item][abonnement.converter].jsfcrud_invoke}"/>
                                    <f:param name="jsfcrud.relatedController" value="abonnement" />
                                    <f:param name="jsfcrud.relatedControllerType" value="jsf.AbonnementController" />
                                </h:commandLink>
                            </h:column>
                        </h:dataTable>
                    </h:panelGroup>

                </h:panelGrid>
                <br />
                <h:commandLink action="#{abonnement.remove}" value="Destroy">
                    <f:param name="jsfcrud.currentAbonnement" value="#{jsfcrud_class['jsf.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][abonnement.abonnement][abonnement.converter].jsfcrud_invoke}" />
                </h:commandLink>
                <br />
                <br />
                <h:commandLink action="#{abonnement.editSetup}" value="Edit">
                    <f:param name="jsfcrud.currentAbonnement" value="#{jsfcrud_class['jsf.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][abonnement.abonnement][abonnement.converter].jsfcrud_invoke}" />
                </h:commandLink>
                <br />
                <h:commandLink action="#{abonnement.createSetup}" value="New Abonnement" />
                <br />
                <h:commandLink action="#{abonnement.listSetup}" value="Show All Abonnement Items"/>
                <br />
                <br />
                <h:commandLink value="Index" action="welcome" immediate="true" />

            </h:form>
        </body>
    </html>
</f:view>
