package com.login;

import model.Faculty;
import model.Partener;
import model.Student;
import model.User;
import DAO.UserService;
import DAO.UserServiceImp;

import com.opensymphony.xwork2.ActionSupport;

public class SignUpAction extends ActionSupport {
	private User u;
	private String role;

	public String getRole() {
		return role;
	}



	public void setRole(String role) {
		this.role = role;
	}



	public User getU() {
		return u;
	}

	

	public void setU(User u) {
		this.u = u;
	}

	public String execute() {
		if(role.equals("student")){
			Student s=new Student();
			s.setUserName(u.getUserName());
			u.setStudent(s);
		}
		else if(role.equals("partner")){
			Partener p=new Partener();
			p.setUserName(u.getUserName());
			u.setPartener(p);
		}
		else if(role.equals("faculty")){
			Faculty f=new Faculty();
			f.setUserName(u.getUserName());
			u.setFaculty(f);
		}
		
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
