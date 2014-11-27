package com.project;

import java.util.List;
import java.util.Map;

import org.apache.struts2.interceptor.SessionAware;

import model.Project;
import model.User;
import DAO.ProjectService;
import DAO.ProjectServiceImp;
import DAO.UserService;
import DAO.UserServiceImp;

import com.opensymphony.xwork2.ActionSupport;

public class ProjectAction extends ActionSupport implements SessionAware {

	private String name;
	Map <String, Object> session;
	
	public Map<String, Object> getSession() {
		return session;
	}

//	be careful that have to use a different name sess, otherwise will overwrite
	public void setSession(Map<String, Object> sess) {
		this.session = sess;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String execute() {

		ProjectService ps=new ProjectServiceImp();
		Project p=ps.findbyname(name);
//		UserService us=new UserServiceImp();
//		List<String> usrlist=us.getallUser();
//		session.put("usrlist", usrlist);
		session.put("project", p);
		User u=(User)(session.get("user"));
		if(u.getPartener()!=null){
			return "partner";
		}
		return SUCCESS;
	}

}
