<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Register</title>
<%@ include file="component/bootstrap_css.jsp" %>
</head>
<body>
	<%@ include file="component/index_navbar.jsp" %>
	<div class="container p-4">
		<div class="row">
			<div class="col-md-4 offset-md-4">
				<div class="shadow px-3 mb-2 bg-body rounded car paint-card">
					<div class="card-body">
						<p class="fs-4 text-center">User Registration</p>
						<% String str = (String) session.getAttribute("success");
							if (str != null) {%>
							<div class="alert alert-success py-2" role="alert"><%= str %></div>
						<% }
							session.removeAttribute("success"); %>
						<form action="register" method="post">
							<div class="mb-1">
								<label class="form-label">Name</label> <input name="name"
									type="text" class="form-control" required>
							</div>
							<div class="mb-1">
								<label class="form-label">Age</label> <input name="age"
									type="number" class="form-control" required>
							</div>
							<div class="mb-1">
								<label class="form-label">Email Address</label> <input
									name="email" type="email" class="form-control" required>
							</div>
							<div class="mb-2">
								<label class="form-label">Password</label> <input
									name="password" type="password" class="form-control" required>
							</div>
							<div class="mb-3">
								<label class="form-label">Mobile No</label> <input name="mobile"
									type="tel" class="form-control" required>
							</div>
							<button type="submit" class="btn bg-secondary text-white col-md-12">Register</button>
							<div class="mt-2 text-center">
								<span>Already have an account ?</span>
								<a href="login.jsp">login here</a>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>