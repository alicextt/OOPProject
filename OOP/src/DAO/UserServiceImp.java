package DAO;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

import model.User;

public class UserServiceImp implements UserService {
 protected static EntityManagerFactory emf;
	public UserServiceImp() {
		 emf = Persistence
				.createEntityManagerFactory("User");
		}
	
	@Override
	public List<User> readUser(String name) {
		
		EntityManager em=emf.createEntityManager();
		javax.persistence.Query querybyusername = em
				.createNamedQuery("User.findByusername");
		querybyusername.setParameter("userName", name);
		
		List<User> result = querybyusername.getResultList();
		em.close();
//		System.out.println("in the service implementation");
		return result;
	}

	@Override
	public void addUser(User u) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void updateUser(User u) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void deleteUser(User u) {
		// TODO Auto-generated method stub
		
	}

}