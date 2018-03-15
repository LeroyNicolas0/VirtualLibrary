package jpa.entities;

import java.util.Date;
import javax.annotation.Generated;
import javax.persistence.metamodel.CollectionAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;
import jpa.entities.Emprunt;
import jpa.entities.MotCle;
import jpa.entities.Participant;
import jpa.entities.PaysInterdit;
import jpa.entities.Reservation;
import jpa.entities.TypeDocument;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2018-03-15T13:13:59")
@StaticMetamodel(Document.class)
public class Document_ { 

    public static volatile SingularAttribute<Document, Boolean> visibleLecteur;
    public static volatile SingularAttribute<Document, String> titre;
    public static volatile SingularAttribute<Document, String> isbn;
    public static volatile CollectionAttribute<Document, Participant> participantCollection;
    public static volatile SingularAttribute<Document, String> description;
    public static volatile SingularAttribute<Document, Date> dateParution;
    public static volatile SingularAttribute<Document, String> publicVise;
    public static volatile CollectionAttribute<Document, Emprunt> empruntCollection;
    public static volatile SingularAttribute<Document, String> editeur;
    public static volatile SingularAttribute<Document, String> maisonDisque;
    public static volatile SingularAttribute<Document, Integer> nombrePages;
    public static volatile CollectionAttribute<Document, MotCle> motCleCollection;
    public static volatile SingularAttribute<Document, Integer> duree;
    public static volatile SingularAttribute<Document, String> lienCouverture;
    public static volatile SingularAttribute<Document, Boolean> validation;
    public static volatile SingularAttribute<Document, Integer> nombreExemplaire;
    public static volatile SingularAttribute<Document, String> maisonEdition;
    public static volatile SingularAttribute<Document, Integer> numeroMagazine;
    public static volatile SingularAttribute<Document, Integer> nombrePiste;
    public static volatile CollectionAttribute<Document, Reservation> reservationCollection;
    public static volatile CollectionAttribute<Document, PaysInterdit> paysInterditCollection;
    public static volatile SingularAttribute<Document, String> langue;
    public static volatile SingularAttribute<Document, TypeDocument> typeDocumentIdFk;
    public static volatile SingularAttribute<Document, String> societeProduction;
    public static volatile SingularAttribute<Document, String> issn;
    public static volatile SingularAttribute<Document, String> typePeriodique;
    public static volatile SingularAttribute<Document, Integer> documentId;

}