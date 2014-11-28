package edu.scu.frugal.action;

import java.util.List;
import java.util.Map;

import model.Project;
import model.Task;
import model.User;
import DAO.QueryService;

import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

public class QueryAction extends ActionSupport implements ModelDriven<QueryParams> {

	private static final long serialVersionUID = -8512930089581642823L;
	QueryParams params = new QueryParams();
	List<Project> projects = null;
	User user = null;
	List<Task> tasks = null;

	@Override
	public String execute() throws Exception {
		QueryService service = QueryService.getInstance();
		if (params.isTask()) {
			tasks = service.findTasks(params);
		} else {
			projects = service.findProjects(params);
		}
		Map<String, Object> session = ActionContext.getContext().getSession();
		user = (User) session.get("user");
		return Action.SUCCESS;
	}

	public QueryParams getParams() {
		return params;
	}

	public void setParams(QueryParams params) {
		this.params = params;
	}

	@Override
	public QueryParams getModel() {
		return params;
	}

	public List<Project> getProjects() {
		return projects;
	}

	public List<Task> getTasks() {
		return tasks;
	}

	public String getUserFirstName() {
		return this.user.getFirstName();
	}

	public String getUserLastName() {
		return this.user.getLastName();
	}
}
