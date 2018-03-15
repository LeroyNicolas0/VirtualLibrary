/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package jpa.entities;

import java.io.Serializable;
import java.util.Collection;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToMany;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
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
@Table(name = "mot_cle")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "MotCle.findAll", query = "SELECT m FROM MotCle m")
    , @NamedQuery(name = "MotCle.findByMotCleId", query = "SELECT m FROM MotCle m WHERE m.motCleId = :motCleId")
    , @NamedQuery(name = "MotCle.findByNom", query = "SELECT m FROM MotCle m WHERE m.nom = :nom")})
public class MotCle implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "mot_cle_id")
    private Integer motCleId;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 20)
    @Column(name = "nom")
    private String nom;
    @ManyToMany(mappedBy = "motCleCollection")
    private Collection<Document> documentCollection;

    public MotCle() {
    }

    public MotCle(Integer motCleId) {
        this.motCleId = motCleId;
    }

    public MotCle(Integer motCleId, String nom) {
        this.motCleId = motCleId;
        this.nom = nom;
    }

    public Integer getMotCleId() {
        return motCleId;
    }

    public void setMotCleId(Integer motCleId) {
        this.motCleId = motCleId;
    }

    public String getNom() {
        return nom;
    }

    public void setNom(String nom) {
        this.nom = nom;
    }

    @XmlTransient
    public Collection<Document> getDocumentCollection() {
        return documentCollection;
    }

    public void setDocumentCollection(Collection<Document> documentCollection) {
        this.documentCollection = documentCollection;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (motCleId != null ? motCleId.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof MotCle)) {
            return false;
        }
        MotCle other = (MotCle) object;
        if ((this.motCleId == null && other.motCleId != null) || (this.motCleId != null && !this.motCleId.equals(other.motCleId))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "jpa.entities.MotCle[ motCleId=" + motCleId + " ]";
    }
    
}
