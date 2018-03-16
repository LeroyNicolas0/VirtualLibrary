/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Dao;

import Beans.Participant;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

/**
 *
 * @author nicolas
 */
@Stateless
public class ParticipantDao {
    
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
}
