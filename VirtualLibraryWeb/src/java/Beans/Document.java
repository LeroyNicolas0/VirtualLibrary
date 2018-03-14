/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Beans;

import java.util.Date;

/**
 *
 * @author atyla
 */
public abstract class Document {
    protected Integer documentID;

    public Integer getDocumentID() {
        return documentID;
    }

    public void setDocumentID(Integer documentID) {
        this.documentID = documentID;
    }
    protected String titre;
    protected Date dateParution;
    protected String description;
    protected Boolean visibleLecteur;
    protected String lienCouverture;

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
}
