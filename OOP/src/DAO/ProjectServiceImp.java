package DAO;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.persistence.TypedQuery;

import model.*;

public class ProjectServiceImp implements ProjectService {

	protected static EntityManagerFactory emf;
	
	public ProjectServiceImp() {
		emf = Persistence.createEntityManagerFactory("PersistenceUnit");
	}

	@Override
	public Project findbyname(String name) {
		EntityManager em=emf.createEntityManager();
		TypedQuery<Project> query=em.createQuery("select p from Project p where p.name=:name", Project.class);
		query.setParameter("name", name);
		Project result=query.getSingleResult();
		return result;
	}
	

}
