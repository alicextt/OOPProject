package DAO;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.Persistence;
import javax.persistence.TypedQuery;

import edu.scu.frugal.model.Budget;

public class BudgetService {

	private static EntityManager manager = Persistence.createEntityManagerFactory("PersistenceUnit")
			.createEntityManager();
	private static BudgetService instance = new BudgetService();

	private BudgetService() {
	}

	public static BudgetService getInstance() {
		return instance;
	}

	private static int id = 500;

	static {
		// get max id from DB
		Integer maxId = (Integer) manager.createQuery("SELECT max(b.id) FROM Budget b").getSingleResult();
		if (maxId != null) {
			id = Math.max(id, maxId);
		}
		id++;
	}

	public static synchronized int getNextId() {
		return id++;
	}

	public List<Budget> listBudgets(int projectId) {
		StringBuilder queryStr = new StringBuilder("select b from Budget b where b.idProject = :id");

		TypedQuery<Budget> query = manager.createQuery(queryStr.toString(), Budget.class);
		query.setParameter("id", projectId);

		List<Budget> result = query.getResultList();
		System.out.println("query budget result set: " + result.size());
		return result;
	}

	public Budget addBudget(Budget budget) {
		manager.getTransaction().begin();
		manager.persist(budget);
		manager.getTransaction().commit();
		return budget;
	}

	public Budget updateBudget(Budget updatedBudget) {
		Budget budget = manager.find(Budget.class, updatedBudget.getId());
		if (budget != null) {
			manager.getTransaction().begin();
			manager.merge(budget);
			manager.getTransaction().commit();
		}
		return updatedBudget;
	}

	public void delete(int id) {
		Budget budget = manager.find(Budget.class, id);
		if (budget != null) {
			manager.getTransaction().begin();
			manager.remove(budget);
			manager.getTransaction().commit();
		}
	}

}
