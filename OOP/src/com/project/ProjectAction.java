package com.project;

import java.util.Map;

import org.apache.struts2.interceptor.SessionAware;

import model.Project;
import DAO.ProjectService;
import DAO.ProjectServiceImp;

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
		session.put("project", p);
		return SUCCESS;
	}

}
