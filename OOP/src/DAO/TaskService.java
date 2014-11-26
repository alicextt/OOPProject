package DAO;

import model.*;

public interface TaskService {

	public void addTask(Task t, Project p);
	
	public Task findTask(int taskid);
	
	public void updateTask(Task t);
}
