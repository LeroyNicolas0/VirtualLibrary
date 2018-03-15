<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsf/core" prefix="f" %>
<%@taglib uri="http://java.sun.com/jsf/html" prefix="h" %>
<f:view>
    <html>
        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
            <title>Emprunt Detail</title>
            <link rel="stylesheet" type="text/css" href="/VirtualLibraryWeb/faces/jsfcrud.css" />
        </head>
        <body>
            <h:panelGroup id="messagePanel" layout="block">
                <h:messages errorStyle="color: red" infoStyle="color: green" layout="table"/>
            </h:panelGroup>
            <h1>Emprunt Detail</h1>
            <h:form>
                <h:panelGrid columns="2">
                    <h:outputText value="EmpruntId:"/>
                    <h:outputText value="#{emprunt.emprunt.empruntId}" title="EmpruntId" />
                    <h:outputText value="DateEmprunt:"/>
                    <h:outputText value="#{emprunt.emprunt.dateEmprunt}" title="DateEmprunt" >
                        <f:convertDateTime pattern="MM/dd/yyyy" />
                    </h:outputText>
                    <h:outputText value="DateRetour:"/>
                    <h:outputText value="#{emprunt.emprunt.dateRetour}" title="DateRetour" >
                        <f:convertDateTime pattern="MM/dd/yyyy" />
                    </h:outputText>
                    <h:outputText value="DocumentIdFk:"/>
                    <h:panelGroup>
                        <h:outputText value="#{emprunt.emprunt.documentIdFk}"/>
                        <h:panelGroup rendered="#{emprunt.emprunt.documentIdFk != null}">
                            <h:outputText value=" ("/>
                            <h:commandLink value="Show" action="#{document.detailSetup}">
                                <f:param name="jsfcrud.currentEmprunt" value="#{jsfcrud_class['jsf.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][emprunt.emprunt][emprunt.converter].jsfcrud_invoke}"/>
                                <f:param name="jsfcrud.currentDocument" value="#{jsfcrud_class['jsf.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][emprunt.emprunt.documentIdFk][document.converter].jsfcrud_invoke}"/>
                                <f:param name="jsfcrud.relatedController" value="emprunt"/>
                                <f:param name="jsfcrud.relatedControllerType" value="jsf.EmpruntController"/>
                            </h:commandLink>
                            <h:outputText value=" "/>
                            <h:commandLink value="Edit" action="#{document.editSetup}">
                                <f:param name="jsfcrud.currentEmprunt" value="#{jsfcrud_class['jsf.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][emprunt.emprunt][emprunt.converter].jsfcrud_invoke}"/>
                                <f:param name="jsfcrud.currentDocument" value="#{jsfcrud_class['jsf.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][emprunt.emprunt.documentIdFk][document.converter].jsfcrud_invoke}"/>
                                <f:param name="jsfcrud.relatedController" value="emprunt"/>
                                <f:param name="jsfcrud.relatedControllerType" value="jsf.EmpruntController"/>
                            </h:commandLink>
                            <h:outputText value=" "/>
                            <h:commandLink value="Destroy" action="#{document.destroy}">
                                <f:param name="jsfcrud.currentEmprunt" value="#{jsfcrud_class['jsf.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][emprunt.emprunt][emprunt.converter].jsfcrud_invoke}"/>
                                <f:param name="jsfcrud.currentDocument" value="#{jsfcrud_class['jsf.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][emprunt.emprunt.documentIdFk][document.converter].jsfcrud_invoke}"/>
                                <f:param name="jsfcrud.relatedController" value="emprunt"/>
                                <f:param name="jsfcrud.relatedControllerType" value="jsf.EmpruntController"/>
                            </h:commandLink>
                            <h:outputText value=" )"/>
                        </h:panelGroup>
                    </h:panelGroup>
                    <h:outputText value="LecteurIdFk:"/>
                    <h:panelGroup>
                        <h:outputText value="#{emprunt.emprunt.lecteurIdFk}"/>
                        <h:panelGroup rendered="#{emprunt.emprunt.lecteurIdFk != null}">
                            <h:outputText value=" ("/>
                            <h:commandLink value="Show" action="#{lecteur.detailSetup}">
                                <f:param name="jsfcrud.currentEmprunt" value="#{jsfcrud_class['jsf.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][emprunt.emprunt][emprunt.converter].jsfcrud_invoke}"/>
                                <f:param name="jsfcrud.currentLecteur" value="#{jsfcrud_class['jsf.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][emprunt.emprunt.lecteurIdFk][lecteur.converter].jsfcrud_invoke}"/>
                                <f:param name="jsfcrud.relatedController" value="emprunt"/>
                                <f:param name="jsfcrud.relatedControllerType" value="jsf.EmpruntController"/>
                            </h:commandLink>
                            <h:outputText value=" "/>
                            <h:commandLink value="Edit" action="#{lecteur.editSetup}">
                                <f:param name="jsfcrud.currentEmprunt" value="#{jsfcrud_class['jsf.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][emprunt.emprunt][emprunt.converter].jsfcrud_invoke}"/>
                                <f:param name="jsfcrud.currentLecteur" value="#{jsfcrud_class['jsf.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][emprunt.emprunt.lecteurIdFk][lecteur.converter].jsfcrud_invoke}"/>
                                <f:param name="jsfcrud.relatedController" value="emprunt"/>
                                <f:param name="jsfcrud.relatedControllerType" value="jsf.EmpruntController"/>
                            </h:commandLink>
                            <h:outputText value=" "/>
                            <h:commandLink value="Destroy" action="#{lecteur.destroy}">
                                <f:param name="jsfcrud.currentEmprunt" value="#{jsfcrud_class['jsf.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][emprunt.emprunt][emprunt.converter].jsfcrud_invoke}"/>
                                <f:param name="jsfcrud.currentLecteur" value="#{jsfcrud_class['jsf.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][emprunt.emprunt.lecteurIdFk][lecteur.converter].jsfcrud_invoke}"/>
                                <f:param name="jsfcrud.relatedController" value="emprunt"/>
                                <f:param name="jsfcrud.relatedControllerType" value="jsf.EmpruntController"/>
                            </h:commandLink>
                            <h:outputText value=" )"/>
                        </h:panelGroup>
                    </h:panelGroup>


                </h:panelGrid>
                <br />
                <h:commandLink action="#{emprunt.remove}" value="Destroy">
                    <f:param name="jsfcrud.currentEmprunt" value="#{jsfcrud_class['jsf.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][emprunt.emprunt][emprunt.converter].jsfcrud_invoke}" />
                </h:commandLink>
                <br />
                <br />
                <h:commandLink action="#{emprunt.editSetup}" value="Edit">
                    <f:param name="jsfcrud.currentEmprunt" value="#{jsfcrud_class['jsf.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][emprunt.emprunt][emprunt.converter].jsfcrud_invoke}" />
                </h:commandLink>
                <br />
                <h:commandLink action="#{emprunt.createSetup}" value="New Emprunt" />
                <br />
                <h:commandLink action="#{emprunt.listSetup}" value="Show All Emprunt Items"/>
                <br />
                <br />
                <h:commandLink value="Index" action="welcome" immediate="true" />

            </h:form>
        </body>
    </html>
</f:view>
