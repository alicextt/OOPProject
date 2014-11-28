package com.project;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Map;

import model.Project;
import model.Task;
import model.User;

import org.apache.struts2.dispatcher.SessionMap;
import org.apache.struts2.interceptor.SessionAware;

import DAO.ProjectService;
import DAO.ProjectServiceImp;
import DAO.TaskService;
import DAO.TaskServiceImp;
import DAO.UserService;
import DAO.UserServiceImp;

import com.opensymphony.xwork2.ActionSupport;

public class UpdateProjectAction extends ActionSupport implements SessionAware {

	private String descrip;
	private String sdate;
	private String edate;
	private String poutcome;
	private String pstatus;

	SessionMap<String, Object> session;

	public String getDescrip() {
		return descrip;
	}

	public void setDescrip(String descrip) {
		this.descrip = descrip;
	}

	public String getSdate() {
		return sdate;
	}

	public void setSdate(String sdate) {
		this.sdate = sdate;
	}

	public String getEdate() {
		return edate;
	}

	public void setEdate(String edate) {
		this.edate = edate;
	}

	public String getPoutcome() {
		return poutcome;
	}

	public void setPoutcome(String poutcome) {
		this.poutcome = poutcome;
	}

	public String getPstatus() {
		return pstatus;
	}

	public void setPstatus(String pstatus) {
		this.pstatus = pstatus;
	}

	public String execute() throws ParseException {

		Project p = (Project) session.get("project");
		p.setDescription(descrip);

		Date startd = null;
		try {
			startd = new SimpleDateFormat("yyyy-MM-dd").parse(sdate);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		Date endd = new SimpleDateFormat("yyyy-MM-dd").parse(edate);

		p.setStartDate(startd);
		p.setEndDate(endd);

		p.setProjectStatus(pstatus);

		ProjectService ps = new ProjectServiceImp();
		ps.updateproject(p);
		

		UserService us = new UserServiceImp();
		User me = (User) (session.get("user"));
		session.put("user", us.readUser(me.getUserName()).get(0));

		return SUCCESS;
	}

	@Override
	public void setSession(Map<String, Object> sess) {
		session = (SessionMap<String, Object>) sess;

	}

	
}
