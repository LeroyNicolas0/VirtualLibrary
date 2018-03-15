<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsf/core" prefix="f" %>
<%@taglib uri="http://java.sun.com/jsf/html" prefix="h" %>
<f:view>
    <html>
        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
            <title>Lecteur Detail</title>
            <link rel="stylesheet" type="text/css" href="/VirtualLibraryWeb/faces/jsfcrud.css" />
        </head>
        <body>
            <h:panelGroup id="messagePanel" layout="block">
                <h:messages errorStyle="color: red" infoStyle="color: green" layout="table"/>
            </h:panelGroup>
            <h1>Lecteur Detail</h1>
            <h:form>
                <h:panelGrid columns="2">
                    <h:outputText value="LecteurId:"/>
                    <h:outputText value="#{lecteur.lecteur.lecteurId}" title="LecteurId" />
                    <h:outputText value="EstBibliothecaire:"/>
                    <h:outputText value="#{lecteur.lecteur.estBibliothecaire}" title="EstBibliothecaire" />
                    <h:outputText value="Prenom:"/>
                    <h:outputText value="#{lecteur.lecteur.prenom}" title="Prenom" />
                    <h:outputText value="Nom:"/>
                    <h:outputText value="#{lecteur.lecteur.nom}" title="Nom" />
                    <h:outputText value="DateNaissance:"/>
                    <h:outputText value="#{lecteur.lecteur.dateNaissance}" title="DateNaissance" >
                        <f:convertDateTime pattern="MM/dd/yyyy" />
                    </h:outputText>
                    <h:outputText value="Login:"/>
                    <h:outputText value="#{lecteur.lecteur.login}" title="Login" />
                    <h:outputText value="Password:"/>
                    <h:outputText value="#{lecteur.lecteur.password}" title="Password" />
                    <h:outputText value="Mail:"/>
                    <h:outputText value="#{lecteur.lecteur.mail}" title="Mail" />
                    <h:outputText value="DateInscription:"/>
                    <h:outputText value="#{lecteur.lecteur.dateInscription}" title="DateInscription" >
                        <f:convertDateTime pattern="MM/dd/yyyy" />
                    </h:outputText>

                    <h:outputText value="EmpruntCollection:" />
                    <h:panelGroup>
                        <h:outputText rendered="#{empty lecteur.lecteur.empruntCollection}" value="(No Items)"/>
                        <h:dataTable value="#{lecteur.lecteur.empruntCollection}" var="item" 
                                     border="0" cellpadding="2" cellspacing="0" rowClasses="jsfcrud_odd_row,jsfcrud_even_row" rules="all" style="border:solid 1px" 
                                     rendered="#{not empty lecteur.lecteur.empruntCollection}">
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
                                    <f:param name="jsfcrud.currentLecteur" value="#{jsfcrud_class['jsf.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][lecteur.lecteur][lecteur.converter].jsfcrud_invoke}"/>
                                    <f:param name="jsfcrud.currentEmprunt" value="#{jsfcrud_class['jsf.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][item][emprunt.converter].jsfcrud_invoke}"/>
                                    <f:param name="jsfcrud.relatedController" value="lecteur" />
                                    <f:param name="jsfcrud.relatedControllerType" value="jsf.LecteurController" />
                                </h:commandLink>
                                <h:outputText value=" "/>
                                <h:commandLink value="Edit" action="#{emprunt.editSetup}">
                                    <f:param name="jsfcrud.currentLecteur" value="#{jsfcrud_class['jsf.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][lecteur.lecteur][lecteur.converter].jsfcrud_invoke}"/>
                                    <f:param name="jsfcrud.currentEmprunt" value="#{jsfcrud_class['jsf.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][item][emprunt.converter].jsfcrud_invoke}"/>
                                    <f:param name="jsfcrud.relatedController" value="lecteur" />
                                    <f:param name="jsfcrud.relatedControllerType" value="jsf.LecteurController" />
                                </h:commandLink>
                                <h:outputText value=" "/>
                                <h:commandLink value="Destroy" action="#{emprunt.destroy}">
                                    <f:param name="jsfcrud.currentLecteur" value="#{jsfcrud_class['jsf.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][lecteur.lecteur][lecteur.converter].jsfcrud_invoke}"/>
                                    <f:param name="jsfcrud.currentEmprunt" value="#{jsfcrud_class['jsf.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][item][emprunt.converter].jsfcrud_invoke}"/>
                                    <f:param name="jsfcrud.relatedController" value="lecteur" />
                                    <f:param name="jsfcrud.relatedControllerType" value="jsf.LecteurController" />
                                </h:commandLink>
                            </h:column>
                        </h:dataTable>
                    </h:panelGroup>
                    <h:outputText value="AbonnementCollection:" />
                    <h:panelGroup>
                        <h:outputText rendered="#{empty lecteur.lecteur.abonnementCollection}" value="(No Items)"/>
                        <h:dataTable value="#{lecteur.lecteur.abonnementCollection}" var="item" 
                                     border="0" cellpadding="2" cellspacing="0" rowClasses="jsfcrud_odd_row,jsfcrud_even_row" rules="all" style="border:solid 1px" 
                                     rendered="#{not empty lecteur.lecteur.abonnementCollection}">
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
                                    <f:param name="jsfcrud.currentLecteur" value="#{jsfcrud_class['jsf.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][lecteur.lecteur][lecteur.converter].jsfcrud_invoke}"/>
                                    <f:param name="jsfcrud.currentAbonnement" value="#{jsfcrud_class['jsf.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][item][abonnement.converter].jsfcrud_invoke}"/>
                                    <f:param name="jsfcrud.relatedController" value="lecteur" />
                                    <f:param name="jsfcrud.relatedControllerType" value="jsf.LecteurController" />
                                </h:commandLink>
                                <h:outputText value=" "/>
                                <h:commandLink value="Edit" action="#{abonnement.editSetup}">
                                    <f:param name="jsfcrud.currentLecteur" value="#{jsfcrud_class['jsf.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][lecteur.lecteur][lecteur.converter].jsfcrud_invoke}"/>
                                    <f:param name="jsfcrud.currentAbonnement" value="#{jsfcrud_class['jsf.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][item][abonnement.converter].jsfcrud_invoke}"/>
                                    <f:param name="jsfcrud.relatedController" value="lecteur" />
                                    <f:param name="jsfcrud.relatedControllerType" value="jsf.LecteurController" />
                                </h:commandLink>
                                <h:outputText value=" "/>
                                <h:commandLink value="Destroy" action="#{abonnement.destroy}">
                                    <f:param name="jsfcrud.currentLecteur" value="#{jsfcrud_class['jsf.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][lecteur.lecteur][lecteur.converter].jsfcrud_invoke}"/>
                                    <f:param name="jsfcrud.currentAbonnement" value="#{jsfcrud_class['jsf.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][item][abonnement.converter].jsfcrud_invoke}"/>
                                    <f:param name="jsfcrud.relatedController" value="lecteur" />
                                    <f:param name="jsfcrud.relatedControllerType" value="jsf.LecteurController" />
                                </h:commandLink>
                            </h:column>
                        </h:dataTable>
                    </h:panelGroup>
                    <h:outputText value="ReservationCollection:" />
                    <h:panelGroup>
                        <h:outputText rendered="#{empty lecteur.lecteur.reservationCollection}" value="(No Items)"/>
                        <h:dataTable value="#{lecteur.lecteur.reservationCollection}" var="item" 
                                     border="0" cellpadding="2" cellspacing="0" rowClasses="jsfcrud_odd_row,jsfcrud_even_row" rules="all" style="border:solid 1px" 
                                     rendered="#{not empty lecteur.lecteur.reservationCollection}">
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
                                    <f:param name="jsfcrud.currentLecteur" value="#{jsfcrud_class['jsf.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][lecteur.lecteur][lecteur.converter].jsfcrud_invoke}"/>
                                    <f:param name="jsfcrud.currentReservation" value="#{jsfcrud_class['jsf.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][item][reservation.converter].jsfcrud_invoke}"/>
                                    <f:param name="jsfcrud.relatedController" value="lecteur" />
                                    <f:param name="jsfcrud.relatedControllerType" value="jsf.LecteurController" />
                                </h:commandLink>
                                <h:outputText value=" "/>
                                <h:commandLink value="Edit" action="#{reservation.editSetup}">
                                    <f:param name="jsfcrud.currentLecteur" value="#{jsfcrud_class['jsf.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][lecteur.lecteur][lecteur.converter].jsfcrud_invoke}"/>
                                    <f:param name="jsfcrud.currentReservation" value="#{jsfcrud_class['jsf.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][item][reservation.converter].jsfcrud_invoke}"/>
                                    <f:param name="jsfcrud.relatedController" value="lecteur" />
                                    <f:param name="jsfcrud.relatedControllerType" value="jsf.LecteurController" />
                                </h:commandLink>
                                <h:outputText value=" "/>
                                <h:commandLink value="Destroy" action="#{reservation.destroy}">
                                    <f:param name="jsfcrud.currentLecteur" value="#{jsfcrud_class['jsf.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][lecteur.lecteur][lecteur.converter].jsfcrud_invoke}"/>
                                    <f:param name="jsfcrud.currentReservation" value="#{jsfcrud_class['jsf.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][item][reservation.converter].jsfcrud_invoke}"/>
                                    <f:param name="jsfcrud.relatedController" value="lecteur" />
                                    <f:param name="jsfcrud.relatedControllerType" value="jsf.LecteurController" />
                                </h:commandLink>
                            </h:column>
                        </h:dataTable>
                    </h:panelGroup>

                </h:panelGrid>
                <br />
                <h:commandLink action="#{lecteur.remove}" value="Destroy">
                    <f:param name="jsfcrud.currentLecteur" value="#{jsfcrud_class['jsf.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][lecteur.lecteur][lecteur.converter].jsfcrud_invoke}" />
                </h:commandLink>
                <br />
                <br />
                <h:commandLink action="#{lecteur.editSetup}" value="Edit">
                    <f:param name="jsfcrud.currentLecteur" value="#{jsfcrud_class['jsf.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][lecteur.lecteur][lecteur.converter].jsfcrud_invoke}" />
                </h:commandLink>
                <br />
                <h:commandLink action="#{lecteur.createSetup}" value="New Lecteur" />
                <br />
                <h:commandLink action="#{lecteur.listSetup}" value="Show All Lecteur Items"/>
                <br />
                <br />
                <h:commandLink value="Index" action="welcome" immediate="true" />

            </h:form>
        </body>
    </html>
</f:view>
