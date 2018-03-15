package jpa.entities;

import javax.annotation.Generated;
import javax.persistence.metamodel.CollectionAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;
import jpa.entities.Participant;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2018-03-15T13:13:59")
@StaticMetamodel(TypeParticipant.class)
public class TypeParticipant_ { 

    public static volatile SingularAttribute<TypeParticipant, Integer> typeParticipantId;
    public static volatile CollectionAttribute<TypeParticipant, Participant> participantCollection;
    public static volatile SingularAttribute<TypeParticipant, String> nom;

}