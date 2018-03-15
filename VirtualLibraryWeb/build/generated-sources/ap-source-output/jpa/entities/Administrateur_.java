package jpa.entities;

import java.util.Date;
import javax.annotation.Generated;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2018-03-15T13:13:59")
@StaticMetamodel(Administrateur.class)
public class Administrateur_ { 

    public static volatile SingularAttribute<Administrateur, Integer> password;
    public static volatile SingularAttribute<Administrateur, String> mail;
    public static volatile SingularAttribute<Administrateur, Date> dateNaissance;
    public static volatile SingularAttribute<Administrateur, Date> dateInscription;
    public static volatile SingularAttribute<Administrateur, Integer> administrateurId;
    public static volatile SingularAttribute<Administrateur, String> login;
    public static volatile SingularAttribute<Administrateur, String> prenom;
    public static volatile SingularAttribute<Administrateur, String> nom;

}