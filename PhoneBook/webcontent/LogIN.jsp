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
	
	<h2 class="text-center text-light"> LogIn </h2>
	
	<form action = "Login" method = "post" >
	<% String invalidMsg = (String)session.getAttribute("invalidMsg");
		if(invalidMsg != null){
			%> <h5 class="text-center text-danger"><%=invalidMsg%></h5>
		<%	session.removeAttribute("invalidMsg");
		}
		%> 
		
		<% String logoutmsg = (String)session.getAttribute("logout");
		if(logoutmsg != null){
			%> <h5 class="text-center text-success"><%=logoutmsg%></h5>
		<%	session.removeAttribute("logout");
		}
		%> 
		<% String Loginmssg = (String)session.getAttribute("Loginmssg");
		if(Loginmssg != null){
			%> <h5 class="text-center text-danger"><%=Loginmssg%></h5>
		<%	session.removeAttribute("Loginmssg");
		}
		%>   
	
  <div class="mb-3 text-light">
    <label for="exampleInputEmail1" class="form-label">Email address</label>
    <input type="email" name="email" class="form-control" id="exampleInputEmail1">
  </div>
  <div class="mb-3 text-light">
    <label for="exampleInputPassword1" class="form-label">Password</label>
    <input type="password" name="password" class="form-control" id="exampleInputPassword1">
  </div>
 <div class="text-center mt-2"> <button type="submit" class="btn btn-light">Log IN</button></div>
</form>
	
	</div>
	</div>
	</div>
	</div>	
	
	<%@ include file="FramWorks/footer.jsp" %>
</body>
</html>