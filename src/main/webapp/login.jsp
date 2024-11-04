<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login</title>
<%@ include file="component/bootstrap_css.jsp" %>
</head>
<body>
	<%@ include file="component/index_navbar.jsp" %>
	<div class="container p-5">
		<div class="row">
			<div class="col-md-4 offset-md-4">
				<div class="shadow p-3 mb-5 bg-body rounded car paint-card">
					<div class="card-body">
						<p class="fs-4 text-center">User Login</p>
						<% String str = (String) session.getAttribute("msg");
							if (str != null) {%>
							<div class="alert alert-danger py-2" role="alert"><%= str %></div>
						<% }
							session.removeAttribute("msg"); %>
						<form action="login" method="post">
							<div class="mb-2">
								<label class="form-label">Email Address</label> <input
									name="email" type="email" class="form-control" required>
							</div>
							<div class="mb-2">
								<label class="form-label">Password</label> <input
									name="password" type="password" class="form-control" required>
							</div>
							<button type="submit" class="btn bg-secondary text-white col-md-12">Login</button>
							<div class="mt-2 text-center">
								<span>Don't have an account ?</span>
								<a href="register.jsp">register here</a>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>