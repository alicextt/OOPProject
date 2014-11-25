package com.project;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Set;

import model.Project;
import model.User;

import org.apache.struts2.dispatcher.SessionMap;
import org.apache.struts2.interceptor.SessionAware;

import DAO.UserService;
import DAO.UserServiceImp;

import com.opensymphony.xwork2.ActionSupport;

public class GetTeamUser extends ActionSupport implements SessionAware {

	private List<String> usrList;
	private SessionMap<String, Object> session;
	
	
	public List<String> getUsrList() {
		return usrList;
	}

	public void setUsrList(List<String> usrList) {
		this.usrList = usrList;
	}

	public String execute() {

		usrList = new ArrayList<String>();
		Project p=(Project) session.get("project");
				Set<User> u=p.getUsers();
		for(User s:u){
			usrList.add(s.getUserName());
		}

		return SUCCESS;
	}

	public String getJSON() {
		return execute();
	}

	@Override
	public void setSession(Map<String, Object> arg0) {
		session=(SessionMap<String, Object>) arg0;
	}

}
