package com.project;

import java.util.List;
import java.util.Map;

import org.apache.struts2.interceptor.SessionAware;

import model.Project;
import model.User;
import DAO.ProjectService;
import DAO.ProjectServiceImp;
import DAO.TaskService;
import DAO.TaskServiceImp;
import DAO.UserService;
import DAO.UserServiceImp;

import com.opensymphony.xwork2.ActionSupport;

public class ProjectAction extends ActionSupport implements SessionAware {

	private String name;
	Map<String, Object> session;
	private int taskid=0;
	private Boolean remove = false;

	public Map<String, Object> getSession() {
		return session;
	}


	public int getTaskid() {
		return taskid;
	}


	public void setTaskid(int taskid) {
		this.taskid = taskid;
	}


	public Boolean getRemove() {
		return remove;
	}

	public void setRemove(Boolean remove) {
		this.remove = remove;
	}

	// be careful that have to use a different name sess, otherwise will
	// overwrite
	public void setSession(Map<String, Object> sess) {
		this.session = sess;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String execute() {
		if (remove == false) {
			ProjectService ps = new ProjectServiceImp();
			Project p = ps.findbyname(name);
			// UserService us=new UserServiceImp();
			// List<String> usrlist=us.getallUser();
			// session.put("usrlist", usrlist);
			session.put("project", p);
			User u = (User) (session.get("user"));
			if (u.getPartener() != null) {
				return "partner";
			}
			return SUCCESS;
		} else {
			if(taskid!=0){
			ProjectService ps=new ProjectServiceImp();
			TaskService ts=new TaskServiceImp();
			UserService us=new UserServiceImp();
			Project p=(Project)(session.get("project"));
			User u=(User)(session.get("user"));
			ps.deleteTask(p,ts.findTask(taskid));
			Project newp=ps.findbyname(p.getName());
			User newu=us.readUser(u.getUserName()).get(0);
			assert(newp!=null &&newu!=null);
			session.put("project", newp);
			session.put("user", newu);
			}
			return SUCCESS;
		}
	}
}
