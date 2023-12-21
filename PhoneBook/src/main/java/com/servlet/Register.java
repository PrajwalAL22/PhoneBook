package com.servlet;

import java.io.IOException;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.conn.DbConnect;
import com.dao.UserDAO;
import com.entity.User;


@WebServlet("/register")
public class Register extends HttpServlet{
	
	public void doPost(HttpServletRequest req, HttpServletResponse res) throws IOException {
		
		String name = req.getParameter("name");
		
		String email = req.getParameter("email");
		
		String password = req.getParameter("password");
		
		User u = new User(name,email,password);
		
		UserDAO dao = new UserDAO(DbConnect.getConn());
		
		Boolean f = dao.userRegister(u);
		
		HttpSession session = req.getSession();
		
		if(f) {
			//System.out.println("User Registered Sucessfully ");
			session.setAttribute("succmsg", "User Registered Sucessfully");
			res.sendRedirect("Register.jsp");
			
		}
		else {
			//System.out.println("Something went wrong");
			session.setAttribute("errormsg", "Something went wrong");
			res.sendRedirect("Register.jsp");
		}
		
		
	}

}
