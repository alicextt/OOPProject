package com.login;

import java.io.PrintWriter;
import java.util.List;
import java.util.Map;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

import org.apache.struts2.interceptor.SessionAware;

import model.User;

import com.opensymphony.xwork2.ActionSupport;

public class LoginAction extends ActionSupport implements SessionAware {

	private String userName;
	private String password;
	private User u;
	Map<String, Object> session;

	@Override
	public void setSession(Map<String, Object> session) {
		this.session = session;
	}

	public String execute() {
	
		session.put("user", u);
		return SUCCESS;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public void validate() {
		// if (getUserName().length() == 0) {
		// addFieldError("userName", "UserName.required");
		// } else if (!getUserName().equals("Arpit")) {
		// addFieldError("userName", "Invalid User");
		// }
		// if (getPassword().length() == 0) {
		// addFieldError("password", getText("password.required"));
		// }
//		System.out.println("We are in the validate method");
		String username = "user";
		String password = "root";
		String un = getUserName();
		String pw = getPassword();
		EntityManagerFactory emf = Persistence
				.createEntityManagerFactory("User");
		EntityManager em = emf.createEntityManager();
		javax.persistence.Query querybyusername = em
				.createNamedQuery("User.findByusername");

		querybyusername.setParameter("userName", un);
		// System.out.print(querybyusername);
		List<User> result = querybyusername.getResultList();
		// for(User p:result){
		// System.out.println(p.getPassWord());
		// }

		em.close();
		emf.close();
		if (result.isEmpty()) {
			addFieldError("userName", "Incorrect Account !");
			return;
		}
		if (!pw.equals(result.get(0).getPassWord())) {
			addFieldError("password", "Incorrect Password!");
			return;
		}
		u=result.get(0);
	}

}
