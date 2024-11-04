<%@page import="com.org.dto.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="index.css">
<style type="text/css">
.nav-link, .navbar-brand, .btn {
	color: white;
}
.navbar {
	 position: sticky;
     top: 0%;
     z-index: 100;
}
</style>
</head>
<body>
	<% User user = (User) session.getAttribute("userObj"); %>
	<nav class="navbar navbar-dark navbar-expand-lg">
		<div class="container-fluid">
			<a class="navbar-brand" style="cursor: default;">MY NOTES</a>
			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
				aria-controls="navbarSupportedContent" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarSupportedContent">
				<ul class="navbar-nav me-auto mb-2 mb-lg-0">
					<li class="nav-item">
						<a class="nav-link" aria-current="page" href="home.jsp">Home</a>
					</li>
					<li class="nav-item">
						<a class="nav-link" href="#">About</a>
					</li>
					<li class="nav-item">
						<a class="nav-link" href="#">Contact</a>
					</li>
					<li class="nav-item">
						<a class="nav-link" href="notes.jsp">Notes</a>
					</li>
				</ul>
				<ul class="navbar-nav ms-auto mb-2 mb-lg-0">
					<li class="nav-item">
						<a class="nav-link active" href="profile.jsp">Profile</a>
					</li>
					<li class="nav-item">
						<a class="nav-link active" href="logout">Logout</a>
					</li>
				</ul>
			</div>
		</div>
	</nav>
</body>
</html>