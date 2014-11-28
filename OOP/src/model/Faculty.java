package model;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity(name = "Faculty")
@Table(name = "Faculty")
public class Faculty implements Serializable {
	private static final long serialVersionUID = 1L;

	@Column(name = "Department")
	private String department;

	@Column(name = "title")
	private String title;

	@Id
	@GeneratedValue(strategy = GenerationType.TABLE)
	@Column(name = "UserName")
	private String userName;

	public String getDepartment() {
		return department;
	}

	public void setDepartment(String department) {
		this.department = department;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

}
