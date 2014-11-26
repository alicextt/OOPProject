package model;

import java.io.Serializable;

import javax.persistence.*;

@Entity(name="Partener")
@Table(name="Partener")
public class Partener implements Serializable {
	private static final long serialVersionUID = 1L;

	@Column(name = "Company")
	private String company;

	@Column(name = "CompanyAddress")
	private String address;
	
	@Column(name = "Representative")
	private String rep;
	
	public String getRep() {
		return rep;
	}

	public void setRep(String rep) {
		this.rep = rep;
	}

	@Id
	@GeneratedValue(strategy = GenerationType.TABLE)
	@Column(name = "Partener")
	private String userName;

	

	public String getCompany() {
		return company;
	}

	public void setCompany(String company) {
		this.company = company;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	

	

}
