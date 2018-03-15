package jpa.entities;

import javax.annotation.Generated;
import javax.persistence.metamodel.CollectionAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;
import jpa.entities.Document;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2018-03-15T13:13:59")
@StaticMetamodel(PaysInterdit.class)
public class PaysInterdit_ { 

    public static volatile SingularAttribute<PaysInterdit, Integer> paysId;
    public static volatile CollectionAttribute<PaysInterdit, Document> documentCollection;
    public static volatile SingularAttribute<PaysInterdit, String> nom;

}