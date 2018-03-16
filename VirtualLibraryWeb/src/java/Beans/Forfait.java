/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Beans;

import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

/**
 *
 * @author Francis
 */
@Entity
@Table(name = "forfait")
public class Forfait {
    
    
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "forfait_id")
    private Integer forfaitID;
    public Forfait(){
        
    }
     public Integer getForfaitID() {
        return forfaitID;
    }
     
    
    public void setForfaitID(Integer motCleID) {
        this.forfaitID = motCleID;
    }
    
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 20)
    @Column(name = "nom")
    private String nom;
    public String getNom() {
        return nom;
    }

    public void setNom(String nom) {
        this.nom = nom;
    }
    
    
    @Basic(optional = false)
    @NotNull
    @Column(name = "tarif")
    private Float tarif;
    public float getTarif() {
        return tarif;
    }
    
    public void setTarif(float tarif) {
        this.tarif = tarif;
    }

    @Basic(optional = false)
    @NotNull
    @Column(name = "duree")
    private Integer duree;
    public float getDuree() {
        return duree;
    }

    public void setDuree(int duree) {
        this.duree = duree;
    }
    
    
}
