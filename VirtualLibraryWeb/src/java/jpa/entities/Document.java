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
import javax.persistence.JoinTable;
import javax.persistence.Lob;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
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
@Table(name = "document")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Document.findAll", query = "SELECT d FROM Document d")
    , @NamedQuery(name = "Document.findByDocumentId", query = "SELECT d FROM Document d WHERE d.documentId = :documentId")
    , @NamedQuery(name = "Document.findByTitre", query = "SELECT d FROM Document d WHERE d.titre = :titre")
    , @NamedQuery(name = "Document.findByDateParution", query = "SELECT d FROM Document d WHERE d.dateParution = :dateParution")
    , @NamedQuery(name = "Document.findByNombrePages", query = "SELECT d FROM Document d WHERE d.nombrePages = :nombrePages")
    , @NamedQuery(name = "Document.findByIsbn", query = "SELECT d FROM Document d WHERE d.isbn = :isbn")
    , @NamedQuery(name = "Document.findByLangue", query = "SELECT d FROM Document d WHERE d.langue = :langue")
    , @NamedQuery(name = "Document.findByEditeur", query = "SELECT d FROM Document d WHERE d.editeur = :editeur")
    , @NamedQuery(name = "Document.findByValidation", query = "SELECT d FROM Document d WHERE d.validation = :validation")
    , @NamedQuery(name = "Document.findByMaisonDisque", query = "SELECT d FROM Document d WHERE d.maisonDisque = :maisonDisque")
    , @NamedQuery(name = "Document.findByNombrePiste", query = "SELECT d FROM Document d WHERE d.nombrePiste = :nombrePiste")
    , @NamedQuery(name = "Document.findBySocieteProduction", query = "SELECT d FROM Document d WHERE d.societeProduction = :societeProduction")
    , @NamedQuery(name = "Document.findByMaisonEdition", query = "SELECT d FROM Document d WHERE d.maisonEdition = :maisonEdition")
    , @NamedQuery(name = "Document.findByDuree", query = "SELECT d FROM Document d WHERE d.duree = :duree")
    , @NamedQuery(name = "Document.findByPublicVise", query = "SELECT d FROM Document d WHERE d.publicVise = :publicVise")
    , @NamedQuery(name = "Document.findByTypePeriodique", query = "SELECT d FROM Document d WHERE d.typePeriodique = :typePeriodique")
    , @NamedQuery(name = "Document.findByIssn", query = "SELECT d FROM Document d WHERE d.issn = :issn")
    , @NamedQuery(name = "Document.findByNumeroMagazine", query = "SELECT d FROM Document d WHERE d.numeroMagazine = :numeroMagazine")
    , @NamedQuery(name = "Document.findByVisibleLecteur", query = "SELECT d FROM Document d WHERE d.visibleLecteur = :visibleLecteur")
    , @NamedQuery(name = "Document.findByNombreExemplaire", query = "SELECT d FROM Document d WHERE d.nombreExemplaire = :nombreExemplaire")})
