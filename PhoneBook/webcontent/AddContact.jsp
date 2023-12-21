<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ include file="FramWorks/BootStrap.jsp" %>
<%@ include file="FramWorks/NavBar.jsp" %>
<title>PhoneBook</title>
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

	<div class="container-fluid back-img">
	<div class="row pt-5">
	<div class="card mx-auto bg-dark" style=" width: 40rem;">
	<div class="card-body bg-dark">
	
	<h2 class="text-center text-light"> Add Contact </h2>
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
	
	<form action="addContact" method = "post">
	<% if(u1 != null){
			%> <input type="hidden" name = "usersid" value="<%=u1.getId()%>">
			<% } %> 	

	<div class="mb-3 text-light">
    <label for="Name" class="form-label">Full Name</label>
    <input type="text" name="Name" class="form-control" id="Name">
  </div>
	
  <div class="mb-3 text-light">
    <label for="exampleInputEmail1" class="form-label">Email address</label>
    <input type="email" name="Email" class="form-control" id="exampleInputEmail1">
  </div>
  <div class="mb-3 text-light">
    <label for="phoneNumber" class="form-label">Phone Number</label>
    <input type="text" name="phno" class="form-control" id="phoneNumber">
  </div>
    <div class="mb-3 text-light">
    <label class="form-label" for="Aboutsection">Additional Information</label>
    <textarea class="form-control" name="about" id="Aboutsection" rows="4"></textarea>
  </div>
 <div class="text-center mt-2"> <button type="submit" class="btn btn-light">Save Contact</button></div>
</form>
	
	</div>
	</div>
	</div>
	</div>	
<%@ include file="FramWorks/footer.jsp" %>
</body>
</html>