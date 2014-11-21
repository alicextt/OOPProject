package model;

import java.io.Serializable;

import javax.persistence.*;

import java.util.Date;


/**
 * The persistent class for the Task database table.
 * 
 */
@Entity(name="Task")
@NamedQuery(name="Task.findAll", query="SELECT t FROM Task t")
public class Task implements Serializable {
	private static final long serialVersionUID = 1L;

	@Column(name="IdTask")
	@Id
	private int idTask;

	@Lob
	@Column(name="Description")
	private String description;

	@Column(name="EndDate")
	@Temporal(TemporalType.DATE)
	private Date endDate;
	
	@Column(name="IdProject")
	private int idProject;

	@Column(name="StartDate")
	@Temporal(TemporalType.DATE)
	private Date startDate;

	public Project getProjectintask() {
		return projectintask;
	}

	public void setProjectintask(Project projectintask) {
		this.projectintask = projectintask;
	}

	@Column(name="Status")
	private String status;

	@Column(name="UserName")
	private String userName;
	
	@ManyToOne(cascade=CascadeType.ALL)
	@PrimaryKeyJoinColumn(name="UserName")
	private User userintask;
	
	@ManyToOne(cascade=CascadeType.ALL)
	@PrimaryKeyJoinColumn(name="IdProject")
	private Project projectintask;

	public User getUserintask() {
		return userintask;
	}

	public void setUserintask(User userintask) {
		this.userintask = userintask;
	}

	public Task() {
	}

	public int getIdTask() {
		return this.idTask;
	}

	public void setIdTask(int idTask) {
		this.idTask = idTask;
	}

	public String getDescription() {
		return this.description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public Date getEndDate() {
		return this.endDate;
	}

	public void setEndDate(Date endDate) {
		this.endDate = endDate;
	}

	public int getIdProject() {
		return this.idProject;
	}

	public void setIdProject(int idProject) {
		this.idProject = idProject;
	}

	public Date getStartDate() {
		return this.startDate;
	}

	public void setStartDate(Date startDate) {
		this.startDate = startDate;
	}

	public String getStatus() {
		return this.status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getUserName() {
		return this.userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String toString() {
		
		return "Task[idTask:"+getIdTask()+" username:" + getUserName() + " Description:"
				+ getDescription() + " status:" + getStatus()+" Idproject:"+getIdProject()+" ]";
	}

	@Override
	public int hashCode() {
		
		return (new Integer(idTask)).hashCode();
	}

	@Override
	public boolean equals(Object object) {
		if (!(object instanceof Task)) {
			if (idTask == ((Task) object).idTask)
				return true;
		}
		return false;

	}

	
}