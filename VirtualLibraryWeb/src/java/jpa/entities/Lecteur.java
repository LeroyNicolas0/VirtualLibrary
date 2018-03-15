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
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlTransient;

/**
 *
 * @author Francis
 */
@Entity
@Table(name = "lecteur")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Lecteur.findAll", query = "SELECT l FROM Lecteur l")
    , @NamedQuery(name = "Lecteur.findByLecteurId", query = "SELECT l FROM Lecteur l WHERE l.lecteurId = :lecteurId")
    , @NamedQuery(name = "Lecteur.findByEstBibliothecaire", query = "SELECT l FROM Lecteur l WHERE l.estBibliothecaire = :estBibliothecaire")
    , @NamedQuery(name = "Lecteur.findByPrenom", query = "SELECT l FROM Lecteur l WHERE l.prenom = :prenom")
    , @NamedQuery(name = "Lecteur.findByNom", query = "SELECT l FROM Lecteur l WHERE l.nom = :nom")
    , @NamedQuery(name = "Lecteur.findByDateNaissance", query = "SELECT l FROM Lecteur l WHERE l.dateNaissance = :dateNaissance")
    , @NamedQuery(name = "Lecteur.findByLogin", query = "SELECT l FROM Lecteur l WHERE l.login = :login")
    , @NamedQuery(name = "Lecteur.findByPassword", query = "SELECT l FROM Lecteur l WHERE l.password = :password")
    , @NamedQuery(name = "Lecteur.findByMail", query = "SELECT l FROM Lecteur l WHERE l.mail = :mail")
    , @NamedQuery(name = "Lecteur.findByDateInscription", query = "SELECT l FROM Lecteur l WHERE l.dateInscription = :dateInscription")})
public class Lecteur implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "lecteur_id")
    private Integer lecteurId;
    @Basic(optional = false)
    @NotNull
    @Column(name = "est_bibliothecaire")
    private boolean estBibliothecaire;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 20)
    @Column(name = "prenom")
    private String prenom;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 20)
    @Column(name = "nom")
    private String nom;
    @Basic(optional = false)
    @NotNull
    @Column(name = "date_naissance")
    @Temporal(TemporalType.DATE)
    private Date dateNaissance;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 20)
    @Column(name = "login")
    private String login;
    @Basic(optional = false)
    @NotNull
    @Column(name = "password")
    private int password;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 30)
    @Column(name = "mail")
    private String mail;
    @Basic(optional = false)
    @NotNull
    @Column(name = "date_inscription")
    @Temporal(TemporalType.DATE)
    private Date dateInscription;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "lecteurIdFk")
    private Collection<Emprunt> empruntCollection;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "lecteurIdFk")
    private Collection<Abonnement> abonnementCollection;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "lecteurIdFk")
    private Collection<Reservation> reservationCollection;

    public Lecteur() {
    }

    public Lecteur(Integer lecteurId) {
        this.lecteurId = lecteurId;
    }

    public Lecteur(Integer lecteurId, boolean estBibliothecaire, String prenom, String nom, Date dateNaissance, String login, int password, String mail, Date dateInscription) {
        this.lecteurId = lecteurId;
        this.estBibliothecaire = estBibliothecaire;
        this.prenom = prenom;
        this.nom = nom;
        this.dateNaissance = dateNaissance;
        this.login = login;
        this.password = password;
        this.mail = mail;
        this.dateInscription = dateInscription;
    }

    public Integer getLecteurId() {
        return lecteurId;
    }

    public void setLecteurId(Integer lecteurId) {
        this.lecteurId = lecteurId;
    }

    public boolean getEstBibliothecaire() {
        return estBibliothecaire;
    }

    public void setEstBibliothecaire(boolean estBibliothecaire) {
        this.estBibliothecaire = estBibliothecaire;
    }

    public String getPrenom() {
        return prenom;
    }

    public void setPrenom(String prenom) {
        this.prenom = prenom;
    }

    public String getNom() {
        return nom;
    }

    public void setNom(String nom) {
        this.nom = nom;
    }

    public Date getDateNaissance() {
        return dateNaissance;
    }

    public void setDateNaissance(Date dateNaissance) {
        this.dateNaissance = dateNaissance;
    }

    public String getLogin() {
        return login;
    }

    public void setLogin(String login) {
        this.login = login;
    }

    public int getPassword() {
        return password;
    }

    public void setPassword(int password) {
        this.password = password;
    }

    public String getMail() {
        return mail;
    }

    public void setMail(String mail) {
        this.mail = mail;
    }

    public Date getDateInscription() {
        return dateInscription;
    }

    public void setDateInscription(Date dateInscription) {
        this.dateInscription = dateInscription;
    }

    @XmlTransient
    public Collection<Emprunt> getEmpruntCollection() {
        return empruntCollection;
    }

    public void setEmpruntCollection(Collection<Emprunt> empruntCollection) {
        this.empruntCollection = empruntCollection;
    }

    @XmlTransient
    public Collection<Abonnement> getAbonnementCollection() {
        return abonnementCollection;
    }

    public void setAbonnementCollection(Collection<Abonnement> abonnementCollection) {
        this.abonnementCollection = abonnementCollection;
    }

    @XmlTransient
    public Collection<Reservation> getReservationCollection() {
        return reservationCollection;
    }

    public void setReservationCollection(Collection<Reservation> reservationCollection) {
        this.reservationCollection = reservationCollection;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (lecteurId != null ? lecteurId.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Lecteur)) {
            return false;
        }
        Lecteur other = (Lecteur) object;
        if ((this.lecteurId == null && other.lecteurId != null) || (this.lecteurId != null && !this.lecteurId.equals(other.lecteurId))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "jpa.entities.Lecteur[ lecteurId=" + lecteurId + " ]";
    }
    
}
