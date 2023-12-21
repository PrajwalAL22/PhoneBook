<%@page import="com.entity.User"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.conn.DbConnect"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ include file="FramWorks/BootStrap.jsp" %>
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
<%@ include file="FramWorks/NavBar.jsp" %>

	<% User user = (User)session.getAttribute("user"); 
	%>

	<div class="container-fluid back-img text-light text-center">
		<h1 class="pt-3">Welcome To Phone Book<% %></h1>
		
	</div>
	
<%@ include file="FramWorks/footer.jsp" %>
</body>
</html>