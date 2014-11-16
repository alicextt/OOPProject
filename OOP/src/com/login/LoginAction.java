package com.login;

import java.util.List;
import java.util.Map;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

import org.apache.struts2.interceptor.SessionAware;

import model.User;

import com.opensymphony.xwork2.ActionSupport;

public class LoginAction extends ActionSupport implements SessionAware {

	private User u;
	Map<String, Object> session;

	@Override
	public void setSession(Map<String, Object> session) {
		this.session = session;
	}

	public User getU() {
		return u;
	}

	public void setU(User u) {
		this.u = u;
	}

	public String execute() {
	
		session.put("user", u);
		return SUCCESS;
	}

// the validate method will intercept before execute, if failed, will go back return input
	public void validate() {

//		System.out.println("We are in the validate method");
		
		String un = u.getUserName();
		String pw = u.getPassWord();
		
//		System.out.println(" this is from the page username"+un+" and the password is "+pw);
		
		EntityManagerFactory emf = Persistence
				.createEntityManagerFactory("User");
		EntityManager em = emf.createEntityManager();
		javax.persistence.Query querybyusername = em
				.createNamedQuery("User.findByusername");

		querybyusername.setParameter("userName", un);
//		 System.out.println(querybyusername);
		List<User> result = querybyusername.getResultList();
	
		// for(User p:result){
		// System.out.println(p.getPassWord());
		// }
		em.close();
		emf.close();
		if (result.isEmpty()) {
			System.out.println("entered");
			addFieldError("u.userName", "Incorrect Account !");
			return;
		}
		if (!pw.equals(result.get(0).getPassWord())) {
			addFieldError("u.passWord", "Incorrect Password!");
			return;
		}
		u=result.get(0);
	}

}
