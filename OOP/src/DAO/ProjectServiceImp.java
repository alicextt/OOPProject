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
		emf = Persistence.createEntityManagerFactory("Project");
	}
	

}
