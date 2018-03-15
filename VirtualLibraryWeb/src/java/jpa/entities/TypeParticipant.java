/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package jpa.entities;

import java.io.Serializable;
import java.util.Collection;
import javax.persistence.Basic;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlTransient;

/**
 *
 * @author Francis
 */
@Entity
@Table(name = "type_participant")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "TypeParticipant.findAll", query = "SELECT t FROM TypeParticipant t")
    , @NamedQuery(name = "TypeParticipant.findByTypeParticipantId", query = "SELECT t FROM TypeParticipant t WHERE t.typeParticipantId = :typeParticipantId")
    , @NamedQuery(name = "TypeParticipant.findByNom", query = "SELECT t FROM TypeParticipant t WHERE t.nom = :nom")})
public class TypeParticipant implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "type_participant_id")
    private Integer typeParticipantId;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 30)
    @Column(name = "nom")
    private String nom;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "typeParticpantIdFk")
    private Collection<Participant> participantCollection;

    public TypeParticipant() {
    }

    public TypeParticipant(Integer typeParticipantId) {
        this.typeParticipantId = typeParticipantId;
    }

    public TypeParticipant(Integer typeParticipantId, String nom) {
        this.typeParticipantId = typeParticipantId;
        this.nom = nom;
    }

    public Integer getTypeParticipantId() {
        return typeParticipantId;
    }

    public void setTypeParticipantId(Integer typeParticipantId) {
        this.typeParticipantId = typeParticipantId;
    }

    public String getNom() {
        return nom;
    }

    public void setNom(String nom) {
        this.nom = nom;
    }

    @XmlTransient
    public Collection<Participant> getParticipantCollection() {
        return participantCollection;
    }

    public void setParticipantCollection(Collection<Participant> participantCollection) {
        this.participantCollection = participantCollection;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (typeParticipantId != null ? typeParticipantId.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof TypeParticipant)) {
            return false;
        }
        TypeParticipant other = (TypeParticipant) object;
        if ((this.typeParticipantId == null && other.typeParticipantId != null) || (this.typeParticipantId != null && !this.typeParticipantId.equals(other.typeParticipantId))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "jpa.entities.TypeParticipant[ typeParticipantId=" + typeParticipantId + " ]";
    }
    
}
