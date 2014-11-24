package com.project;

import java.util.ArrayList;
import java.util.List;

import DAO.UserService;
import DAO.UserServiceImp;

import com.opensymphony.xwork2.ActionSupport;

public class selectUser extends ActionSupport{

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
