/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package jpa.entities;

import java.io.Serializable;
import java.util.Date;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author Francis
 */
@Entity
@Table(name = "administrateur")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Administrateur.findAll", query = "SELECT a FROM Administrateur a")
    , @NamedQuery(name = "Administrateur.findByAdministrateurId", query = "SELECT a FROM Administrateur a WHERE a.administrateurId = :administrateurId")
    , @NamedQuery(name = "Administrateur.findByPrenom", query = "SELECT a FROM Administrateur a WHERE a.prenom = :prenom")
    , @NamedQuery(name = "Administrateur.findByNom", query = "SELECT a FROM Administrateur a WHERE a.nom = :nom")
    , @NamedQuery(name = "Administrateur.findByDateNaissance", query = "SELECT a FROM Administrateur a WHERE a.dateNaissance = :dateNaissance")
    , @NamedQuery(name = "Administrateur.findByLogin", query = "SELECT a FROM Administrateur a WHERE a.login = :login")
    , @NamedQuery(name = "Administrateur.findByPassword", query = "SELECT a FROM Administrateur a WHERE a.password = :password")
    , @NamedQuery(name = "Administrateur.findByMail", query = "SELECT a FROM Administrateur a WHERE a.mail = :mail")
    , @NamedQuery(name = "Administrateur.findByDateInscription", query = "SELECT a FROM Administrateur a WHERE a.dateInscription = :dateInscription")})
public class Administrateur implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "administrateur_id")
    private Integer administrateurId;
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
    @Size(min = 1, max = 30)
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

    public Administrateur() {
    }

    public Administrateur(Integer administrateurId) {
        this.administrateurId = administrateurId;
    }

    public Administrateur(Integer administrateurId, String prenom, String nom, Date dateNaissance, String login, int password, String mail, Date dateInscription) {
        this.administrateurId = administrateurId;
        this.prenom = prenom;
        this.nom = nom;
        this.dateNaissance = dateNaissance;
        this.login = login;
        this.password = password;
        this.mail = mail;
        this.dateInscription = dateInscription;
    }

    public Integer getAdministrateurId() {
        return administrateurId;
    }

    public void setAdministrateurId(Integer administrateurId) {
        this.administrateurId = administrateurId;
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

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (administrateurId != null ? administrateurId.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Administrateur)) {
            return false;
        }
        Administrateur other = (Administrateur) object;
        if ((this.administrateurId == null && other.administrateurId != null) || (this.administrateurId != null && !this.administrateurId.equals(other.administrateurId))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "jpa.entities.Administrateur[ administrateurId=" + administrateurId + " ]";
    }
    
}
