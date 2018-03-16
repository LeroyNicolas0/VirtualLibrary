package Dao;

import Beans.Forfait;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.NoResultException;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

@Stateless
public class ForfaitDao {
    private static final String JPQL_SELECT_PAR_NOM = "SELECT u FROM Forfait u WHERE u.nom=:nom";
    private static final String PARAM_NOM          = "nom";

    // Injection du manager, qui s'occupe de la connexion avec la BDD
    @PersistenceContext( unitName = "persistence" )
    private EntityManager em;

    // Enregistrement d'un nouvel utilisateur
    public void creer( Forfait forfait ) throws DAOException {
        try {
            em.persist( forfait );
        } catch ( Exception e ) {
            throw new DAOException( e );
        }
    }

    // Recherche d'un forfait à partir de son nom
    public Forfait trouver( String email ) throws DAOException {
        Forfait forfait = null;
        Query requete = em.createQuery( JPQL_SELECT_PAR_NOM );
        requete.setParameter( PARAM_NOM, forfait );
        try {
            forfait = (Forfait) requete.getSingleResult();
        } catch ( NoResultException e ) {
            return null;
        } catch ( Exception e ) {
            throw new DAOException( e );
        }
        return forfait;
    }
}