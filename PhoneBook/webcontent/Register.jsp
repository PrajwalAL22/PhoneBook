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
	<div class="container-fluid back-img">
	<div class="row pt-5">
	<div class="card mx-auto bg-dark" style=" width: 30rem;">
	<div class="card-body bg-dark">
	
	<h2 class="text-center text-light"> Registration Page </h2>
		<% 
		String succmsg = (String)session.getAttribute("succmsg");
		String errormsg = (String)session.getAttribute("errormsg");
		
		if(succmsg != null){
		%><h5 class="text-success text-center"><%=succmsg %></h5>
		<% 
		session.removeAttribute("succmsg");
		}
		
		if(errormsg != null ){
			%><h5 class="text-danger text-center"><%=errormsg %></h5>
			<% 	
			session.removeAttribute("errormsg");
		}
		%>
	
	<form action = "register" method = "post">
	<div class="mb-3 text-light">
    <label for="Name" class="form-label">Full Name</label>
    <input type="text" name="name" class="form-control" id="Name">
  </div>
	
  <div class="mb-3 text-light">
    <label for="exampleInputEmail1" class="form-label">Email address</label>
    <input type="email" name = "email" class="form-control" id="exampleInputEmail1">
  </div>
  <div class="mb-3 text-light">
    <label for="exampleInputPassword1" class="form-label">Password</label>
    <input type="password" name = "password" class="form-control" id="exampleInputPassword1">
  </div>
 <div class="text-center mt-2"> <button type="submit" class="btn btn-light">Register</button></div>
</form>
	
	</div>
	</div>
	</div>
	</div>	
	
	<%@ include file="FramWorks/footer.jsp" %>
</body>
</html>