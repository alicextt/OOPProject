package DAO;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.EntityTransaction;
import javax.persistence.Persistence;
import javax.persistence.TypedQuery;

import model.User;

public class UserServiceImp implements UserService {
	protected static EntityManagerFactory emf;

	public UserServiceImp() {
		emf = Persistence.createEntityManagerFactory("PersistenceUnit");
	}

	@Override
	public List<User> readUser(String name) {

		EntityManager em = emf.createEntityManager();
		
		// typerdquery is type safer
		TypedQuery<User> querybyusername = em
				.createNamedQuery("User.findByusername", User.class);
		querybyusername.setParameter("userName", name);

		List<User> result = querybyusername.getResultList();
		em.close();
		// System.out.println("in the service implementation");
		return result;
	}

	@Override
	public boolean addUser(User u) {

		List<User> result = readUser(u.getUserName());
		
		if (result.isEmpty()) {
			EntityManager em = emf.createEntityManager();
			EntityTransaction transaction = em.getTransaction();
			transaction.begin();
			em.persist(u);
			transaction.commit();
			em.close();
			return true;
		} else
			return false;

	}

	@Override
	public void updateUser(User u) {
		// TODO Auto-generated method stub

	}

	@Override
	public void deleteUser(User u) {
		// TODO Auto-generated method stub

	}

	@Override
	public List<String> getallUser() {
	EntityManager em = emf.createEntityManager();
		
		// typerdquery is type safer
		TypedQuery<User> query = em
				.createNamedQuery("User.findAll", User.class);

		List<User> result = query.getResultList();
		
		em.close();
		
		List<String> usrlist = new ArrayList<String>();
		for(User u: result){
			usrlist.add(u.getUserName());
		}
		
		return usrlist;
	}

}
