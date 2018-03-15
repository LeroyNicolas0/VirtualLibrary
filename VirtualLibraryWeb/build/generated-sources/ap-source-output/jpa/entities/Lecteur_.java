package jpa.entities;

import java.util.Date;
import javax.annotation.Generated;
import javax.persistence.metamodel.CollectionAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;
import jpa.entities.Abonnement;
import jpa.entities.Emprunt;
import jpa.entities.Reservation;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2018-03-15T13:13:59")
@StaticMetamodel(Lecteur.class)
public class Lecteur_ { 

    public static volatile SingularAttribute<Lecteur, Integer> password;
    public static volatile SingularAttribute<Lecteur, String> mail;
    public static volatile SingularAttribute<Lecteur, Integer> lecteurId;
    public static volatile SingularAttribute<Lecteur, Date> dateNaissance;
    public static volatile SingularAttribute<Lecteur, Date> dateInscription;
    public static volatile CollectionAttribute<Lecteur, Abonnement> abonnementCollection;
    public static volatile CollectionAttribute<Lecteur, Reservation> reservationCollection;
    public static volatile SingularAttribute<Lecteur, String> login;
    public static volatile SingularAttribute<Lecteur, String> nom;
    public static volatile SingularAttribute<Lecteur, String> prenom;
    public static volatile CollectionAttribute<Lecteur, Emprunt> empruntCollection;
    public static volatile SingularAttribute<Lecteur, Boolean> estBibliothecaire;

}