package DAO;

import java.util.Set;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.EntityTransaction;
import javax.persistence.Persistence;

import model.Project;
import model.Task;
import model.User;

public class TaskServiceImp implements TaskService{
	protected static EntityManagerFactory emf;
	
	
	public TaskServiceImp() {
	
		emf = Persistence.createEntityManagerFactory("PersistenceUnit");
	}

	
	
	@Override
	//assigned user must be in the project p
	public void addTask(Task t, Project p) {
		
		// add p info to t
		t.setProjectintask(p);
		t.setIdProject(p.getIdProject());
			
		//add u info to t
		t.setIdTask(getMaxTaskId());
		UserService us=new UserServiceImp();
		User assigned=us.readUser(t.getUserName()).get(0);
		t.setUserintask(assigned);
		
	//add t to p
		Set<Task> set=p.getTasks();
		set.add(t);
		p.setTasks(set);
		
		// add t to u
		Set<Task> userset=assigned.getTasks();
		userset.add(t);
		assigned.setTasks(userset);
		Set<Project> userproject=assigned.getProjects();
		
		
		EntityManager em=emf.createEntityManager();
		EntityTransaction transaction = em.getTransaction();
		transaction.begin();
		em.merge(p);
		em.merge(assigned);
		em.merge(t);
		transaction.commit();
		em.close();
		
	}
	
	 private Integer getMaxTaskId() {
		 EntityManager em2=emf.createEntityManager();
		 Integer maxId = (Integer) em2.createNamedQuery("Task.getMaxID").getSingleResult();
		 return maxId + 1;
		 }

}
