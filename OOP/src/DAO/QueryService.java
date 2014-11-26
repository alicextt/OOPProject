package DAO;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.Persistence;
import javax.persistence.TypedQuery;

import model.Project;
import edu.scu.frugal.action.QueryParams;

public class QueryService {

	private static EntityManager manager = Persistence.createEntityManagerFactory("PersistenceUnit")
			.createEntityManager();
	private static QueryService instance = new QueryService();

	private QueryService() {
	}

	public static QueryService getInstance() {
		return instance;
	}

	public List<Project> findProjects(QueryParams params) {
		StringBuilder queryStr = new StringBuilder("select p from Project p where 1=1");
		if (params != null) {
			if (params.getName() != null) {
				queryStr.append(" and p.name like :name");
			}
			if (params.getStartDate() != null) {
				queryStr.append(" and p.startDate like :sdate");
			}
			if (params.getEndDate() != null) {
				queryStr.append(" and p.endDate like :ddate");
			}
		}
		TypedQuery<Project> query = manager.createQuery(queryStr.toString(), Project.class);
		if (params != null) {
			if (params.getName() != null) {
				query.setParameter("name", params.getName());
			}
			if (params.getStartDate() != null) {
				query.setParameter("sdate", params.getStartDate());
			}
			if (params.getEndDate() != null) {
				query.setParameter("ddate", params.getEndDate());
			}
		}
		List<Project> result = query.getResultList();
		System.out.println("result: " + result.size());
		return result;
	}

}
