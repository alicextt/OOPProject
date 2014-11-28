package DAO;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.Persistence;
import javax.persistence.TypedQuery;

import model.Project;
import model.Task;

import com.google.common.base.Strings;

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
			if (!Strings.isNullOrEmpty(params.getName())) {
				queryStr.append(" and p.name like :name");
			}
			if (!Strings.isNullOrEmpty(params.getStartDateStr())) {
				queryStr.append(" and p.startDate >= :sdate");
			}
			if (!Strings.isNullOrEmpty(params.getEndDateStr())) {
				queryStr.append(" and p.endDate <= :ddate");
			}
		}
		TypedQuery<Project> query = manager.createQuery(queryStr.toString(), Project.class);
		if (params != null) {
			if (!Strings.isNullOrEmpty(params.getName())) {
				query.setParameter("name", "%" + params.getName() + "%");
			}
			if (!Strings.isNullOrEmpty(params.getStartDateStr())) {
				query.setParameter("sdate", params.getStartDate());
			}
			if (!Strings.isNullOrEmpty(params.getEndDateStr())) {
				query.setParameter("ddate", params.getEndDate());
			}
		}
		List<Project> result = query.getResultList();
		System.out.println("query project result set: " + result.size());
		return result;
	}

	public List<Task> findTasks(QueryParams params) {
		StringBuilder queryStr = new StringBuilder("select t from Task t, user u where t.userName=u.userName");
		if (params != null) {
			if (!Strings.isNullOrEmpty(params.getDesc())) {
				queryStr.append(" and t.description like :desc");
			}
			if (!Strings.isNullOrEmpty(params.getStartDateStr())) {
				queryStr.append(" and t.startDate >= :sdate");
			}
			if (!Strings.isNullOrEmpty(params.getEndDateStr())) {
				queryStr.append(" and t.endDate <= :ddate");
			}
			if (!Strings.isNullOrEmpty(params.getUser())) {
				queryStr.append(" and (t.userName like :user or u.firstName like :user or u.lastName like :user)");
			}
		}
		TypedQuery<Task> query = manager.createQuery(queryStr.toString(), Task.class);
		if (params != null) {
			if (!Strings.isNullOrEmpty(params.getDesc())) {
				query.setParameter("desc", "%" + params.getDesc() + "%");
			}
			if (!Strings.isNullOrEmpty(params.getStartDateStr())) {
				query.setParameter("sdate", params.getStartDate());
			}
			if (!Strings.isNullOrEmpty(params.getEndDateStr())) {
				query.setParameter("ddate", params.getEndDate());
			}
			if (!Strings.isNullOrEmpty(params.getUser())) {
				query.setParameter("user", "%" + params.getUser() + "%");
			}
		}
		List<Task> result = query.getResultList();
		System.out.println("query task result set: " + result.size());
		return result;
	}
}
