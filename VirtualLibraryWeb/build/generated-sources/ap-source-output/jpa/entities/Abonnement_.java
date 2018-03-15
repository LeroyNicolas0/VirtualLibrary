package jpa.entities;

import java.util.Date;
import javax.annotation.Generated;
import javax.persistence.metamodel.CollectionAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;
import jpa.entities.Abonnement;
import jpa.entities.Lecteur;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2018-03-15T13:13:59")
@StaticMetamodel(Abonnement.class)
public class Abonnement_ { 

    public static volatile SingularAttribute<Abonnement, Lecteur> lecteurIdFk;
    public static volatile SingularAttribute<Abonnement, Integer> abonnementId;
    public static volatile SingularAttribute<Abonnement, Date> dateDebut;
    public static volatile CollectionAttribute<Abonnement, Abonnement> abonnementCollection;
    public static volatile SingularAttribute<Abonnement, Abonnement> forfaitIdFk;
    public static volatile SingularAttribute<Abonnement, Date> dateFin;

}