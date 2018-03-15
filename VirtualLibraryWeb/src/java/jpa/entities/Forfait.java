/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package jpa.entities;

import java.io.Serializable;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author Francis
 */
@Entity
@Table(name = "forfait")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Forfait.findAll", query = "SELECT f FROM Forfait f")
    , @NamedQuery(name = "Forfait.findByForfaitId", query = "SELECT f FROM Forfait f WHERE f.forfaitId = :forfaitId")
    , @NamedQuery(name = "Forfait.findByNom", query = "SELECT f FROM Forfait f WHERE f.nom = :nom")
    , @NamedQuery(name = "Forfait.findByTarif", query = "SELECT f FROM Forfait f WHERE f.tarif = :tarif")
    , @NamedQuery(name = "Forfait.findByDuree", query = "SELECT f FROM Forfait f WHERE f.duree = :duree")})
public class Forfait implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "forfait_id")
    private Integer forfaitId;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 20)
    @Column(name = "nom")
    private String nom;
    @Basic(optional = false)
    @NotNull
    @Column(name = "tarif")
    private float tarif;
    @Basic(optional = false)
    @NotNull
    @Column(name = "duree")
    private int duree;

    public Forfait() {
    }

    public Forfait(Integer forfaitId) {
        this.forfaitId = forfaitId;
    }

    public Forfait(Integer forfaitId, String nom, float tarif, int duree) {
        this.forfaitId = forfaitId;
        this.nom = nom;
        this.tarif = tarif;
        this.duree = duree;
    }

    public Integer getForfaitId() {
        return forfaitId;
    }

    public void setForfaitId(Integer forfaitId) {
        this.forfaitId = forfaitId;
    }

    public String getNom() {
        return nom;
    }

    public void setNom(String nom) {
        this.nom = nom;
    }

    public float getTarif() {
        return tarif;
    }

    public void setTarif(float tarif) {
        this.tarif = tarif;
    }

    public int getDuree() {
        return duree;
    }

    public void setDuree(int duree) {
        this.duree = duree;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (forfaitId != null ? forfaitId.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Forfait)) {
            return false;
        }
        Forfait other = (Forfait) object;
        if ((this.forfaitId == null && other.forfaitId != null) || (this.forfaitId != null && !this.forfaitId.equals(other.forfaitId))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "jpa.entities.Forfait[ forfaitId=" + forfaitId + " ]";
    }
    
}
