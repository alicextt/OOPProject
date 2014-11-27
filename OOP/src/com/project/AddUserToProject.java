package com.project;

import java.util.Map;

import model.Project;
import model.User;

import org.apache.struts2.dispatcher.SessionMap;
import org.apache.struts2.interceptor.SessionAware;

import DAO.ProjectService;
import DAO.ProjectServiceImp;
import DAO.UserService;
import DAO.UserServiceImp;

import com.opensymphony.xwork2.ActionSupport;

public class AddUserToProject extends ActionSupport implements SessionAware {

	private String chooseuser;
	SessionMap<String, Object> session;

	public String getChooseuser() {
		return chooseuser;
	}

	public void setChooseuser(String chooseuser) {
		this.chooseuser = chooseuser;
	}


	public String execute() {
		
		Project p=(Project) session.get("project");
		UserService us=new UserServiceImp();
		User u=us.readUser(chooseuser).get(0);
		ProjectService ps=new ProjectServiceImp();
		ps.addUsertoProject(p, u);
		User me=(User)session.get("user");
		if(me.getPartener()!=null){
			return "partener";
		}
		
		return SUCCESS;
	}

	@Override
	public void setSession(Map<String, Object> sess) {
		session = (SessionMap<String, Object>) sess;

	}

}
