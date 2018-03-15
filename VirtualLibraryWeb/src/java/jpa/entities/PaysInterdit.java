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
@Table(name = "pays_interdit")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "PaysInterdit.findAll", query = "SELECT p FROM PaysInterdit p")
    , @NamedQuery(name = "PaysInterdit.findByPaysId", query = "SELECT p FROM PaysInterdit p WHERE p.paysId = :paysId")
    , @NamedQuery(name = "PaysInterdit.findByNom", query = "SELECT p FROM PaysInterdit p WHERE p.nom = :nom")})
public class PaysInterdit implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "pays_id")
    private Integer paysId;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 30)
    @Column(name = "nom")
    private String nom;
    @ManyToMany(mappedBy = "paysInterditCollection")
    private Collection<Document> documentCollection;

    public PaysInterdit() {
    }

    public PaysInterdit(Integer paysId) {
        this.paysId = paysId;
    }

    public PaysInterdit(Integer paysId, String nom) {
        this.paysId = paysId;
        this.nom = nom;
    }

    public Integer getPaysId() {
        return paysId;
    }

    public void setPaysId(Integer paysId) {
        this.paysId = paysId;
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
        hash += (paysId != null ? paysId.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof PaysInterdit)) {
            return false;
        }
        PaysInterdit other = (PaysInterdit) object;
        if ((this.paysId == null && other.paysId != null) || (this.paysId != null && !this.paysId.equals(other.paysId))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "jpa.entities.PaysInterdit[ paysId=" + paysId + " ]";
    }
    
}
