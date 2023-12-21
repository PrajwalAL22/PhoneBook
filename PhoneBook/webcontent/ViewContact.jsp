<%@page import="com.entity.Contact"%>
<%@page import="java.util.List"%>
<%@page import="com.conn.DbConnect"%>
<%@page import="com.dao.ContactDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ include file="FramWorks/BootStrap.jsp" %>
<%@ include file="FramWorks/NavBar.jsp" %>
<title>View Contacts</title>
<style type="text/css">
.back-img{
	background: url("Img/ph.jpg");
	width: 100%;
	height: 86vh;
	background-repeat: no-repeat; 
	background-size: cover;
}
.crd-ho:hover{
	color: #0aacd1;
}
</style>
</head>
<body>
	<% User u1 = (User)session.getAttribute("user");
		
		if(u1 == null){
			session.setAttribute("Loginmssg", "Please Log In First..");
			response.sendRedirect("LogIN.jsp");
		}
	
	%>

	<div class="container-fluid back-img text-light">
	<% String succMssg = (String)session.getAttribute("succMssg");
		if(succMssg != null){
			%><div class="alert alert-success" role="alert"><%=succMssg %></div> 
		<%
			session.removeAttribute("succMssg");
		}
		%>	
		<% String failMssg = (String)session.getAttribute("failMssg");
		if(failMssg != null){
			%><div class="alert alert-danger" role="alert"><%=failMssg %></div><%
					session.removeAttribute("failMssg");
		}
		%>
		<div class = "row">	
			<%
				if(u1!=null){
				ContactDAO dao = new ContactDAO(DbConnect.getConn()); 
				List<Contact> contacts =  dao.getAllContacts(u1.getId());
				
				for(Contact c:contacts){ %>
				<div class = "col-md-3 p-3">
				<div class="card bg-dark crd-ho">
					<div class="card-body">
						<h3>Name:<b> <%=c.getName() %></b></h3>
						<h5>Ph no.:<b> <%=c.getPhone() %></b></h5>
						<h5>Email: <%=c.getEmailaddress() %></h5>
						<h5>About: <%=c.getAbout() %></h5>
						<div class="text-light" style="float:right;">
							<a href="EditContact.jsp?cid=<%=c.getId() %>" class="btn btn-info btn-sm text-light" >Edit</a>
							<a href="delete?cid=<%=c.getId() %>" class="btn btn-danger btn-sm text-light" >Delete</a>
						</div>
					</div>
				</div>
				</div>	
				<% }
				}
			%>		
		</div>	
	</div>		
<%@ include file="FramWorks/footer.jsp" %></body>
</html>