package DAO;

import java.util.List;

import model.User;

public interface UserService {
	List<User> readUser(String name);
	boolean addUser(User u);
	void updateUser(User u);
	void deleteUser(User u);
	
}
