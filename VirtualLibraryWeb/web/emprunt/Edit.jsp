<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsf/core" prefix="f" %>
<%@taglib uri="http://java.sun.com/jsf/html" prefix="h" %>
<f:view>
    <html>
        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
            <title>Editing Emprunt</title>
            <link rel="stylesheet" type="text/css" href="/VirtualLibraryWeb/faces/jsfcrud.css" />
        </head>
        <body>
            <h:panelGroup id="messagePanel" layout="block">
                <h:messages errorStyle="color: red" infoStyle="color: green" layout="table"/>
            </h:panelGroup>
            <h1>Editing Emprunt</h1>
            <h:form>
                <h:panelGrid columns="2">
                    <h:outputText value="EmpruntId:"/>
                    <h:outputText value="#{emprunt.emprunt.empruntId}" title="EmpruntId" />
                    <h:outputText value="DateEmprunt (MM/dd/yyyy):"/>
                    <h:inputText id="dateEmprunt" value="#{emprunt.emprunt.dateEmprunt}" title="DateEmprunt" required="true" requiredMessage="The dateEmprunt field is required." >
                        <f:convertDateTime pattern="MM/dd/yyyy" />
                    </h:inputText>
                    <h:outputText value="DateRetour (MM/dd/yyyy):"/>
                    <h:inputText id="dateRetour" value="#{emprunt.emprunt.dateRetour}" title="DateRetour" required="true" requiredMessage="The dateRetour field is required." >
                        <f:convertDateTime pattern="MM/dd/yyyy" />
                    </h:inputText>
                    <h:outputText value="DocumentIdFk:"/>
                    <h:selectOneMenu id="documentIdFk" value="#{emprunt.emprunt.documentIdFk}" title="DocumentIdFk" required="true" requiredMessage="The documentIdFk field is required." >
                        <f:selectItems value="#{document.documentItemsAvailableSelectOne}"/>
                    </h:selectOneMenu>
                    <h:outputText value="LecteurIdFk:"/>
                    <h:selectOneMenu id="lecteurIdFk" value="#{emprunt.emprunt.lecteurIdFk}" title="LecteurIdFk" required="true" requiredMessage="The lecteurIdFk field is required." >
                        <f:selectItems value="#{lecteur.lecteurItemsAvailableSelectOne}"/>
                    </h:selectOneMenu>

                </h:panelGrid>
                <br />
                <h:commandLink action="#{emprunt.edit}" value="Save">
                    <f:param name="jsfcrud.currentEmprunt" value="#{jsfcrud_class['jsf.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][emprunt.emprunt][emprunt.converter].jsfcrud_invoke}"/>
                </h:commandLink>
                <br />
                <br />
                <h:commandLink action="#{emprunt.detailSetup}" value="Show" immediate="true">
                    <f:param name="jsfcrud.currentEmprunt" value="#{jsfcrud_class['jsf.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][emprunt.emprunt][emprunt.converter].jsfcrud_invoke}"/>
                </h:commandLink>
                <br />
                <h:commandLink action="#{emprunt.listSetup}" value="Show All Emprunt Items" immediate="true"/>
                <br />
                <br />
                <h:commandLink value="Index" action="welcome" immediate="true" />

            </h:form>
        </body>
    </html>
</f:view>
