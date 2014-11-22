package model;

import java.io.Serializable;

import javax.persistence.*;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Set;

/**
 * The persistent class for the Project database table.
 * 
 */
@Entity(name = "Project")
@Table(name="Project")
@NamedQueries({ 
	@NamedQuery(name = "Project.getMaxID", query = "Select max(p.idProject) as maxid from Project p"),
@NamedQuery(name = "Project.findAll", query = "SELECT p FROM Project p")})
public class Project implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@Column(name="IdProject")
	@GeneratedValue(strategy=GenerationType.AUTO)
	private int idProject;

	@Lob
	@Column(name="Description")
	private String description;

	@Temporal(TemporalType.DATE)
	@Column(name="EndDate")
	private Date endDate;

	@Temporal(TemporalType.DATE)
	@Column(name="LastModifiedDate")
	private Date lastModifiedDate;

	@Column(name="Name")
	private String name;

	@Lob
	@Column(name="ProjectOutcome")
	private String projectOutcome;

	@Column(nullable = true, name="ProjectStatus")
	private String projectStatus;

	public Set<User> getUsers() {
		return users;
	}

	public void setUsers(Set<User> users) {
		this.users = users;
	}

	@Temporal(TemporalType.DATE)
	@Column(name="StartDate")
	private Date startDate;

	@ManyToMany(cascade = CascadeType.ALL, mappedBy = "projects")
	private Set<User> users;

	@OneToMany(cascade=CascadeType.ALL, mappedBy="projectintask")
	private Set<Task> tasks;
	

	public Set<Task> getTasks() {
		return tasks;
	}

	public void setTasks(Set<Task> tasks) {
		this.tasks = tasks;
	}

	public Project() {
	}

	public int getIdProject() {
		return this.idProject;
	}

	public void setIdProject(int idProject) {
		this.idProject = idProject;
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

	public Date getLastModifiedDate() {
		return this.lastModifiedDate;
	}

	public void setLastModifiedDate(Date lastModifiedDate) {
		this.lastModifiedDate = lastModifiedDate;
	}

	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getProjectOutcome() {
		return this.projectOutcome;
	}

	public void setProjectOutcome(String projectOutcome) {
		this.projectOutcome = projectOutcome;
	}

	public String getProjectStatus() {
		return this.projectStatus;
	}

	public void setProjectStatus(String projectStatus) {
		this.projectStatus = projectStatus;
	}

	public Date getStartDate() {
		return this.startDate;
	}

	// a helper to change date to simple format
	public static String dateToStr(java.util.Date dateDate) {  
	    SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");  
	    String dateString = formatter.format(dateDate);  
	    return dateString;  
	}  
	
	public void setStartDate(Date startDate) {
		this.startDate = startDate;
	}

	public String toString() {
		return "Project[idProject: " + getIdProject() + " description:  "
				+ getDescription() + " name:      " + getName()
				+ " projectOutcome:" + getProjectOutcome() + "  Status:"
				+ getProjectStatus();
	}

	@Override
	public int hashCode() {
		return (new Integer(idProject)).hashCode();
	}

	@Override
	public boolean equals(Object object) {
		if (!(object instanceof Project)) {
			if (idProject == ((Project) object).idProject)
				return true;
		}
		return false;

	}
	
//	public static void main(String[] args){
//	EntityManagerFactory emf = Persistence.createEntityManagerFactory("PersistenceUnit");
//	EntityManager em = emf.createEntityManager();
////	TypedQuery<Object []> query=em.createQuery("select u.projects from user u join u.projects p ", Object [].class);
////	System.out.println(query);
////	List<Object[]> result=query.getResultList();
////	for (Object[] data : result)
////		System.out.println("user name =" + data[0] + " project name =  "
////				+ data[1]);
//	Project newproject=new Project();
//	newproject.setIdProject(203);
//	newproject.setDescription("dfwef");
//	newproject.setName("mobile");
//	newproject.setStartDate(new Date());
//	EntityTransaction transaction = em.getTransaction();
//	transaction.begin();
//	em.persist(newproject);
//	transaction.commit();
//	em.close();	
//	
//	}

}