public class Document implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "document_id")
    private Integer documentId;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 50)
    @Column(name = "titre")
    private String titre;
    @Basic(optional = false)
    @NotNull
    @Column(name = "date_parution")
    @Temporal(TemporalType.DATE)
    private Date dateParution;
    @Basic(optional = false)
    @NotNull
    @Lob
    @Size(min = 1, max = 65535)
    @Column(name = "description")
    private String description;
    @Column(name = "nombre_pages")
    private Integer nombrePages;
    @Size(max = 13)
    @Column(name = "isbn")
    private String isbn;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 20)
    @Column(name = "langue")
    private String langue;
    @Size(max = 20)
    @Column(name = "editeur")
    private String editeur;
    @Column(name = "validation")
    private Boolean validation;
    @Size(max = 30)
    @Column(name = "maison_disque")
    private String maisonDisque;
    @Column(name = "nombre_piste")
    private Integer nombrePiste;
    @Size(max = 30)
    @Column(name = "societe_production")
    private String societeProduction;
    @Size(max = 30)
    @Column(name = "maison_edition")
    private String maisonEdition;
    @Column(name = "duree")
    private Integer duree;
    @Size(max = 20)
    @Column(name = "public_vise")
    private String publicVise;
    @Size(max = 20)
    @Column(name = "type_periodique")
    private String typePeriodique;
    @Size(max = 13)
    @Column(name = "issn")
    private String issn;
    @Column(name = "numero_magazine")
    private Integer numeroMagazine;
    @Basic(optional = false)
    @NotNull
    @Column(name = "visible_lecteur")
    private boolean visibleLecteur;
    @Lob
    @Size(max = 65535)
    @Column(name = "lien_couverture")
    private String lienCouverture;
    @Basic(optional = false)
    @NotNull
    @Column(name = "nombre_exemplaire")
    private int nombreExemplaire;
    @JoinTable(name = "lien_document_pays", joinColumns = {
        @JoinColumn(name = "document_id_fk", referencedColumnName = "document_id")}, inverseJoinColumns = {
        @JoinColumn(name = "pays_id_fk", referencedColumnName = "pays_id")})
    @ManyToMany
    private Collection<PaysInterdit> paysInterditCollection;
    @JoinTable(name = "lien_document_mot_cle", joinColumns = {
        @JoinColumn(name = "document_id_fk", referencedColumnName = "document_id")}, inverseJoinColumns = {
        @JoinColumn(name = "mot_cle_id_fk", referencedColumnName = "mot_cle_id")})
    @ManyToMany
    private Collection<MotCle> motCleCollection;
    @JoinTable(name = "lien_document_participant", joinColumns = {
        @JoinColumn(name = "document_id_fk", referencedColumnName = "document_id")}, inverseJoinColumns = {
        @JoinColumn(name = "participant_id_fk", referencedColumnName = "participant_id")})
    @ManyToMany
    private Collection<Participant> participantCollection;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "documentIdFk")
    private Collection<Emprunt> empruntCollection;
    @JoinColumn(name = "type_document_id_fk", referencedColumnName = "type_document_id")
    @ManyToOne(optional = false)
    private TypeDocument typeDocumentIdFk;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "documentIdFk")
    private Collection<Reservation> reservationCollection;

    public Document() {
    }

    public Document(Integer documentId) {
        this.documentId = documentId;
    }

    public Document(Integer documentId, String titre, Date dateParution, String description, String langue, boolean visibleLecteur, int nombreExemplaire) {
        this.documentId = documentId;
        this.titre = titre;
        this.dateParution = dateParution;
        this.description = description;
        this.langue = langue;
        this.visibleLecteur = visibleLecteur;
        this.nombreExemplaire = nombreExemplaire;
    }

    public Integer getDocumentId() {
        return documentId;
    }

    public void setDocumentId(Integer documentId) {
        this.documentId = documentId;
    }

    public String getTitre() {
        return titre;
    }

    public void setTitre(String titre) {
        this.titre = titre;
    }

    public Date getDateParution() {
        return dateParution;
    }

    public void setDateParution(Date dateParution) {
        this.dateParution = dateParution;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public Integer getNombrePages() {
        return nombrePages;
    }

    public void setNombrePages(Integer nombrePages) {
        this.nombrePages = nombrePages;
    }

    public String getIsbn() {
        return isbn;
    }

    public void setIsbn(String isbn) {
        this.isbn = isbn;
    }

    public String getLangue() {
        return langue;
    }

    public void setLangue(String langue) {
        this.langue = langue;
    }

    public String getEditeur() {
        return editeur;
    }

    public void setEditeur(String editeur) {
        this.editeur = editeur;
    }

    public Boolean getValidation() {
        return validation;
    }

    public void setValidation(Boolean validation) {
        this.validation = validation;
    }

    public String getMaisonDisque() {
        return maisonDisque;
    }

    public void setMaisonDisque(String maisonDisque) {
        this.maisonDisque = maisonDisque;
    }

    public Integer getNombrePiste() {
        return nombrePiste;
    }

    public void setNombrePiste(Integer nombrePiste) {
        this.nombrePiste = nombrePiste;
    }

    public String getSocieteProduction() {
        return societeProduction;
    }

    public void setSocieteProduction(String societeProduction) {
        this.societeProduction = societeProduction;
    }

    public String getMaisonEdition() {
        return maisonEdition;
    }

    public void setMaisonEdition(String maisonEdition) {
        this.maisonEdition = maisonEdition;
    }

    public Integer getDuree() {
        return duree;
    }

    public void setDuree(Integer duree) {
        this.duree = duree;
    }

    public String getPublicVise() {
        return publicVise;
    }

    public void setPublicVise(String publicVise) {
        this.publicVise = publicVise;
    }

    public String getTypePeriodique() {
        return typePeriodique;
    }

    public void setTypePeriodique(String typePeriodique) {
        this.typePeriodique = typePeriodique;
    }

    public String getIssn() {
        return issn;
    }

    public void setIssn(String issn) {
        this.issn = issn;
    }

    public Integer getNumeroMagazine() {
        return numeroMagazine;
    }

    public void setNumeroMagazine(Integer numeroMagazine) {
        this.numeroMagazine = numeroMagazine;
    }

    public boolean getVisibleLecteur() {
        return visibleLecteur;
    }

    public void setVisibleLecteur(boolean visibleLecteur) {
        this.visibleLecteur = visibleLecteur;
    }

    public String getLienCouverture() {
        return lienCouverture;
    }

    public void setLienCouverture(String lienCouverture) {
        this.lienCouverture = lienCouverture;
    }

    public int getNombreExemplaire() {
        return nombreExemplaire;
    }

    public void setNombreExemplaire(int nombreExemplaire) {
        this.nombreExemplaire = nombreExemplaire;
    }

    @XmlTransient
    public Collection<PaysInterdit> getPaysInterditCollection() {
        return paysInterditCollection;
    }

    public void setPaysInterditCollection(Collection<PaysInterdit> paysInterditCollection) {
        this.paysInterditCollection = paysInterditCollection;
    }

    @XmlTransient
    public Collection<MotCle> getMotCleCollection() {
        return motCleCollection;
    }

    public void setMotCleCollection(Collection<MotCle> motCleCollection) {
        this.motCleCollection = motCleCollection;
    }

    @XmlTransient
    public Collection<Participant> getParticipantCollection() {
        return participantCollection;
    }

    public void setParticipantCollection(Collection<Participant> participantCollection) {
        this.participantCollection = participantCollection;
    }

    @XmlTransient
    public Collection<Emprunt> getEmpruntCollection() {
        return empruntCollection;
    }

    public void setEmpruntCollection(Collection<Emprunt> empruntCollection) {
        this.empruntCollection = empruntCollection;
    }

    public TypeDocument getTypeDocumentIdFk() {
        return typeDocumentIdFk;
    }

    public void setTypeDocumentIdFk(TypeDocument typeDocumentIdFk) {
        this.typeDocumentIdFk = typeDocumentIdFk;
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
        hash += (documentId != null ? documentId.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Document)) {
            return false;
        }
        Document other = (Document) object;
        if ((this.documentId == null && other.documentId != null) || (this.documentId != null && !this.documentId.equals(other.documentId))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "jpa.entities.Document[ documentId=" + documentId + " ]";
    }
    
}
