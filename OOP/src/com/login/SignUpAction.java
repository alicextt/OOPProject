package com.login;

import model.User;
import DAO.UserService;
import DAO.UserServiceImp;

import com.opensymphony.xwork2.ActionSupport;

public class SignUpAction extends ActionSupport {
	private String password_confirmation;
	private User u;

	public User getU() {
		return u;
	}

	public String getPassword_confirmation() {
		return password_confirmation;
	}

	public void setPassword_confirmation(String password_confirmation) {
		this.password_confirmation = password_confirmation;
	}

	public void setU(User u) {
		this.u = u;
	}

	public String execute() {

		UserService us = new UserServiceImp();
		if (!(us.addUser(u))) {
			addFieldError("u.userName", "Existed Account !");
			return INPUT;
		}
		return SUCCESS;
	}
	public void validate(){
		
	}
}
