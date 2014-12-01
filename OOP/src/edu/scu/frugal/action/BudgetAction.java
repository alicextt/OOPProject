package edu.scu.frugal.action;

import java.util.Map;

import model.Project;
import DAO.BudgetService;

import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

import edu.scu.frugal.model.Budget;

public class BudgetAction extends ActionSupport implements ModelDriven<Budget> {

	private static final long serialVersionUID = -425246257416832377L;
	Budget budget = new Budget();
	String action;
	String projectName;

	@Override
	public String execute() throws Exception {
		Map<String, Object> session = ActionContext.getContext().getSession();
		Project p = (Project) (session.get("project"));
		System.out.println("passed in name: " + projectName);
		if (p != null) {
			BudgetService service = BudgetService.getInstance();
			if ("edit".equals(action)) {

			} else if ("remove".equals(action)) {
				service.delete(budget.getId());
				System.out.println("deleted budget id: " + budget.getId());
			} else {
				// add
				budget.setId(BudgetService.getNextId());
				service.addBudget(budget);
			}
		}
		return Action.SUCCESS;
	}

	public String getAction() {
		return action;
	}

	public void setAction(String action) {
		this.action = action;
	}

	public String getProjectName() {
		return projectName;
	}

	public void setProjectName(String projectName) {
		this.projectName = projectName;
	}

	@Override
	public Budget getModel() {
		return this.budget;
	}

	public Budget getBudget() {
		return budget;
	}

	public void setBudget(Budget budget) {
		this.budget = budget;
	}
}
