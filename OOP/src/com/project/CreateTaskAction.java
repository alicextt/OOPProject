package com.project;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Map;
import java.util.Set;

import org.apache.struts2.dispatcher.SessionMap;
import org.apache.struts2.interceptor.SessionAware;

import model.Project;
import model.Task;
import model.User;
import DAO.TaskService;
import DAO.TaskServiceImp;
import DAO.UserService;
import DAO.UserServiceImp;

import com.opensymphony.xwork2.ActionSupport;

public class CreateTaskAction extends ActionSupport implements SessionAware{

	private String startdate;
	private String enddate;
	private Task newtask;
	SessionMap<String, Object> session;
	
	private void setTaskdate(){
		SimpleDateFormat start = new SimpleDateFormat("yyyy-MM-dd");
		
		Date startd;
		Date endd;
		
		try {
			startd=start.parse(startdate);
			endd=start.parse(enddate);
			assert(startd!=null&&endd!=null);
			newtask.setStartDate(startd);
			newtask.setEndDate(endd);	
		} catch (ParseException e) {
		}
		
	}
	
	public String execute() {
		
		setTaskdate();
		String status=newtask.getStatus();
		if(status.equals("1"))
			newtask.setStatus("not started");
		else if(status.equals("2"))
			newtask.setStatus("started");
		else
			newtask.setStatus("finished");
			
		Project pp=(Project) session.get("project");
		TaskService ts=new TaskServiceImp();
		ts.addTask(newtask, pp);
	
		// this is needed is incase the task is assigned to myself
		UserService us=new UserServiceImp();
		User me=(User)(session.get("user"));
		session.put("user", us.readUser(me.getUserName()).get(0));
		return SUCCESS;
	}
	
	public void validate() {
		
		if(startdate.isEmpty())
			addFieldError("startdate", "Start date can not be null!"); 
		if(enddate.isEmpty())
			addFieldError("enddate", "End date can not be null!"); 
		
		
	}

	public String getStartdate() {
		return startdate;
	}

	public void setStartdate(String startdate) {
		this.startdate = startdate;
	}

	public String getEnddate() {
		return enddate;
	}

	public void setEnddate(String enddate) {
		this.enddate = enddate;
	}


	public Task getNewtask() {
		return newtask;
	}

	public void setNewtask(Task newtask) {
		this.newtask = newtask;
	}

	@Override
	public void setSession(Map<String, Object> sess) {
		session=(SessionMap<String, Object>) sess;
	}

}
