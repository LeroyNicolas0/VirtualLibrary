package Dao;

import Beans.Lecteur;
import Beans.Utilisateur;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.NoResultException;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

@Stateless
public class UtilisateurDao {
    private static final String JPQL_SELECT_PAR_EMAIL = "SELECT u FROM Lecteur u WHERE u.mail=:mail";
    private static final String PARAM_EMAIL           = "mail";

    // Injection du manager, qui s'occupe de la connexion avec la BDD
    @PersistenceContext( unitName = "persistence" )
    private EntityManager em;

    // Enregistrement d'un nouvel utilisateur
    public void creer( Utilisateur utilisateur ) throws DAOException {
        try {
            em.persist( utilisateur );
        } catch ( Exception e ) {
            throw new DAOException( e );
        }
    }

    // Recherche d'un utilisateur à partir de son adresse email
    public Lecteur trouver( String email ) throws DAOException {
        Lecteur utilisateur = null;
        Query requete = em.createQuery( JPQL_SELECT_PAR_EMAIL );
        requete.setParameter( PARAM_EMAIL, email );
        try {
            utilisateur = (Lecteur) requete.getSingleResult();
        } catch ( NoResultException e ) {
            return null;
        } catch ( Exception e ) {
            throw new DAOException( e );
        }
        return utilisateur;
    }
}