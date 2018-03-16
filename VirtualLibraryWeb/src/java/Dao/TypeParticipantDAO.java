/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Dao;

import Beans.TypeParticipant;
import Beans.Utilisateur;
import java.util.ArrayList;
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
public class TypeParticipantDAO {
        private static final String JPQL_SELECT_PAR_NOM = "SELECT u FROM TypeParticipant u WHERE u.nom=:nom";
        private static final String JPQL_SELECT_FINDALL = "SELECT u FROM TypeParticipant u ";
        private static final String PARAM_NOM           = "nom";
        
          // Injection du manager, qui s'occupe de la connexion avec la BDD
    @PersistenceContext( unitName = "persistence" )
    private EntityManager em;
    
    public List<String> FindAllString() throws DAOException {
        List<String> liste = new ArrayList<String>();
        TypeParticipant typeParticipant = null;
        Query requete = em.createQuery( JPQL_SELECT_FINDALL );
        List resultList =null;
        try {
            resultList = requete.getResultList();
        } catch ( NoResultException e ) {
            return null;
        } catch ( Exception e ) {
            throw new DAOException( e );
        }
        for(Object e: resultList ){
            typeParticipant = (TypeParticipant) e;
            liste.add(typeParticipant.getNom());
        }
        
        return liste;
    }
    
    public TypeParticipant trouver( String parti ) throws DAOException {
        TypeParticipant typeParticipant = null;
        Query requete = em.createQuery( JPQL_SELECT_PAR_NOM );
        requete.setParameter( PARAM_NOM, parti );
        try {
            typeParticipant = (TypeParticipant) requete.getSingleResult();
        } catch ( NoResultException e ) {
            return null;
        } catch ( Exception e ) {
            throw new DAOException( e );
        }
        return typeParticipant;
    }
    
}
