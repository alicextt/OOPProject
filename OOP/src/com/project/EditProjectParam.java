package com.project;

import java.util.Date;
import java.util.Map;

import org.apache.struts2.dispatcher.SessionMap;

import model.Project;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class EditProjectParam extends ActionSupport{
	
	private String pname;
	public String getPname() {
		return pname;
	}

	public void setPname(String pname) {
		this.pname = pname;
	}

	private String descrip;
	private Date sdate;
	private Date edate;
	private String poutcome;
	private String pstatus;
	
	public String execute(){
		
		Map<String, Object> sess=ActionContext.getContext().getSession();
		Project editproject=(Project) sess.get("project");
		pname=editproject.getName();
		descrip=editproject.getDescription();
		sdate=editproject.getStartDate();
		edate=editproject.getEndDate();
		poutcome=editproject.getProjectOutcome();
		pstatus=editproject.getProjectStatus();
		
		return SUCCESS;
	}

	public String getDescrip() {
		return descrip;
	}

	public void setDescrip(String descrip) {
		this.descrip = descrip;
	}

	public Date getSdate() {
		return sdate;
	}

	public void setSdate(Date sdate) {
		this.sdate = sdate;
	}

	public Date getEdate() {
		return edate;
	}

	public void setEdate(Date edate) {
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

	

}
