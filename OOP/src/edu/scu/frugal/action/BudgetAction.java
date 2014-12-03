package edu.scu.frugal.action;

import DAO.BudgetService;

import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

import edu.scu.frugal.model.Budget;

public class BudgetAction extends ActionSupport implements ModelDriven<Budget> {

	private static final long serialVersionUID = -425246257416832377L;
	Budget budget;
	String projectName;

	public String doEdit() {
		if (budget != null && budget.getId() != 0) {
			BudgetService service = BudgetService.getInstance();
			budget = service.find(budget.getId());
		}
		System.out.println("edit budget: " + budget);
		return Action.INPUT;
	}

	public String doDelete() {
		if (budget != null && budget.getId() != 0) {
			BudgetService service = BudgetService.getInstance();
			service.delete(budget.getId());
		}
		return Action.SUCCESS;
	}

	public String doSave() {
		BudgetService service = BudgetService.getInstance();
		System.out.println("saving budget: " + budget);
		if (budget.getId() == 0) {
			service.addBudget(budget);
		} else {
			service.updateBudget(budget);
		}
		return Action.SUCCESS;
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
