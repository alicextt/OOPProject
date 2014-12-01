package DAO;

import java.util.List;
import java.util.Set;

import model.Communication;
import model.Project;
import model.User;

public interface UserService {
	List<User> readUser(String name);
	boolean addUser(User u);
	void updateUser(User u);
	void deleteUser(User u);
	void updateCommunication(Communication c, User u);
	Communication newCommunication();
	// get username
	List<String>  getallUser();
	
}
