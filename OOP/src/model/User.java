package model;

import java.io.Serializable;
import java.util.List;
import java.util.Set;

import javax.persistence.*;

/**
 * The persistent class for the User database table.
 * 
 */
@Entity(name = "user")
@Table(name = "User")
@NamedQueries({
		@NamedQuery(name = "User.findAll", query = "SELECT u FROM user u"),
		@NamedQuery(name = "User.findByusername", query = "SELECT u FROM user u where u.userName=:userName")

})
public class User implements Serializable {
	private static final long serialVersionUID = 1L;

	@Column(name = "Email")
	private String email;

	@Column(name = "FirstName")
	private String firstName;

	@Column(name = "LastName")
	private String lastName;

	@Column(name = "PassWord")
	private String passWord;

	@Id
	@GeneratedValue(strategy = GenerationType.TABLE)
	@Column(name = "UserName")
	private String userName;

	@ManyToMany(cascade = CascadeType.ALL, fetch = FetchType.LAZY)
	@JoinTable(name = "Team", joinColumns = @JoinColumn(name = "UserName"), inverseJoinColumns = @JoinColumn(name = "IdProject"))
	private Set<Project> projects;
	
	@ManyToMany(cascade = CascadeType.ALL, fetch = FetchType.LAZY)
	@JoinTable(name = "communicationjoinuser", joinColumns = @JoinColumn(name = "UserName"), inverseJoinColumns = @JoinColumn(name = "IdCommunication"))
	private Set<Communication> communications;

	public Set<Communication> getCommunications() {
		return communications;
	}

	public void setCommunications(Set<Communication> communications) {
		this.communications = communications;
	}

	@OneToMany(cascade=CascadeType.ALL, mappedBy="userintask")
	private Set<Task> tasks;
	
	@OneToOne(cascade=CascadeType.ALL)
	@JoinColumn(name="userName", insertable = false, updatable = false)
	private Student student;
	
	@OneToOne(cascade=CascadeType.ALL)
	@JoinColumn(name="userName", insertable = false, updatable = false)
	private Faculty faculty;
	
	@OneToOne(cascade=CascadeType.ALL)
	@JoinColumn(name="userName", insertable = false, updatable = false)
	private Partener partener;
	
	public Partener getPartener() {
		return partener;
	}

	public void setPartener(Partener partener) {
		this.partener = partener;
	}

	public Faculty getFaculty() {
		return faculty;
	}

	public void setFaculty(Faculty faculty) {
		this.faculty = faculty;
	}

	public Student getStudent() {
		return student;
	}

	public void setStudent(Student student) {
		this.student = student;
	}

	public Set<Task> getTasks() {
		return tasks;
	}

	public void setTasks(Set<Task> tasks) {
		this.tasks = tasks;
	}

	public Set<Project> getProjects() {
		return projects;
	}

	public void setProjects(Set<Project> projects) {
		this.projects = projects;
	}

	public User() {
	}

	public String toString() {
		int i=projects.size();
		String projectslist=" ";
		for(Project p: projects){
			projectslist+=p.getDescription()+"  ";
		}
		
		return "First Name: " + getFirstName() + " Last Name:  "
				+ getLastName() + " Email:      " + getEmail()+" Projects: "+projectslist;
	}

	@Override
	public int hashCode() {
		int hash = 0;
		hash += (userName != null ? userName.hashCode() : 0);
		return hash;
	}

	@Override
	public boolean equals(Object object) {
		if (!(object instanceof User)) {
			return false;
		}
		User other = (User) object;
		if ((this.userName == null && other.userName != null)
				|| (this.userName != null && !this.userName
						.equals(other.userName))) {
			return false;
		}
		return true;
	}

	public String getEmail() {
		return this.email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getFirstName() {
		return this.firstName;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	public String getLastName() {
		return this.lastName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	public String getPassWord() {
		return this.passWord;
	}

	public void setPassWord(String passWord) {
		this.passWord = passWord;
	}

	public String getUserName() {
		return this.userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

//	public static void main(String[] args){
//		EntityManagerFactory emf = Persistence.createEntityManagerFactory("PersistenceUnit");
//		EntityManager em = emf.createEntityManager();
////		TypedQuery<Object []> query=em.createQuery("select u.projects from user u join u.projects p ", Object [].class);
////		System.out.println(query);
////		List<Object[]> result=query.getResultList();
////		for (Object[] data : result)
////			System.out.println("user name =" + data[0] + " project name =  "
////					+ data[1]);
//		TypedQuery<User> querybyusername = em
//				.createNamedQuery("User.findByusername", User.class);
//		querybyusername.setParameter("userName", "admin");
//		List<User> result = querybyusername.getResultList();
//		Set<Task> s=result.get(0).getTasks();
//		for(Task ss:s){
//			System.out.println(ss);
//		}
//		
//	}
	
}