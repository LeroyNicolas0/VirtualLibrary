/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Beans;

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
import javax.persistence.MappedSuperclass;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlTransient;

/**
 *
 * @author atyla
 */
@Entity
@Table(name="document")
public class Document implements Serializable{
    protected Integer documentID;

    public Document(){
        
    }
    public Integer getDocumentID() {
        return documentID;
    }

    public void setDocumentID(Integer documentID) {
        this.documentID = documentID;
    }
    
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "document_id")
    protected Integer documentId;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 50)
    @Column(name = "titre")
    protected String titre;
    @Basic(optional = false)
    @NotNull
    @Column(name = "date_parution")
    @Temporal(TemporalType.DATE)
    protected Date dateParution;
    @Basic(optional = false)
    @NotNull
    @Lob
    @Size(min = 1, max = 65535)
    @Column(name = "description")
    protected String description;
    @Basic(optional = false)
    @NotNull
    @Column(name = "visible_lecteur")
    protected boolean visibleLecteur;
    @Lob
    @Size(max = 65535)
    @Column(name = "lien_couverture")
    protected String lienCouverture;
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
    @ManyToOne(optional = true)
    private TypeDocument typeDocumentIdFk;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "documentIdFk")
    private Collection<Reservation> reservationCollection;
    
    @Size(max = 13)
    @Column(name = "isbn")
    private String isbn;
    @Column(name = "nombre_pages")
    private Integer nombrePages;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 20)
    @Column(name = "langue")
    private String langue;

    public String getIsbn() {
        return isbn;
    }

    public void setIsbn(String isbn) {
        this.isbn = isbn;
    }

    public int getNbPages() {
        return nombrePages;
    }

    public void setNbPages(int nbPages) {
        this.nombrePages = nbPages;
    }

    public String getLangue() {
        return langue;
    }

    public void setLangue(String langue) {
        this.langue = langue;
    }
    
    public String getLienCouverture() {
        return lienCouverture;
    }

    public void setLienCouverture(String lienCouverture) {
        this.lienCouverture = lienCouverture;
    }

    public Integer getNbExemplaire() {
        return nbExemplaire;
    }

    public void setNbExemplaire(Integer nbExemplaire) {
        this.nbExemplaire = nbExemplaire;
    }
    protected Integer nbExemplaire;

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

    public Boolean getVisibleLecteur() {
        return visibleLecteur;
    }

    public void setVisibleLecteur(Boolean visibleLecteur) {
        this.visibleLecteur = visibleLecteur;
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
    
    public void addMotCleCollection(MotCle motCle) {
        this.motCleCollection.add(motCle);
    }
    
    public void removeMotCleCollection(MotCle motCle) {
        this.motCleCollection.remove(motCle);
    }

    @XmlTransient
    public Collection<Participant> getParticipantCollection() {
        return participantCollection;
    }
    
    public void setParticipantCollection(Collection<Participant> participantCollection) {
        this.participantCollection = participantCollection;
    }
    
    public void addParticipantCollection(Participant participant) {
        this.participantCollection.add(participant);
    }
    
    public void removeParticipantCollection(Participant participant) {
        this.participantCollection.remove(participant);
    }
}
