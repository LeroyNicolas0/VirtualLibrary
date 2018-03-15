package jpa.entities;

import java.util.Date;
import javax.annotation.Generated;
import javax.persistence.metamodel.CollectionAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;
import jpa.entities.Document;
import jpa.entities.TypeParticipant;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2018-03-15T13:13:59")
@StaticMetamodel(Participant.class)
public class Participant_ { 

    public static volatile SingularAttribute<Participant, Integer> participantId;
    public static volatile SingularAttribute<Participant, String> pseudonyme;
    public static volatile SingularAttribute<Participant, Date> dateNaissance;
    public static volatile SingularAttribute<Participant, TypeParticipant> typeParticpantIdFk;
    public static volatile CollectionAttribute<Participant, Document> documentCollection;
    public static volatile SingularAttribute<Participant, String> prenom;
    public static volatile SingularAttribute<Participant, String> nom;

}