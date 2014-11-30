package model;

import java.io.Serializable;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.Lob;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.PrimaryKeyJoinColumn;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

/**
 * The persistent class for the Task database table.
 * 
 */
@Entity(name = "Task")
@NamedQueries({ @NamedQuery(name = "Task.getMaxID", query = "Select max(t.idTask) as maxid from Task t"),
		@NamedQuery(name = "Task.findAll", query = "SELECT t FROM Task t") })
public class Task implements Serializable {
	private static final long serialVersionUID = 1L;

	@Column(name = "IdTask")
	@Id
	private int idTask;

	@Lob
	@Column(name = "Description")
	private String description;

	@Column(name = "EndDate")
	@Temporal(TemporalType.DATE)
	private Date endDate;

	@Column(name = "IdProject")
	private int idProject;

	@Column(name = "StartDate")
	@Temporal(TemporalType.DATE)
	private Date startDate;

	public Project getProjectintask() {
		return projectintask;
	}

	public void setProjectintask(Project projectintask) {
		this.projectintask = projectintask;
	}

	@Column(name = "Status")
	private String status;

	@Column(name = "UserName")
	private String userName;

	@ManyToOne(cascade = {CascadeType.PERSIST, CascadeType.MERGE, CascadeType.REFRESH})
	@PrimaryKeyJoinColumn(name = "UserName")
	private User userintask;

	@ManyToOne(cascade = {CascadeType.PERSIST, CascadeType.MERGE, CascadeType.REFRESH})
	@PrimaryKeyJoinColumn(name = "IdProject")
	private Project projectintask;

	public User getUserintask() {
		return userintask;
	}

	public String getUserFullname() {
		return this.userintask.getFirstName() + "," + this.userintask.getLastName();
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

	public String getEndDateStr() {
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
		String dateString = formatter.format(this.endDate);
		return dateString;
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

	public String getStartDateStr() {
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
		String dateString = formatter.format(this.startDate);
		return dateString;
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

		return "Task[idTask:" + getIdTask() + " username:" + getUserName() + " Description:" + getDescription()
				+ " status:" + getStatus() + " Idproject:" + getIdProject() + " ]";
	}

	@Override
	public int hashCode() {

		return (new Integer(idTask)).hashCode();
	}

	@Override
	public boolean equals(Object object) {
		if (object instanceof Task) {
			if (idTask == ((Task) object).idTask)
				return true;
		}
		return false;

	}

}