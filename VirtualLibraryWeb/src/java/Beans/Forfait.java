/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Beans;

/**
 *
 * @author Francis
 */
public class Forfait {
    protected Integer forfaitID;
    
     public Integer getForfaitID() {
        return forfaitID;
    }

    public void setForfaitID(Integer motCleID) {
        this.forfaitID = motCleID;
    }
    private String nom;

    public String getNom() {
        return nom;
    }

    public void setNom(String nom) {
        this.nom = nom;
    }
    
    private float tarif;

    public float getTarif() {
        return tarif;
    }

    public void setTarif(float tarif) {
        this.tarif = tarif;
    }
    private int duree;

    public float getDuree() {
        return duree;
    }

    public void setDuree(int duree) {
        this.duree = duree;
    }
    
    
}
