<%@page import="com.org.dao.UserDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Your Profile</title>
<%@ include file="component/bootstrap_css.jsp" %>
<style type="text/css">
	.modal-body form {
		width: 60%;
	}
</style>
</head>
<body>
	<%@ include file="component/home_navbar.jsp" %>
	<% User user2 = (User) session.getAttribute("userObj");
	   if (user2 != null) {
		   UserDao udao = new UserDao();
		   User user3 = udao.fetchUserById(user2.getId());
		%>
		<div class="container p-4">
			<div class="row">
				<div class="col-md-4 offset-md-4">
					<div class="shadow px-3 mb-2 bg-body rounded car paint-card">
						<div class="card-body">
							<p class="fs-4 text-center">My Profile</p>
							<form action="update_profile" method="post">
								<div class="mb-1">
									<label class="form-label">Name</label> <input name="name"
										type="text" class="form-control" value="<%= user3.getName() %>" required>
								</div>
								<div class="mb-1">
									<label class="form-label">Age</label> <input name="age"
										type="number" class="form-control" value="<%= user3.getAge() %>" required>
								</div>
								<div class="mb-1">
									<label class="form-label">Email Address</label> <input
										name="email" type="email" class="form-control" value="<%= user3.getEmail() %>" required>
								</div>
								<div class="mt-2">
									<label class="form-label me-2">Password : </label>
									<a href="changepwd?email=<%= user3.getEmail() %>" class="btn btn-success btn-sm text-white" data-bs-toggle="modal" data-bs-target="#changepwd">Change Password</a>
								</div>
								<div class="mb-3">
									<label class="form-label">Mobile No</label> <input name="mobile"
										type="tel" class="form-control" value="<%= user3.getMobile() %>" required>
								</div>
								<div class="d-flex justify-content-end">
									<button type="submit" class="btn btn-primary text-white">Update</button>
								</div>
								<input name="uid" type="hidden" value="<%= user3.getId() %>">
								<input name="pwd" type="hidden" value="<%= user3.getPassword() %>">
							</form>
						</div>
					</div>
				</div>
			</div>
			<div class="modal fade" id="changepwd" data-bs-backdrop="static" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
	  			<div class="modal-dialog">
	    			<div class="modal-content">
	      				<div class="modal-header border-0 pb-0">
	        				<h5 class="modal-title" id="exampleModalLabel">Verify Email</h5>
	        				<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
	      				</div>
	      				<div class="modal-body">
	      					<% String missed = (String) session.getAttribute("mismatch");
	      					   if (missed != null) { %>
	      						   <div class="alert alert-danger" role="alert"><%= missed %></div>
	      					<% }
	      						session.removeAttribute("mismatch");%>
	      					<div class="pb-3">Please Check your Registered Email Id and enter the 6-digits OTP.</div>
	        				<form class="d-flex" action="checkotp">
	        					<input class="form-control me-2" type="text" name="uotp" placeholder="Enter OTP">
	        					<button class="btn btn-success" type="submit">Submit</button>
	        				</form>
	      				</div>
	      				<div class="modal-footer border-0 pt-0">
	        				<a href="changepwd?email=<%= user3.getEmail() %>" class="btn btn-danger">Re-send</a>
	      				</div>
	    			</div>
	  			</div>
			</div>
		</div>
	<% } else {
		response.sendRedirect("login.jsp");
	} %>
</body>
</html>