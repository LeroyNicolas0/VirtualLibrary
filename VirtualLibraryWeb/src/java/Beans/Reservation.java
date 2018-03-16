package Beans;

import Beans.Document;
import Beans.Lecteur;
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
@Table(name = "reservation")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Reservation.findAll", query = "SELECT r FROM Reservation r")
    , @NamedQuery(name = "Reservation.findByReservationId", query = "SELECT r FROM Reservation r WHERE r.reservationId = :reservationId")
    , @NamedQuery(name = "Reservation.findByDateReservation", query = "SELECT r FROM Reservation r WHERE r.dateReservation = :dateReservation")})
public class Reservation implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "reservation_id")
    private Integer reservationId;
    @Basic(optional = false)
    @NotNull
    @Column(name = "date_reservation")
    @Temporal(TemporalType.DATE)
    private Date dateReservation;
    @JoinColumn(name = "document_id_fk", referencedColumnName = "document_id")
    @ManyToOne(optional = false)
    private Document documentIdFk;
    @JoinColumn(name = "lecteur_id_fk", referencedColumnName = "lecteur_id")
    @ManyToOne(optional = false)
    private Utilisateur lecteurIdFk;

    public Reservation() {
    }

    public Reservation(Integer reservationId) {
        this.reservationId = reservationId;
    }

    public Reservation(Integer reservationId, Date dateReservation) {
        this.reservationId = reservationId;
        this.dateReservation = dateReservation;
    }

    public Integer getReservationId() {
        return reservationId;
    }

    public void setReservationId(Integer reservationId) {
        this.reservationId = reservationId;
    }

    public Date getDateReservation() {
        return dateReservation;
    }

    public void setDateReservation(Date dateReservation) {
        this.dateReservation = dateReservation;
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
        hash += (reservationId != null ? reservationId.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Reservation)) {
            return false;
        }
        Reservation other = (Reservation) object;
        if ((this.reservationId == null && other.reservationId != null) || (this.reservationId != null && !this.reservationId.equals(other.reservationId))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "jpa.entities.Reservation[ reservationId=" + reservationId + " ]";
    }
    
}
