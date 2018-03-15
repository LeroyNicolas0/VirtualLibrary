<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsf/core" prefix="f" %>
<%@taglib uri="http://java.sun.com/jsf/html" prefix="h" %>
<f:view>
    <html>
        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
            <title>Document Detail</title>
            <link rel="stylesheet" type="text/css" href="/VirtualLibraryWeb/faces/jsfcrud.css" />
        </head>
        <body>
            <h:panelGroup id="messagePanel" layout="block">
                <h:messages errorStyle="color: red" infoStyle="color: green" layout="table"/>
            </h:panelGroup>
            <h1>Document Detail</h1>
            <h:form>
                <h:panelGrid columns="2">
                    <h:outputText value="DocumentId:"/>
                    <h:outputText value="#{document.document.documentId}" title="DocumentId" />
                    <h:outputText value="Titre:"/>
                    <h:outputText value="#{document.document.titre}" title="Titre" />
                    <h:outputText value="DateParution:"/>
                    <h:outputText value="#{document.document.dateParution}" title="DateParution" >
                        <f:convertDateTime pattern="MM/dd/yyyy" />
                    </h:outputText>
                    <h:outputText value="Description:"/>
                    <h:outputText value="#{document.document.description}" title="Description" />
                    <h:outputText value="NombrePages:"/>
                    <h:outputText value="#{document.document.nombrePages}" title="NombrePages" />
                    <h:outputText value="Isbn:"/>
                    <h:outputText value="#{document.document.isbn}" title="Isbn" />
                    <h:outputText value="Langue:"/>
                    <h:outputText value="#{document.document.langue}" title="Langue" />
                    <h:outputText value="Editeur:"/>
                    <h:outputText value="#{document.document.editeur}" title="Editeur" />
                    <h:outputText value="Validation:"/>
                    <h:outputText value="#{document.document.validation}" title="Validation" />
                    <h:outputText value="MaisonDisque:"/>
                    <h:outputText value="#{document.document.maisonDisque}" title="MaisonDisque" />
                    <h:outputText value="NombrePiste:"/>
                    <h:outputText value="#{document.document.nombrePiste}" title="NombrePiste" />
                    <h:outputText value="SocieteProduction:"/>
                    <h:outputText value="#{document.document.societeProduction}" title="SocieteProduction" />
                    <h:outputText value="MaisonEdition:"/>
                    <h:outputText value="#{document.document.maisonEdition}" title="MaisonEdition" />
                    <h:outputText value="Duree:"/>
                    <h:outputText value="#{document.document.duree}" title="Duree" />
                    <h:outputText value="PublicVise:"/>
                    <h:outputText value="#{document.document.publicVise}" title="PublicVise" />
                    <h:outputText value="TypePeriodique:"/>
                    <h:outputText value="#{document.document.typePeriodique}" title="TypePeriodique" />
                    <h:outputText value="Issn:"/>
                    <h:outputText value="#{document.document.issn}" title="Issn" />
                    <h:outputText value="NumeroMagazine:"/>
                    <h:outputText value="#{document.document.numeroMagazine}" title="NumeroMagazine" />
                    <h:outputText value="VisibleLecteur:"/>
                    <h:outputText value="#{document.document.visibleLecteur}" title="VisibleLecteur" />
                    <h:outputText value="LienCouverture:"/>
                    <h:outputText value="#{document.document.lienCouverture}" title="LienCouverture" />
                    <h:outputText value="NombreExemplaire:"/>
                    <h:outputText value="#{document.document.nombreExemplaire}" title="NombreExemplaire" />
                    <h:outputText value="TypeDocumentIdFk:"/>
                    <h:panelGroup>
                        <h:outputText value="#{document.document.typeDocumentIdFk}"/>
                        <h:panelGroup rendered="#{document.document.typeDocumentIdFk != null}">
                            <h:outputText value=" ("/>
                            <h:commandLink value="Show" action="#{typeDocument.detailSetup}">
                                <f:param name="jsfcrud.currentDocument" value="#{jsfcrud_class['jsf.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][document.document][document.converter].jsfcrud_invoke}"/>
                                <f:param name="jsfcrud.currentTypeDocument" value="#{jsfcrud_class['jsf.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][document.document.typeDocumentIdFk][typeDocument.converter].jsfcrud_invoke}"/>
                                <f:param name="jsfcrud.relatedController" value="document"/>
                                <f:param name="jsfcrud.relatedControllerType" value="jsf.DocumentController"/>
                            </h:commandLink>
                            <h:outputText value=" "/>
                            <h:commandLink value="Edit" action="#{typeDocument.editSetup}">
                                <f:param name="jsfcrud.currentDocument" value="#{jsfcrud_class['jsf.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][document.document][document.converter].jsfcrud_invoke}"/>
                                <f:param name="jsfcrud.currentTypeDocument" value="#{jsfcrud_class['jsf.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][document.document.typeDocumentIdFk][typeDocument.converter].jsfcrud_invoke}"/>
                                <f:param name="jsfcrud.relatedController" value="document"/>
                                <f:param name="jsfcrud.relatedControllerType" value="jsf.DocumentController"/>
                            </h:commandLink>
                            <h:outputText value=" "/>
                            <h:commandLink value="Destroy" action="#{typeDocument.destroy}">
                                <f:param name="jsfcrud.currentDocument" value="#{jsfcrud_class['jsf.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][document.document][document.converter].jsfcrud_invoke}"/>
                                <f:param name="jsfcrud.currentTypeDocument" value="#{jsfcrud_class['jsf.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][document.document.typeDocumentIdFk][typeDocument.converter].jsfcrud_invoke}"/>
                                <f:param name="jsfcrud.relatedController" value="document"/>
                                <f:param name="jsfcrud.relatedControllerType" value="jsf.DocumentController"/>
                            </h:commandLink>
                            <h:outputText value=" )"/>
                        </h:panelGroup>
                    </h:panelGroup>

                    <h:outputText value="PaysInterditCollection:" />
                    <h:panelGroup>
                        <h:outputText rendered="#{empty document.document.paysInterditCollection}" value="(No Items)"/>
                        <h:dataTable value="#{document.document.paysInterditCollection}" var="item" 
                                     border="0" cellpadding="2" cellspacing="0" rowClasses="jsfcrud_odd_row,jsfcrud_even_row" rules="all" style="border:solid 1px" 
                                     rendered="#{not empty document.document.paysInterditCollection}">
                            <h:column>
                                <f:facet name="header">
                                    <h:outputText value="PaysId"/>
                                </f:facet>
                                <h:outputText value="#{item.paysId}"/>
                            </h:column>
                            <h:column>
                                <f:facet name="header">
                                    <h:outputText value="Nom"/>
                                </f:facet>
                                <h:outputText value="#{item.nom}"/>
                            </h:column>
                            <h:column>
                                <f:facet name="header">
                                    <h:outputText escape="false" value="&nbsp;"/>
                                </f:facet>
                                <h:commandLink value="Show" action="#{paysInterdit.detailSetup}">
                                    <f:param name="jsfcrud.currentDocument" value="#{jsfcrud_class['jsf.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][document.document][document.converter].jsfcrud_invoke}"/>
                                    <f:param name="jsfcrud.currentPaysInterdit" value="#{jsfcrud_class['jsf.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][item][paysInterdit.converter].jsfcrud_invoke}"/>
                                    <f:param name="jsfcrud.relatedController" value="document" />
                                    <f:param name="jsfcrud.relatedControllerType" value="jsf.DocumentController" />
                                </h:commandLink>
                                <h:outputText value=" "/>
                                <h:commandLink value="Edit" action="#{paysInterdit.editSetup}">
                                    <f:param name="jsfcrud.currentDocument" value="#{jsfcrud_class['jsf.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][document.document][document.converter].jsfcrud_invoke}"/>
                                    <f:param name="jsfcrud.currentPaysInterdit" value="#{jsfcrud_class['jsf.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][item][paysInterdit.converter].jsfcrud_invoke}"/>
                                    <f:param name="jsfcrud.relatedController" value="document" />
                                    <f:param name="jsfcrud.relatedControllerType" value="jsf.DocumentController" />
                                </h:commandLink>
                                <h:outputText value=" "/>
                                <h:commandLink value="Destroy" action="#{paysInterdit.destroy}">
                                    <f:param name="jsfcrud.currentDocument" value="#{jsfcrud_class['jsf.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][document.document][document.converter].jsfcrud_invoke}"/>
                                    <f:param name="jsfcrud.currentPaysInterdit" value="#{jsfcrud_class['jsf.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][item][paysInterdit.converter].jsfcrud_invoke}"/>
                                    <f:param name="jsfcrud.relatedController" value="document" />
                                    <f:param name="jsfcrud.relatedControllerType" value="jsf.DocumentController" />
                                </h:commandLink>
                            </h:column>
                        </h:dataTable>
                    </h:panelGroup>
                    <h:outputText value="MotCleCollection:" />
                    <h:panelGroup>
                        <h:outputText rendered="#{empty document.document.motCleCollection}" value="(No Items)"/>
                        <h:dataTable value="#{document.document.motCleCollection}" var="item" 
                                     border="0" cellpadding="2" cellspacing="0" rowClasses="jsfcrud_odd_row,jsfcrud_even_row" rules="all" style="border:solid 1px" 
                                     rendered="#{not empty document.document.motCleCollection}">
                            <h:column>
                                <f:facet name="header">
                                    <h:outputText value="MotCleId"/>
                                </f:facet>
                                <h:outputText value="#{item.motCleId}"/>
                            </h:column>
                            <h:column>
                                <f:facet name="header">
                                    <h:outputText value="Nom"/>
                                </f:facet>
                                <h:outputText value="#{item.nom}"/>
                            </h:column>
                            <h:column>
                                <f:facet name="header">
                                    <h:outputText escape="false" value="&nbsp;"/>
                                </f:facet>
                                <h:commandLink value="Show" action="#{motCle.detailSetup}">
                                    <f:param name="jsfcrud.currentDocument" value="#{jsfcrud_class['jsf.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][document.document][document.converter].jsfcrud_invoke}"/>
                                    <f:param name="jsfcrud.currentMotCle" value="#{jsfcrud_class['jsf.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][item][motCle.converter].jsfcrud_invoke}"/>
                                    <f:param name="jsfcrud.relatedController" value="document" />
                                    <f:param name="jsfcrud.relatedControllerType" value="jsf.DocumentController" />
                                </h:commandLink>
                                <h:outputText value=" "/>
                                <h:commandLink value="Edit" action="#{motCle.editSetup}">
                                    <f:param name="jsfcrud.currentDocument" value="#{jsfcrud_class['jsf.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][document.document][document.converter].jsfcrud_invoke}"/>
                                    <f:param name="jsfcrud.currentMotCle" value="#{jsfcrud_class['jsf.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][item][motCle.converter].jsfcrud_invoke}"/>
                                    <f:param name="jsfcrud.relatedController" value="document" />
                                    <f:param name="jsfcrud.relatedControllerType" value="jsf.DocumentController" />
                                </h:commandLink>
                                <h:outputText value=" "/>
                                <h:commandLink value="Destroy" action="#{motCle.destroy}">
                                    <f:param name="jsfcrud.currentDocument" value="#{jsfcrud_class['jsf.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][document.document][document.converter].jsfcrud_invoke}"/>
                                    <f:param name="jsfcrud.currentMotCle" value="#{jsfcrud_class['jsf.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][item][motCle.converter].jsfcrud_invoke}"/>
                                    <f:param name="jsfcrud.relatedController" value="document" />
                                    <f:param name="jsfcrud.relatedControllerType" value="jsf.DocumentController" />
                                </h:commandLink>
                            </h:column>
                        </h:dataTable>
                    </h:panelGroup>
                    <h:outputText value="ParticipantCollection:" />
                    <h:panelGroup>
                        <h:outputText rendered="#{empty document.document.participantCollection}" value="(No Items)"/>
                        <h:dataTable value="#{document.document.participantCollection}" var="item" 
                                     border="0" cellpadding="2" cellspacing="0" rowClasses="jsfcrud_odd_row,jsfcrud_even_row" rules="all" style="border:solid 1px" 
                                     rendered="#{not empty document.document.participantCollection}">
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
                                    <f:param name="jsfcrud.currentDocument" value="#{jsfcrud_class['jsf.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][document.document][document.converter].jsfcrud_invoke}"/>
                                    <f:param name="jsfcrud.currentParticipant" value="#{jsfcrud_class['jsf.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][item][participant.converter].jsfcrud_invoke}"/>
                                    <f:param name="jsfcrud.relatedController" value="document" />
                                    <f:param name="jsfcrud.relatedControllerType" value="jsf.DocumentController" />
                                </h:commandLink>
                                <h:outputText value=" "/>
                                <h:commandLink value="Edit" action="#{participant.editSetup}">
                                    <f:param name="jsfcrud.currentDocument" value="#{jsfcrud_class['jsf.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][document.document][document.converter].jsfcrud_invoke}"/>
                                    <f:param name="jsfcrud.currentParticipant" value="#{jsfcrud_class['jsf.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][item][participant.converter].jsfcrud_invoke}"/>
                                    <f:param name="jsfcrud.relatedController" value="document" />
                                    <f:param name="jsfcrud.relatedControllerType" value="jsf.DocumentController" />
                                </h:commandLink>
                                <h:outputText value=" "/>
                                <h:commandLink value="Destroy" action="#{participant.destroy}">
                                    <f:param name="jsfcrud.currentDocument" value="#{jsfcrud_class['jsf.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][document.document][document.converter].jsfcrud_invoke}"/>
                                    <f:param name="jsfcrud.currentParticipant" value="#{jsfcrud_class['jsf.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][item][participant.converter].jsfcrud_invoke}"/>
                                    <f:param name="jsfcrud.relatedController" value="document" />
                                    <f:param name="jsfcrud.relatedControllerType" value="jsf.DocumentController" />
                                </h:commandLink>
                            </h:column>
                        </h:dataTable>
                    </h:panelGroup>
                    <h:outputText value="EmpruntCollection:" />
                    <h:panelGroup>
                        <h:outputText rendered="#{empty document.document.empruntCollection}" value="(No Items)"/>
                        <h:dataTable value="#{document.document.empruntCollection}" var="item" 
                                     border="0" cellpadding="2" cellspacing="0" rowClasses="jsfcrud_odd_row,jsfcrud_even_row" rules="all" style="border:solid 1px" 
                                     rendered="#{not empty document.document.empruntCollection}">
                            <h:column>
                                <f:facet name="header">
                                    <h:outputText value="EmpruntId"/>
                                </f:facet>
                                <h:outputText value="#{item.empruntId}"/>
                            </h:column>
                            <h:column>
                                <f:facet name="header">
                                    <h:outputText value="DateEmprunt"/>
                                </f:facet>
                                <h:outputText value="#{item.dateEmprunt}">
                                    <f:convertDateTime pattern="MM/dd/yyyy" />
                                </h:outputText>
                            </h:column>
                            <h:column>
                                <f:facet name="header">
                                    <h:outputText value="DateRetour"/>
                                </f:facet>
                                <h:outputText value="#{item.dateRetour}">
                                    <f:convertDateTime pattern="MM/dd/yyyy" />
                                </h:outputText>
                            </h:column>
                            <h:column>
                                <f:facet name="header">
                                    <h:outputText value="DocumentIdFk"/>
                                </f:facet>
                                <h:outputText value="#{item.documentIdFk}"/>
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
                                <h:commandLink value="Show" action="#{emprunt.detailSetup}">
                                    <f:param name="jsfcrud.currentDocument" value="#{jsfcrud_class['jsf.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][document.document][document.converter].jsfcrud_invoke}"/>
                                    <f:param name="jsfcrud.currentEmprunt" value="#{jsfcrud_class['jsf.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][item][emprunt.converter].jsfcrud_invoke}"/>
                                    <f:param name="jsfcrud.relatedController" value="document" />
                                    <f:param name="jsfcrud.relatedControllerType" value="jsf.DocumentController" />
                                </h:commandLink>
                                <h:outputText value=" "/>
                                <h:commandLink value="Edit" action="#{emprunt.editSetup}">
                                    <f:param name="jsfcrud.currentDocument" value="#{jsfcrud_class['jsf.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][document.document][document.converter].jsfcrud_invoke}"/>
                                    <f:param name="jsfcrud.currentEmprunt" value="#{jsfcrud_class['jsf.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][item][emprunt.converter].jsfcrud_invoke}"/>
                                    <f:param name="jsfcrud.relatedController" value="document" />
                                    <f:param name="jsfcrud.relatedControllerType" value="jsf.DocumentController" />
                                </h:commandLink>
                                <h:outputText value=" "/>
                                <h:commandLink value="Destroy" action="#{emprunt.destroy}">
                                    <f:param name="jsfcrud.currentDocument" value="#{jsfcrud_class['jsf.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][document.document][document.converter].jsfcrud_invoke}"/>
                                    <f:param name="jsfcrud.currentEmprunt" value="#{jsfcrud_class['jsf.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][item][emprunt.converter].jsfcrud_invoke}"/>
                                    <f:param name="jsfcrud.relatedController" value="document" />
                                    <f:param name="jsfcrud.relatedControllerType" value="jsf.DocumentController" />
                                </h:commandLink>
                            </h:column>
                        </h:dataTable>
                    </h:panelGroup>
                    <h:outputText value="ReservationCollection:" />
                    <h:panelGroup>
                        <h:outputText rendered="#{empty document.document.reservationCollection}" value="(No Items)"/>
                        <h:dataTable value="#{document.document.reservationCollection}" var="item" 
                                     border="0" cellpadding="2" cellspacing="0" rowClasses="jsfcrud_odd_row,jsfcrud_even_row" rules="all" style="border:solid 1px" 
                                     rendered="#{not empty document.document.reservationCollection}">
                            <h:column>
                                <f:facet name="header">
                                    <h:outputText value="ReservationId"/>
                                </f:facet>
                                <h:outputText value="#{item.reservationId}"/>
                            </h:column>
                            <h:column>
                                <f:facet name="header">
                                    <h:outputText value="DateReservation"/>
                                </f:facet>
                                <h:outputText value="#{item.dateReservation}">
                                    <f:convertDateTime pattern="MM/dd/yyyy" />
                                </h:outputText>
                            </h:column>
                            <h:column>
                                <f:facet name="header">
                                    <h:outputText value="DocumentIdFk"/>
                                </f:facet>
                                <h:outputText value="#{item.documentIdFk}"/>
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
                                <h:commandLink value="Show" action="#{reservation.detailSetup}">
                                    <f:param name="jsfcrud.currentDocument" value="#{jsfcrud_class['jsf.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][document.document][document.converter].jsfcrud_invoke}"/>
                                    <f:param name="jsfcrud.currentReservation" value="#{jsfcrud_class['jsf.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][item][reservation.converter].jsfcrud_invoke}"/>
                                    <f:param name="jsfcrud.relatedController" value="document" />
                                    <f:param name="jsfcrud.relatedControllerType" value="jsf.DocumentController" />
                                </h:commandLink>
                                <h:outputText value=" "/>
                                <h:commandLink value="Edit" action="#{reservation.editSetup}">
                                    <f:param name="jsfcrud.currentDocument" value="#{jsfcrud_class['jsf.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][document.document][document.converter].jsfcrud_invoke}"/>
                                    <f:param name="jsfcrud.currentReservation" value="#{jsfcrud_class['jsf.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][item][reservation.converter].jsfcrud_invoke}"/>
                                    <f:param name="jsfcrud.relatedController" value="document" />
                                    <f:param name="jsfcrud.relatedControllerType" value="jsf.DocumentController" />
                                </h:commandLink>
                                <h:outputText value=" "/>
                                <h:commandLink value="Destroy" action="#{reservation.destroy}">
                                    <f:param name="jsfcrud.currentDocument" value="#{jsfcrud_class['jsf.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][document.document][document.converter].jsfcrud_invoke}"/>
                                    <f:param name="jsfcrud.currentReservation" value="#{jsfcrud_class['jsf.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][item][reservation.converter].jsfcrud_invoke}"/>
                                    <f:param name="jsfcrud.relatedController" value="document" />
                                    <f:param name="jsfcrud.relatedControllerType" value="jsf.DocumentController" />
                                </h:commandLink>
                            </h:column>
                        </h:dataTable>
                    </h:panelGroup>

                </h:panelGrid>
                <br />
                <h:commandLink action="#{document.remove}" value="Destroy">
                    <f:param name="jsfcrud.currentDocument" value="#{jsfcrud_class['jsf.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][document.document][document.converter].jsfcrud_invoke}" />
                </h:commandLink>
                <br />
                <br />
                <h:commandLink action="#{document.editSetup}" value="Edit">
                    <f:param name="jsfcrud.currentDocument" value="#{jsfcrud_class['jsf.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][document.document][document.converter].jsfcrud_invoke}" />
                </h:commandLink>
                <br />
                <h:commandLink action="#{document.createSetup}" value="New Document" />
                <br />
                <h:commandLink action="#{document.listSetup}" value="Show All Document Items"/>
                <br />
                <br />
                <h:commandLink value="Index" action="welcome" immediate="true" />

            </h:form>
        </body>
    </html>
</f:view>
