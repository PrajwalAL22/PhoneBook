 <%@page import="com.entity.User"%>
<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
  <div class="container-fluid">
    <a class="navbar-brand pl-1" href="index.jsp"><i class="fa-solid fa-square-phone" style="color: #ffffff;"></i> PhoneBook </i></a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
      <ul class="navbar-nav me-auto mb-2 mb-lg-0">
        <li class="nav-item">
          <a class="nav-link active" aria-current="page" href="index.jsp">Home <i class="fa-solid fa-house-chimney" style="color: #ffffff;"></i></a>
        </li>
        <li class="nav-item">
          <a class="nav-link active" href="AddContact.jsp">Add Contact <i class="fa-solid fa-plus" style="color: #ffffff;"></i></a>
        </li>
       
        <li class="nav-item">
          <a class="nav-link active" href="ViewContact.jsp">View Contacts <i class="fa-solid fa-users-viewfinder" style="color: #ffffff;"></i></a>
        </li>
      </ul>

			<% User u = (User)session.getAttribute("user");
      		if(u==null){
      			%>
      		<form class="d-flex">
				<a href="LogIN.jsp" class="btn btn-success ">LogIn <i
					class="fa-solid fa-user" style="color: #ffffff;"></i></a> <a
					href="Register.jsp" class="btn btn-danger ms-2">Register <i
					class="fa-solid fa-user-plus" style="color: #ffffff;"></i></a>
			</form>
			<%
			}else{%>

			<form class="d-flex">
				<button class = "btn btn-info text text-light "> <i class="fa-solid fa-user" style="color: #ffffff;"></i>    <%=u.getName()%></button>
				<a data-bs-toggle="modal" data-bs-target="#exampleModal" class = "btn btn-danger ms-2">LogOut</a>
			</form>

			<% 	
			}
      		%>
    							<!-- Logout Popup Modal --> 
					
					<!-- Modal -->
		<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
			<div class="modal-dialog modal-dialog-centered">
				<div class="modal-content bg bg-dark">
					 	<div class="modal-header">
					  	  <h5 class="modal-title text text-light" id="exampleModalLabel">Confirm Log Out</h5>
					      <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
				        </div>
					     <div class="modal-body">
					       <h3 class = "text text-light">Do you want to LogOut..</h3S>
					       	<br><br>
					    	<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
					      <a href = "LogOut" class="btn btn-primary">Log Out</a>   
					   
					   </div>
			    </div>			
			  </div>
		</div>						     		
      
      
    </div>
  </div>
</nav>