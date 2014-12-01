package model;

import java.io.Serializable;

import javax.persistence.*;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Set;


/**
 * The persistent class for the Communication database table.
 * 
 */
@Entity(name = "Communication")
@Table(name="Communication")
@NamedQueries({ @NamedQuery(name = "Communication.getMaxID", query = "Select max(c.idCommunication) as maxid from Communication c"),
	@NamedQuery(name="Communication.findAll", query="SELECT c FROM Communication c")})
public class Communication implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@Column(name = "IdCommunication")
	@GeneratedValue(strategy = GenerationType.AUTO)
	private int idCommunication;

	@Temporal(TemporalType.DATE)
	@Column(name="Date")
	private Date date;

	@Lob
	@Column(name="Summary")
	private String summary;
	
	@ManyToMany(cascade = CascadeType.ALL, mappedBy = "communications", fetch = FetchType.LAZY)
	private Set<User> users;

	
	
	public Set<User> getUsers() {
		return users;
	}

	public void setUsers(Set<User> users) {
		this.users = users;
	}

	public Communication() {
	}

	public int getIdCommunication() {
		return this.idCommunication;
	}

	public void setIdCommunication(int idCommunication) {
		this.idCommunication = idCommunication;
	}

	public Date getDate() {
		return this.date;
	}

	public String getDatestr(){
		SimpleDateFormat formatter=new SimpleDateFormat("yyyy-MM-dd");
		String datestring=formatter.format(this.date);
		return datestring;
		
	}
	public void setDate(Date date) {
		this.date = date;
	}

	public String getSummary() {
		return this.summary;
	}

	public void setSummary(String summary) {
		this.summary = summary;
	}
	
	public String toString() {
		return "Communication[idCommunication: " + getIdCommunication() + " summary:  " + getSummary();
	}
	
	@Override
	public int hashCode() {
		return (new Integer(idCommunication)).hashCode();
	}

	@Override
	public boolean equals(Object object) {
		if ((object instanceof Communication)) {
			if (idCommunication == ((Communication) object).idCommunication)
				return true;
		}
		return false;

	}

}