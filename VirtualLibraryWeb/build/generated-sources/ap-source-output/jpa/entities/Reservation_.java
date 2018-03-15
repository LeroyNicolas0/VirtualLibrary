package jpa.entities;

import java.util.Date;
import javax.annotation.Generated;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;
import jpa.entities.Document;
import jpa.entities.Lecteur;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2018-03-15T13:13:59")
@StaticMetamodel(Reservation.class)
public class Reservation_ { 

    public static volatile SingularAttribute<Reservation, Document> documentIdFk;
    public static volatile SingularAttribute<Reservation, Lecteur> lecteurIdFk;
    public static volatile SingularAttribute<Reservation, Integer> reservationId;
    public static volatile SingularAttribute<Reservation, Date> dateReservation;

}