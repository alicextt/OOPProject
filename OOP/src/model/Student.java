package model;

import java.io.Serializable;

import javax.persistence.*;

@Entity(name="Student")
@Table(name="Student")
public class Student implements Serializable {
	private static final long serialVersionUID = 1L;

	@Column(name = "Department")
	private String department;

	@Column(name = "AcdemicYear")
	private String acdemicYear;
	
	@Id
	@GeneratedValue(strategy = GenerationType.TABLE)
	@Column(name = "student")
	private String userName;

	public String getDepartment() {
		return department;
	}

	public void setDepartment(String department) {
		this.department = department;
	}

	public String getAcdemicYear() {
		return acdemicYear;
	}

	public void setAcdemicYear(String acdemicYear) {
		this.acdemicYear = acdemicYear;
	}



	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	

	

}
