package DAO;

import java.util.List;

import model.*;

public interface ProjectService {
	Project findbyname(String name);
	// User is the creater of the project, at least one user need to be added
	boolean addProject(Project p, User u);
	
	void addUsertoProject(Project p, User u);
	void updateproject(Project p);
	void deleteproject();
	void deleteUser(Project p, User u);
	void deleteTask(Project p, Task t);
}
