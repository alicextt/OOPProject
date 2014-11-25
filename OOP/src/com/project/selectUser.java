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

public class selectUser extends ActionSupport {

    private List<String> usrList;
    
	public List<String> getUsrList() {
		return usrList;
	}

	public void setUsrList(List<String> usrList) {
		this.usrList = usrList;
	}

	public String execute() {

		usrList = new ArrayList<String>();
		UserService us=new UserServiceImp();
		usrList=us.getallUser();
	
		
      return SUCCESS;
    }

    public String getJSON(){
        return execute();
    }


    
}
