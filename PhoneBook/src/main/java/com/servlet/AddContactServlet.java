package com.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.conn.DbConnect;
import com.dao.ContactDAO;
import com.entity.Contact;

@WebServlet("/addContact")
public class AddContactServlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("reached addcontact");
		int userid = Integer.parseInt(req.getParameter("usersid"));
		String name = req.getParameter("Name");
		String email = req.getParameter("Email");
		String phno = req.getParameter("phno");
		String about = req.getParameter("about");
		
		Contact c = new Contact(name, email, phno, about, userid);
		ContactDAO cd = new ContactDAO(DbConnect.getConn());
		boolean f = cd.saveContact(c);
		HttpSession session = req.getSession();
		
		if(f) {
			session.setAttribute("succMssg", "Contact Saved....");
			resp.sendRedirect("AddContact.jsp");
		}else {
			session.setAttribute("failMssg", "Something Went Wrong on Server...");
			resp.sendRedirect("AddContact.jsp");
		}
		
	}
	
	

}
