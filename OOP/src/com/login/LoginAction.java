package com.login;

import java.util.List;
import java.util.Map;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

import org.apache.struts2.interceptor.SessionAware;

import model.User;
import DAO.UserService;
import DAO.UserServiceImp;

import com.opensymphony.xwork2.ActionSupport;

public class LoginAction extends ActionSupport implements SessionAware {

	// u is parsed from login.jsp
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

	// add u as logged user in session
	public String execute() {
	
		session.put("user", u);
		return SUCCESS;
	}

// the validate method will intercept before execute, if failed, will go back return input
	public void validate() {

//		System.out.println("We are in the validate method");
		
		String un = u.getUserName();
		String pw = u.getPassWord();
		
		UserService us=new UserServiceImp();
		List<User> result=us.readUser(un);
		if (result.isEmpty()) {
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
