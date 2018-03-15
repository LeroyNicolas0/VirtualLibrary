/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package jpa.entities;

import java.io.Serializable;
import java.util.Collection;
import java.util.Date;
import javax.persistence.Basic;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.validation.constraints.NotNull;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlTransient;

/**
 *
 * @author Francis
 */
@Entity
@Table(name = "abonnement")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Abonnement.findAll", query = "SELECT a FROM Abonnement a")
    , @NamedQuery(name = "Abonnement.findByAbonnementId", query = "SELECT a FROM Abonnement a WHERE a.abonnementId = :abonnementId")
    , @NamedQuery(name = "Abonnement.findByDateDebut", query = "SELECT a FROM Abonnement a WHERE a.dateDebut = :dateDebut")
    , @NamedQuery(name = "Abonnement.findByDateFin", query = "SELECT a FROM Abonnement a WHERE a.dateFin = :dateFin")})
public class Abonnement implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "abonnement_id")
    private Integer abonnementId;
    @Basic(optional = false)
    @NotNull
    @Column(name = "date_debut")
    @Temporal(TemporalType.DATE)
    private Date dateDebut;
    @Basic(optional = false)
    @NotNull
    @Column(name = "date_fin")
    @Temporal(TemporalType.DATE)
    private Date dateFin;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "forfaitIdFk")
    private Collection<Abonnement> abonnementCollection;
    @JoinColumn(name = "forfait_id_fk", referencedColumnName = "abonnement_id")
    @ManyToOne(optional = false)
    private Abonnement forfaitIdFk;
    @JoinColumn(name = "lecteur_id_fk", referencedColumnName = "lecteur_id")
    @ManyToOne(optional = false)
    private Lecteur lecteurIdFk;

    public Abonnement() {
    }

    public Abonnement(Integer abonnementId) {
        this.abonnementId = abonnementId;
    }

    public Abonnement(Integer abonnementId, Date dateDebut, Date dateFin) {
        this.abonnementId = abonnementId;
        this.dateDebut = dateDebut;
        this.dateFin = dateFin;
    }

    public Integer getAbonnementId() {
        return abonnementId;
    }

    public void setAbonnementId(Integer abonnementId) {
        this.abonnementId = abonnementId;
    }

    public Date getDateDebut() {
        return dateDebut;
    }

    public void setDateDebut(Date dateDebut) {
        this.dateDebut = dateDebut;
    }

    public Date getDateFin() {
        return dateFin;
    }

    public void setDateFin(Date dateFin) {
        this.dateFin = dateFin;
    }

    @XmlTransient
    public Collection<Abonnement> getAbonnementCollection() {
        return abonnementCollection;
    }

    public void setAbonnementCollection(Collection<Abonnement> abonnementCollection) {
        this.abonnementCollection = abonnementCollection;
    }

    public Abonnement getForfaitIdFk() {
        return forfaitIdFk;
    }

    public void setForfaitIdFk(Abonnement forfaitIdFk) {
        this.forfaitIdFk = forfaitIdFk;
    }

    public Lecteur getLecteurIdFk() {
        return lecteurIdFk;
    }

    public void setLecteurIdFk(Lecteur lecteurIdFk) {
        this.lecteurIdFk = lecteurIdFk;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (abonnementId != null ? abonnementId.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Abonnement)) {
            return false;
        }
        Abonnement other = (Abonnement) object;
        if ((this.abonnementId == null && other.abonnementId != null) || (this.abonnementId != null && !this.abonnementId.equals(other.abonnementId))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "jpa.entities.Abonnement[ abonnementId=" + abonnementId + " ]";
    }
    
}
