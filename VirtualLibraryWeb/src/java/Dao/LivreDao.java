/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Dao;

import Beans.Document;
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
public class LivreDao {
    private static final String JPQL_SELECT_PAR_ID = "SELECT l FROM Livre l WHERE l.documentId=:documentId";
    private static final String JPQL_SELECT_ALL = "SELECT l FROM Livre l";
    private static final String PARAM_TITRE = "titre";
    private static final String PARAM_ID = "documentId";

    // Injection du manager, qui s'occupe de la connexion avec la BDD
    @PersistenceContext( unitName = "persistence" )
    private EntityManager em;

    // Enregistrement d'un nouvel utilisateur
    public void creer( Document livre ) throws DAOException {
        try {
            em.persist( livre );
        } catch ( Exception e ) {
            throw new DAOException( e );
        }
    }
    
    public List<Document> getAll() throws DAOException {
        List<Document> livreList = null;
        Query requete = em.createQuery( JPQL_SELECT_ALL );
        try {
            livreList = requete.getResultList();
        } catch ( NoResultException e ) {
            return null;
        } catch ( Exception e ) {
            throw new DAOException( e );
        }
        return livreList;
    }
    
    // Recherche d'un utilisateur à partir de son adresse email
    public Document trouverParId( int id ) throws DAOException {
        Document livre = null;
        Query requete = em.createQuery( JPQL_SELECT_PAR_ID );
        requete.setParameter( PARAM_ID, id );
        try {
            livre = (Document) requete.getSingleResult();
        } catch ( NoResultException e ) {
            return null;
        } catch ( Exception e ) {
            throw new DAOException( e );
        }
        return livre;
    }
    
    public void delete( Document livre ) throws DAOException {
        try {
            if (!em.contains(livre)) {
                livre = em.merge(livre);
            }
           em.remove(livre);
        } catch ( NoResultException e ) {
            
        } catch ( Exception e ) {
            throw new DAOException( e );
        }
    }
    
    public void update( Document livre ) throws DAOException {
        em.merge(livre);
    }
}
