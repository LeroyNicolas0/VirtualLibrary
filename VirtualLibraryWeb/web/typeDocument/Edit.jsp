<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsf/core" prefix="f" %>
<%@taglib uri="http://java.sun.com/jsf/html" prefix="h" %>
<f:view>
    <html>
        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
            <title>Editing TypeDocument</title>
            <link rel="stylesheet" type="text/css" href="/VirtualLibraryWeb/faces/jsfcrud.css" />
        </head>
        <body>
            <h:panelGroup id="messagePanel" layout="block">
                <h:messages errorStyle="color: red" infoStyle="color: green" layout="table"/>
            </h:panelGroup>
            <h1>Editing TypeDocument</h1>
            <h:form>
                <h:panelGrid columns="2">
                    <h:outputText value="TypeDocumentId:"/>
                    <h:outputText value="#{typeDocument.typeDocument.typeDocumentId}" title="TypeDocumentId" />
                    <h:outputText value="Nom:"/>
                    <h:inputText id="nom" value="#{typeDocument.typeDocument.nom}" title="Nom" required="true" requiredMessage="The nom field is required." />
                    <h:outputText value="DocumentCollection:"/>
                    <h:selectManyListbox id="documentCollection" value="#{typeDocument.typeDocument.jsfcrud_transform[jsfcrud_class['jsf.util.JsfUtil'].jsfcrud_method.collectionToArray][jsfcrud_class['jsf.util.JsfUtil'].jsfcrud_method.arrayToList].documentCollection}" title="DocumentCollection" size="6" converter="#{document.converter}" >
                        <f:selectItems value="#{document.documentItemsAvailableSelectMany}"/>
                    </h:selectManyListbox>

                </h:panelGrid>
                <br />
                <h:commandLink action="#{typeDocument.edit}" value="Save">
                    <f:param name="jsfcrud.currentTypeDocument" value="#{jsfcrud_class['jsf.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][typeDocument.typeDocument][typeDocument.converter].jsfcrud_invoke}"/>
                </h:commandLink>
                <br />
                <br />
                <h:commandLink action="#{typeDocument.detailSetup}" value="Show" immediate="true">
                    <f:param name="jsfcrud.currentTypeDocument" value="#{jsfcrud_class['jsf.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][typeDocument.typeDocument][typeDocument.converter].jsfcrud_invoke}"/>
                </h:commandLink>
                <br />
                <h:commandLink action="#{typeDocument.listSetup}" value="Show All TypeDocument Items" immediate="true"/>
                <br />
                <br />
                <h:commandLink value="Index" action="welcome" immediate="true" />

            </h:form>
        </body>
    </html>
</f:view>
