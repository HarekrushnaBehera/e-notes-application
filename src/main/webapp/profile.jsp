<%@page import="com.org.dao.UserDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Your Profile</title>
<%@ include file="component/bootstrap_css.jsp" %>
</head>
<body>
	<%@ include file="component/home_navbar.jsp" %>
	<% User user2 = (User) session.getAttribute("userObj");
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
							<div class="mb-3">
								<label class="form-label">Mobile No</label> <input name="mobile"
									type="tel" class="form-control" value="<%= user3.getMobile() %>" required>
							</div>
							<div class="d-flex justify-content-between">
<%-- 								<a href="changepwd?email=<%= user2.getEmail() %>" class="btn bg-success text-white" data-bs-toggle="modal" data-bs-target="#change_password">Change Password</a> --%>
								<button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#change_password">Launch</button>
								<button type="submit" class="btn bg-primary text-white">Update</button>
							</div>
							<input name="uid" type="hidden" value="<%= user3.getId() %>">
							<input name="pwd" type="hidden" value="<%= user3.getPassword() %>">
						</form>
					</div>
				</div>
				<div class="modal fade" id="change_password" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
  					<div class="modal-dialog">
    					<div class="modal-content">
      						<div class="modal-header border-bottom-0 py-2 px-3">
        						<h5 class="modal-title pb-1" id="staticBackdropLabel">Verify Email</h5>
        						<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      						</div>
        					<div class="modal-body px-3">
        						<p>Check your Registered Email Id for the OTP</p>
        						<% 
        							String otpmsg = (String) session.getAttribute("mismatch");
        							if (otpmsg != null) { %>
        								<div class="alert alert-danger py-2" role="alert"><%= otpmsg %></div>
        						<% } %>
        						<form class="d-flex col-6" action="checkotp">
	        						<input name="otp" type="text" class="form-control me-2" placeholder="Enter OTP">
	        						<button type="button" class="btn btn-success">Verify</button>
	      						</form>
        					</div>
	      					<div class="modal-footer border-top-0">
	        					<a class="btn btn-danger disable" href="changepwd?email=<%= user2.getEmail() %>" data-bs-toggle="modal" data-bs-target="#change_password">ReSend</a>
	      					</div>
	    				</div>
	  				</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>