<%@page import="com.entity.Contact"%>
<%@page import="com.conn.DbConnect"%>
<%@page import="com.dao.ContactDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Edit Contacts</title>
<%@ include file="FramWorks/BootStrap.jsp" %>
<%@ include file="FramWorks/NavBar.jsp" %>
<style type="text/css">
.back-img{
	background: url("Img/ph.jpg");
	width: 100%;
	height: 86vh;
	background-repeat: no-repeat; 
	background-size: cover;
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
	<div class="row pt-5">
	<div class="card mx-auto bg-dark" style=" width: 40rem;">
	<div class="card-body bg-dark">
	
	<h2 class="text-center text-light"> Edit Contact </h2>
	<% String succMssg = (String)session.getAttribute("succMssg");
		if(succMssg != null){
			%><h3 class="text-center text-success"><%=succMssg %></h3>   <%
			session.removeAttribute("succMssg");
		}
		%>
		<% String failMssg = (String)session.getAttribute("failMssg");
		if(failMssg != null){
			%><h3 class="text-center text-danger"><%=failMssg %></h3>   <%
					session.removeAttribute("failMssg");
		}
		%>
	
	<form action="editContact" method = "post">
	<% 
		int cid = Integer.parseInt(request.getParameter("cid"));
		ContactDAO dao = new ContactDAO(DbConnect.getConn());
		Contact c = dao.getContactById(cid);
	%> 	

	<div class="mb-3 text-light">
	<input type="hidden" name = "cid" value = "<%=cid%>"> 
    <label for="Name" class="form-label">Full Name</label>
    <input type="text" name="Name" class="form-control" id="Name" value="<%=c.getName()%>">
  </div>
	
  <div class="mb-3 text-light">
    <label for="exampleInputEmail1" class="form-label">Email address</label>
    <input type="email" name="Email" class="form-control" id="exampleInputEmail1" value="<%=c.getEmailaddress()%>">
  </div>
  <div class="mb-3 text-light">
    <label for="phoneNumber" class="form-label">Phone Number</label>
    <input type="text" name="phno" class="form-control" id="phoneNumber" value="<%=c.getPhone()%>">
  </div>
    <div class="mb-3 text-light">
    <label class="form-label" for="Aboutsection">Additional Information</label>
    <textarea class="form-control" name="about" id="Aboutsection" rows="4" ><%=c.getAbout() %></textarea>
  </div>
 <div class="text-center mt-2"> <button type="submit" class="btn btn-light">Update Contact</button></div>
</form>
	
	</div>
	</div>
	</div>
	</div>
<%@ include file="FramWorks/footer.jsp" %></body>
</body>
</html>