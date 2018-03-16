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
    
    private static final String JPQL_SELECT_PAR_NOM = "SELECT u FROM MotCle u WHERE u.nom=:nom";
    private static final String JPQL_SELECT_ALL = "SELECT m FROM MotCle m";
    private static final String PARAM_NOM = "nom";

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
    public MotCle trouver( String nom ) throws DAOException {
        MotCle motCle = null;
        Query requete = em.createQuery( JPQL_SELECT_PAR_NOM );
        requete.setParameter( PARAM_NOM, nom );
        try {
            motCle = (MotCle) requete.getSingleResult();
        } catch ( NoResultException e ) {
            return null;
        } catch ( Exception e ) {
            throw new DAOException( e );
        }
        return motCle;
    }
}
