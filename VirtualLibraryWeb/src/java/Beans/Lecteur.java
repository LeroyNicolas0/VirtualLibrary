/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Beans;

import java.io.Serializable;
import javax.persistence.Entity;
import javax.persistence.Table;

/**
 *
 * @author atyla
 */

public class Lecteur extends Utilisateur implements Serializable{

    public Lecteur() {
    }
    
    //methodes pour emprunter, s'abonner, etc
}
