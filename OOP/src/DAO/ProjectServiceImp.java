package DAO;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Set;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.EntityTransaction;
import javax.persistence.Persistence;
import javax.persistence.TypedQuery;
import javax.sql.rowset.spi.TransactionalWriter;

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
		try{
		Project result=query.getSingleResult();
		return result;
		}catch(javax.persistence.NoResultException e){
			System.out.println("No "+ name +" in database");
		};
		
		return null;
	}

	// better to merge the owning side, both side has to be added
	@Override
	public boolean addProject(Project newproject, User creater) {
		
		Project result= findbyname(newproject.getName());
		
		if (result==null) {
			newproject.setIdProject(getMaxProjectId());
			System.out.println("id:"+newproject.getIdProject());
			Set<Project> set=creater.getProjects();
			set.add(newproject);
			creater.setProjects(set);
			EntityManager em=emf.createEntityManager();
			EntityTransaction transaction = em.getTransaction();
			transaction.begin();
			em.merge(creater);
			transaction.commit();
			em.close();
			return true;
		} else
			return false;
				
	}

	 private Integer getMaxProjectId() {
		 EntityManager em2=emf.createEntityManager();
		 Integer maxId = (Integer) em2.createNamedQuery("Project.getMaxID").getSingleResult();
		 return maxId + 1;
		 }

	@Override
	public void updateproject() {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void deleteproject() {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void addUsertoProject(Project p, User u) {
		
		Set<User> set1=p.getUsers();
		set1.add(u);
		p.setUsers(set1);
		Set<Project> set2=u.getProjects();
		set2.add(p);
		u.setProjects(set2);
		EntityManager em=emf.createEntityManager();
		EntityTransaction transaction = em.getTransaction();
		transaction.begin();
		em.merge(u);
		transaction.commit();
		em.close();
		
	}

}
