/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Dao;

import Beans.MotCle;
import java.util.List;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.NoResultException;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

/**
 *
 * @author atyla
 */
@Stateless
public class MotCleDao {
    
    private static final String JPQL_SELECT_PAR_ID = "SELECT u FROM MotCle u WHERE u.motCleID=:motCleID";
    private static final String JPQL_SELECT_ALL = "SELECT m FROM MotCle m";
    private static final String JPQL_DELETE = "DELETE m FROM MotCle m WHERE m.motCleID=:motCleID";
    private static final String PARAM_NOM = "nom";
    private static final String PARAM_ID = "motCleID";

    // Injection du manager, qui s'occupe de la connexion avec la BDD
    @PersistenceContext( unitName = "persistence" )
    private EntityManager em;

    // Enregistrement d'un nouvel utilisateur
    public void creer( MotCle motCle ) throws DAOException {
        try {
            em.persist( motCle );
        } catch ( Exception e ) {
            throw new DAOException( e );
        }
    }
    
    public List<MotCle> getAll() throws DAOException {
        List<MotCle> motCleList = null;
        Query requete = em.createQuery( JPQL_SELECT_ALL );
        try {
            motCleList = requete.getResultList();
        } catch ( NoResultException e ) {
            return null;
        } catch ( Exception e ) {
            throw new DAOException( e );
        }
        return motCleList;
    }
    
    // Recherche d'un utilisateur à partir de son adresse email
    public MotCle trouverParId( int id ) throws DAOException {
        MotCle motCle = null;
        Query requete = em.createQuery( JPQL_SELECT_PAR_ID );
        requete.setParameter( PARAM_ID, id );
        try {
            motCle = (MotCle) requete.getSingleResult();
        } catch ( NoResultException e ) {
            return null;
        } catch ( Exception e ) {
            throw new DAOException( e );
        }
        return motCle;
    }
    
    public void delete( MotCle motCle ) throws DAOException {
        try {
            if (!em.contains(motCle)) {
                motCle = em.merge(motCle);
            }

           em.remove(motCle);
        } catch ( NoResultException e ) {
            
        } catch ( Exception e ) {
            throw new DAOException( e );
        }
    }
}
