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

@WebServlet("/delete")
public class DeleteContact extends HttpServlet {
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		int cid = Integer.parseInt(req.getParameter("cid"));
		
		ContactDAO dao = new ContactDAO(DbConnect.getConn());
		
		boolean f = dao.deleteContact(cid);
		
		if(f) {
			HttpSession session= req.getSession();
			session.setAttribute("succMssg", "Contact deleted Successfully");
			resp.sendRedirect("ViewContact.jsp");
		}else {
			HttpSession session = req.getSession();
			session.setAttribute("failMssg", "Something Went Wrong on server");
			resp.sendRedirect("ViewContact.jsp");
		}
		
	}

}
