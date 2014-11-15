package model;

import java.io.Serializable;

import javax.persistence.*;


/**
 * The persistent class for the User database table.
 * 
 */
@Entity(name = "user")
@NamedQueries({
	@NamedQuery(name="User.findAll", query="SELECT u FROM user u"),
@NamedQuery(name="User.findByusername", query="SELECT u FROM user u where u.userName=:userName")
})
public class User implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@Column(name = "IdUser")
	@GeneratedValue(strategy = GenerationType.TABLE)
	private int idUser;

	@Column(name="Email")
	private String email;

	@Column(name="FirstName")
	private String firstName;
	
	@Column(name="LastName")
	private String lastName;

	@Column(name="PassWord")
	private String passWord;

	@Column(name="UserName")
	private String userName;

	public User() {
	}

	public int getIdUser() {
		return this.idUser;
	}

	public void setIdUser(int idUser) {
		this.idUser = idUser;
	}

	public String getEmail() {
		return this.email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getFirstName() {
		return this.firstName;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	public String getLastName() {
		return this.lastName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	public String getPassWord() {
		return this.passWord;
	}

	public void setPassWord(String passWord) {
		this.passWord = passWord;
	}

	public String getUserName() {
		return this.userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

}