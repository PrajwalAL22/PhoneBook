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

@WebServlet("/editContact")
public class EditContactServelt extends HttpServlet {
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		int cid = Integer.parseInt(req.getParameter("cid"));
		String name = req.getParameter("Name");
		String email = req.getParameter("Email");
		String phno = req.getParameter("phno");
		String about = req.getParameter("about");
		
		Contact c = new Contact();
		c.setId(cid);
		c.setName(name);
		c.setEmailaddress(email);
		c.setPhone(phno);
		c.setAbout(about);
		
		ContactDAO dao = new ContactDAO(DbConnect.getConn());
		boolean f = dao.updateContact(c);
		
		HttpSession session = req.getSession();
		
		if(f) {
			session.setAttribute("succMssg", "Contact Updated....");
			resp.sendRedirect("ViewContact.jsp");
		}else {
			session.setAttribute("failMssg", "Something Went Wrong on Server...");
			resp.sendRedirect("EditContact.jsp?cid=" + cid);
		}
		
	}

}
