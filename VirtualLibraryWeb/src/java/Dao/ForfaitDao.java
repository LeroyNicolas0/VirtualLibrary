package Dao;

import Beans.Forfait;
import java.util.List;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.NoResultException;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

@Stateless
public class ForfaitDao {
    private static final String JPQL_SELECT_PAR_ID = "SELECT u FROM Forfait u WHERE u.forfaitID=:forfaitID";
    private static final String JPQL_SELECT_ALL = "SELECT m FROM Forfait m";
    private static final String JPQL_DELETE = "DELETE m FROM Forfait m WHERE m.forfaitID=:forfaitID";
    private static final String PARAM_NOM = "nom";
    private static final String PARAM_ID = "forfaitID";

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
    
    public List<Forfait> getAll() throws DAOException {
        List<Forfait> forfaitList = null;
        Query requete = em.createQuery( JPQL_SELECT_ALL );
        try {
            forfaitList = requete.getResultList();
        } catch ( NoResultException e ) {
            return null;
        } catch ( Exception e ) {
            throw new DAOException( e );
        }
        return forfaitList;
    }

    // Recherche d'un forfait à partir de son nom
    public Forfait trouverParId( int id ) throws DAOException {
        Forfait forfait = null;
        Query requete = em.createQuery( JPQL_SELECT_PAR_ID );
        requete.setParameter( PARAM_ID, id );
        try {
            forfait = (Forfait) requete.getSingleResult();
        } catch ( NoResultException e ) {
            return null;
        } catch ( Exception e ) {
            throw new DAOException( e );
        }
        return forfait;
    }
    
     public void delete( Forfait forfait ) throws DAOException {
        try {
            if (!em.contains(forfait)) {
                forfait = em.merge(forfait);
            }

           em.remove(forfait);
        } catch ( NoResultException e ) {
            
        } catch ( Exception e ) {
            throw new DAOException( e );
        }
    }
     public void update( Forfait forfait ) throws DAOException {
        em.merge(forfait);
    }
}