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

	private String projectname;
	private String startdate;
	private String enddate;
	private Task newtask;
	SessionMap<String, Object> session;
	
	private void setTaskdate(){
		SimpleDateFormat start = new SimpleDateFormat("yyyy-mm-dd");
		
		Date startd;
		Date endd;
		
		try {
			startd=start.parse(startdate);
			endd=start.parse(enddate);
			newtask.setStartDate(startd);
			newtask.setEndDate(endd);	
		} catch (ParseException e) {
			e.printStackTrace();
		}
		
	}
	
	public String execute() {
		
		setTaskdate();
		Project pp=(Project) session.get("project");
		TaskService ts=new TaskServiceImp();
		ts.addTask(newtask, pp);
	
		// this is needed is incase the task is assigned to myself
		UserService us=new UserServiceImp();
		User me=(User)(session.get("user"));
		session.put("user", us.readUser(me.getUserName()).get(0));
		return SUCCESS;
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

	public String getProjectname() {
		return projectname;
	}

	public void setProjectname(String projectname) {
		this.projectname = projectname;
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
