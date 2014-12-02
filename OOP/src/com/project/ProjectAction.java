package com.project;

import java.util.Collections;
import java.util.List;
import java.util.Map;

import model.Project;
import model.User;

import org.apache.struts2.interceptor.SessionAware;

import DAO.BudgetService;
import DAO.ProjectService;
import DAO.ProjectServiceImp;
import DAO.TaskService;
import DAO.TaskServiceImp;
import DAO.UserService;
import DAO.UserServiceImp;

import com.opensymphony.xwork2.ActionSupport;

import edu.scu.frugal.model.Budget;

public class ProjectAction extends ActionSupport implements SessionAware {

	private String name;
	int projectId;
	Map<String, Object> session;
	private int taskid = 0;
	private Boolean remove = false;
	List<Budget> budgets = Collections.emptyList(); // budgets of a project

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

	public int getProjectId() {
		return projectId;
	}

	public void setProjectId(int projectId) {
		this.projectId = projectId;
	}

	public List<Budget> getBudgets() {
		return budgets;
	}

	public void setBudgets(List<Budget> budgets) {
		this.budgets = budgets;
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
			this.projectId = p.getIdProject();
			// prepare budgets
			if (p != null) {
				BudgetService service = BudgetService.getInstance();
				this.budgets = service.listBudgets(p.getIdProject());
			}
			return SUCCESS;
		} else {
			if (taskid != 0) {
				ProjectService ps = new ProjectServiceImp();
				TaskService ts = new TaskServiceImp();
				UserService us = new UserServiceImp();
				Project p = (Project) (session.get("project"));
				User u = (User) (session.get("user"));
				ps.deleteTask(p, ts.findTask(taskid));
				Project newp = ps.findbyname(p.getName());
				User newu = us.readUser(u.getUserName()).get(0);
				assert (newp != null && newu != null);
				session.put("project", newp);
				session.put("user", newu);
			}
			return SUCCESS;
		}
	}
}
