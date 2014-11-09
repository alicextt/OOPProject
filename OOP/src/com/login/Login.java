package com.login;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Collection;
import java.util.List;

import javax.management.Query;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.db.User;

/**
 * Servlet implementation class Login
 */
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public Login() {
		super();
		// TODO Auto-generated constructor stub
	}


	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		System.out.println("We are in the HttpServlet dopost method");
		String username = "user";
		String password = "root";
		String un = req.getParameter("username");
		String pw = req.getParameter("password");
		EntityManagerFactory emf=Persistence.createEntityManagerFactory("User");
		EntityManager em=emf.createEntityManager();
		javax.persistence.Query querybyusername=em.createNamedQuery("User.findByusername");
		querybyusername.setParameter("username", un);
		List<User> result=querybyusername.getResultList();
		for(User p:result){
			System.out.println(p.getPassword());
		}
		
		em.close();
		emf.close();
		String msg = "";
		if (pw.equals(result.get(0).getPassword())) {
			msg = "Hello " + un + "! Your login is successful";
		} else {
			msg = "Sorry " + un + "! Your login is incorrect.";
		}

		resp.setContentType("text/html");
		PrintWriter out = resp.getWriter();
		out.println("<font size='6' color=red >" + msg + "</font>");
	};

	

}
