package com.project;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Map;

import model.Task;
import model.User;

import org.apache.struts2.dispatcher.SessionMap;
import org.apache.struts2.interceptor.SessionAware;

import DAO.TaskService;
import DAO.TaskServiceImp;
import DAO.UserService;
import DAO.UserServiceImp;

import com.opensymphony.xwork2.ActionSupport;

public class UpdateTaskAction extends ActionSupport implements SessionAware {

	private int edittask;
	private String description;
	private String startDate;
	private String endDate;
	public String getStartDate() {
		return startDate;
	}

	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}

	public String getEndDate() {
		return endDate;
	}

	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}

	private String status;

	SessionMap<String, Object> session;

	public int getEdittask() {
		return edittask;
	}

	public void setEdittask(int edittask) {
		this.edittask = edittask;
	}

	public String execute() throws ParseException {

		Task t = (Task) session.get("edittask");
		t.setDescription(description);

		Date startd = null;
		try {
			startd = new SimpleDateFormat("yyyy-MM-dd").parse(startDate);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		Date endd=new SimpleDateFormat("yyyy-MM-dd").parse(endDate);

			t.setStartDate(startd);
			t.setEndDate(endd);
		

		t.setStatus(status);

		TaskService ts = new TaskServiceImp();
		ts.updateTask(t);

		UserService us = new UserServiceImp();
		User me = (User) (session.get("user"));
		session.put("user", us.readUser(me.getUserName()).get(0));

		return SUCCESS;
	}

	@Override
	public void setSession(Map<String, Object> sess) {
		session = (SessionMap<String, Object>) sess;

	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	
	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

}
