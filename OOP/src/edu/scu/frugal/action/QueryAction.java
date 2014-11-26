package edu.scu.frugal.action;

import java.util.List;
import java.util.Map;

import model.Project;

import org.apache.struts2.interceptor.SessionAware;

import DAO.QueryService;

import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ActionSupport;

public class QueryAction extends ActionSupport {

	QueryParams params = new QueryParams();
	
	@Override
	public String execute() throws Exception {
		QueryService service = QueryService.getInstance();
		List<Project> projects = service.findProjects(params);
		return Action.SUCCESS;
	}
}
