/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Dao;

import Beans.Participant;
import java.util.List;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.NoResultException;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

/**
 *
 * @author nicolas
 */
@Stateless
public class ParticipantDao {
    private static final String JPQL_SELECT_PAR_ID = "SELECT u FROM Participant u WHERE u.participantId=:participantId";
    private static final String JPQL_SELECT_ALL = "SELECT m FROM Participant m";
    private static final String JPQL_DELETE = "DELETE m FROM Participant m WHERE m.participantId=:participantId";
    private static final String PARAM_ID = "participantId";
    
    // Injection du manager, qui s'occupe de la connexion avec la BDD
    @PersistenceContext( unitName = "persistence" )
    private EntityManager em;
    
     // Enregistrement d'un nouvel utilisateur
    public void creer( Participant participant ) throws DAOException {
        try {
            em.persist( participant );
        } catch ( Exception e ) {
            throw new DAOException( e );
        }
    }
    
    public List<Participant> getAll() throws DAOException {
        List<Participant> participantList = null;
        Query requete = em.createQuery( JPQL_SELECT_ALL );
        try {
            participantList = requete.getResultList();
        } catch ( NoResultException e ) {
            return null;
        } catch ( Exception e ) {
            throw new DAOException( e );
        }
        return participantList;
    }
    
    // Recherche d'un utilisateur à partir de son adresse email
    public Participant trouverParId( int id ) throws DAOException {
        Participant participant = null;
        Query requete = em.createQuery( JPQL_SELECT_PAR_ID );
        requete.setParameter( PARAM_ID, id );
        try {
            participant = (Participant) requete.getSingleResult();
        } catch ( NoResultException e ) {
            return null;
        } catch ( Exception e ) {
            throw new DAOException( e );
        }
        return participant;
    }
    
    public void delete( Participant participant ) throws DAOException {
        try {
            if (!em.contains(participant)) {
                participant = em.merge(participant);
            }

           em.remove(participant);
        } catch ( NoResultException e ) {
            
        } catch ( Exception e ) {
            throw new DAOException( e );
        }
    }
}
