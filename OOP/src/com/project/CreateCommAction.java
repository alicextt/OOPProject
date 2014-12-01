package com.project;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import model.Communication;
import model.User;

import org.apache.struts2.interceptor.SessionAware;

import DAO.ProjectService;
import DAO.ProjectServiceImp;
import DAO.UserService;
import DAO.UserServiceImp;

import com.opensymphony.xwork2.ActionSupport;

public class CreateCommAction extends ActionSupport implements SessionAware {

	private String commsummary;
	private String users;
	private String commdate;
	Map<String, Object> session;

	private Date setdatefromstring() {
		SimpleDateFormat start = new SimpleDateFormat("yyyy-MM-dd");
		Date startd;

		try {
			startd = start.parse(commdate);
			assert (startd != null);
			return startd;
		} catch (ParseException e) {
		}
		return null;
	}

	public String execute() {

		UserService us = new UserServiceImp();
		HashSet<User> set1 = new HashSet<User>();
		String[] parts = users.split(",");
		Communication c = us.newCommunication();
		c.setSummary(commsummary);
		c.setDate(setdatefromstring());
		for (String s : parts) {
			List<User> setuser = us.readUser(s);
			if (!setuser.isEmpty()) {
				set1.add(setuser.get(0));
				c.setUsers(set1);
				us.updateCommunication(c, setuser.get(0));
			}
		}
		UserService us2=new UserServiceImp();
		User me=(User)(session.get("user"));
		session.put("user", us2.readUser(me.getUserName()).get(0));
		return SUCCESS;
	}

	public void setSession(Map<String, Object> sess) {
		this.session = sess;
	}

	public Map<String, Object> getSession() {
		return session;
	}

	public void validate() {

		if (users.isEmpty())
			addFieldError("users", "Users can not be null!");
	}

	public String getCommsummary() {
		return commsummary;
	}

	public void setCommsummary(String commsummary) {
		this.commsummary = commsummary;
	}

	public String getUsers() {
		return users;
	}

	public void setUsers(String users) {
		this.users = users;
	}

	public String getCommdate() {
		return commdate;
	}

	public void setCommdate(String commdate) {
		this.commdate = commdate;
	}
}
