package jpa.entities;

import java.util.Date;
import javax.annotation.Generated;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;
import jpa.entities.Document;
import jpa.entities.Lecteur;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2018-03-15T13:13:59")
@StaticMetamodel(Emprunt.class)
public class Emprunt_ { 

    public static volatile SingularAttribute<Emprunt, Document> documentIdFk;
    public static volatile SingularAttribute<Emprunt, Lecteur> lecteurIdFk;
    public static volatile SingularAttribute<Emprunt, Date> dateEmprunt;
    public static volatile SingularAttribute<Emprunt, Date> dateRetour;
    public static volatile SingularAttribute<Emprunt, Integer> empruntId;

}