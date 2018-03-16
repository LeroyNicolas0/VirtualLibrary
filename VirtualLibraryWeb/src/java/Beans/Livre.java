/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Beans;

import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

/**
 *
 * @author atyla
 */
@Entity
@Table(name="document")
public class Livre extends Document{
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
    private String typeLivre;

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

    public String getTypeLivre() {
        return typeLivre;
    }

    public void setTypeLivre(String typeLivre) {
        this.typeLivre = typeLivre;
    }
}
