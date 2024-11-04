<%@page import="javax.persistence.Persistence"%>
<%@page import="com.org.utilities.Helper"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>E-Notes-Application</title>
<%@ include file="component/bootstrap_css.jsp"%>
<link rel="stylesheet" type="text/css" href="index.css">
</head>
<body>
	<%@ include file="component/index_navbar.jsp"%>
	<div class="px-4 pt-5 my-5 text-center">
		<h1 class="display-4 fw-bold">Centered screenshot</h1>
		<div class="col-lg-6 mx-auto">
			<p class="lead mb-4">Quickly design and customize responsive
				mobile-first sites with Bootstrap, the world’s most popular
				front-end open source toolkit, featuring Sass variables and mixins,
				responsive grid system, extensive prebuilt components, and powerful
				JavaScript plugins.</p>
			<div class="d-grid gap-2 d-sm-flex justify-content-sm-center mb-5">
				<a href="register.jsp" class="btn btn-primary btn-lg px-4 me-sm-2">Register</a>
				<a href="login.jsp" class="btn btn-secondary btn-lg px-4">Login</a>
			</div>
		</div>
	</div>
</body>
</html>