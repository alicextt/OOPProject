package com.project;

import java.util.Date;
import java.util.Map;

import org.apache.struts2.dispatcher.SessionMap;
import org.apache.struts2.interceptor.SessionAware;

import model.Task;
import DAO.TaskService;
import DAO.TaskServiceImp;

import com.opensymphony.xwork2.ActionSupport;

public class EditTaskAction extends ActionSupport implements SessionAware {

	private int edittask;
	private String description;
	private Date startDate;
	private Date endDate;
	private String status;
	
 SessionMap<String, Object> session;

	public int getEdittask() {
		return edittask;
	}

	public void setEdittask(int edittask) {
		this.edittask = edittask;
	}
	
	public String execute(){
		TaskService ts=new TaskServiceImp();		
		Task t=ts.findTask(edittask);
		session.put("edittask", t);
		description=t.getDescription();
		setStartDate(t.getStartDate());
		setEndDate(t.getEndDate());
		setStatus(t.getStatus());
		return SUCCESS;
	}

	@Override
	public void setSession(Map<String, Object> sess) {
		session=(SessionMap<String, Object>) sess;
		
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public Date getStartDate() {
		return startDate;
	}

	public void setStartDate(Date startDate) {
		this.startDate = startDate;
	}

	public Date getEndDate() {
		return endDate;
	}

	public void setEndDate(Date endDate) {
		this.endDate = endDate;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}
	
	
}
