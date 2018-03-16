/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Beans;

/**
 *
 * @author atyla
 */
import java.io.Serializable;
import java.util.Date;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.validation.constraints.NotNull;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author Francis
 */
@Entity
@Table(name = "emprunt")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Emprunt.findAll", query = "SELECT e FROM Emprunt e")
    , @NamedQuery(name = "Emprunt.findByEmpruntId", query = "SELECT e FROM Emprunt e WHERE e.empruntId = :empruntId")
    , @NamedQuery(name = "Emprunt.findByDateEmprunt", query = "SELECT e FROM Emprunt e WHERE e.dateEmprunt = :dateEmprunt")
    , @NamedQuery(name = "Emprunt.findByDateRetour", query = "SELECT e FROM Emprunt e WHERE e.dateRetour = :dateRetour")})
public class Emprunt implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "emprunt_id")
    private Integer empruntId;
    @Basic(optional = false)
    @NotNull
    @Column(name = "date_emprunt")
    @Temporal(TemporalType.DATE)
    private Date dateEmprunt;
    @Basic(optional = false)
    @NotNull
    @Column(name = "date_retour")
    @Temporal(TemporalType.DATE)
    private Date dateRetour;
    @JoinColumn(name = "document_id_fk", referencedColumnName = "document_id")
    @ManyToOne(optional = false)
    private Document documentIdFk;
    @JoinColumn(name = "lecteur_id_fk", referencedColumnName = "lecteur_id")
    @ManyToOne(optional = false)
    private Utilisateur lecteurIdFk;

    public Emprunt() {
    }

    public Emprunt(Integer empruntId) {
        this.empruntId = empruntId;
    }

    public Emprunt(Integer empruntId, Date dateEmprunt, Date dateRetour) {
        this.empruntId = empruntId;
        this.dateEmprunt = dateEmprunt;
        this.dateRetour = dateRetour;
    }

    public Integer getEmpruntId() {
        return empruntId;
    }

    public void setEmpruntId(Integer empruntId) {
        this.empruntId = empruntId;
    }

    public Date getDateEmprunt() {
        return dateEmprunt;
    }

    public void setDateEmprunt(Date dateEmprunt) {
        this.dateEmprunt = dateEmprunt;
    }

    public Date getDateRetour() {
        return dateRetour;
    }

    public void setDateRetour(Date dateRetour) {
        this.dateRetour = dateRetour;
    }

    public Document getDocumentIdFk() {
        return documentIdFk;
    }

    public void setDocumentIdFk(Document documentIdFk) {
        this.documentIdFk = documentIdFk;
    }

    public Utilisateur getLecteurIdFk() {
        return lecteurIdFk;
    }

    public void setLecteurIdFk(Lecteur lecteurIdFk) {
        this.lecteurIdFk = lecteurIdFk;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (empruntId != null ? empruntId.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Emprunt)) {
            return false;
        }
        Emprunt other = (Emprunt) object;
        if ((this.empruntId == null && other.empruntId != null) || (this.empruntId != null && !this.empruntId.equals(other.empruntId))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "jpa.entities.Emprunt[ empruntId=" + empruntId + " ]";
    }
    
}

