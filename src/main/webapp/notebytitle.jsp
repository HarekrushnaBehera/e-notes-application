<%@page import="com.org.dto.Notes"%>
<%@page import="com.org.dao.NoteDao"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Your Notes</title>
<%@ include file="component/bootstrap_css.jsp"%>
<style type="text/css">
.count {
	text-align: center;
	font-size: 41px;
	font-weight: bold;
	font-style: italic;
	font-family: serif;
	color: darkcyan;
	position: sticky;
    top: 7%;
    z-index: 100;
    background-color: white;
}

.count .row {
	height: 61vh;
	overflow: auto;
}

.card {
	height: 25vh;'
	padding: 0px;
	margin: 15px;
}

.card-body h5 {
	padding: 0px 3px;
	padding-bottom: 3px;
	margin-bottom: 16px;
	color: crimson;
}

.card-text {
	height: 86px;
	background-color: #fafaff;
	padding: 2px 7px;
	text-align: justify;
	border-radius: 8px;
	overflow: auto;
	scrollbar-width: none;
}

.stick {
	position: sticky;
	bottom: 20%;
	left: 50%;
	transform: translate(-50%, -20%);
}

.time {
	align-content: center;
	color: #54a061;
	font-weight: 500;
	font-size: 13px;
	cursor: default;
}

.icons button {
	padding: 4px 5px;
	font-size: 19px;
	border: none;
	background-color: white;
}

.delete {
	font-size: 24px;
	font-weight: bold;
	color: #292326;
}
.nav-pills .nav-link.active{
    background-color: blue;
}
.nav-pills .nav-link {
    background-color: #dfdddd;
    border-radius: 0px;
    border: 2px solid #b2aaaa;
}   
.btn_grp {
	position: sticky;
    top: 15%;
    z-index: 100;
    background-color: white;
}
</style>
</head>
<body>
	<%@ include file="component/home_navbar.jsp"%>
	<%  User user2 = (User) session.getAttribute("userObj");
		if (user2 != null) {
			String title = request.getParameter("mytitle");
			NoteDao ndao = new NoteDao();
			List<Notes> notes = ndao.fetchNotesByTitle(title);
			if (!notes.isEmpty()) { %>
				<div class="container-fluid px-3 py-4" id="featured-3">
					<h2 class="pb-2 border-bottom count">TOTAL NOTES :<%= notes.size() %></h2>
					<div class="d-flex justify-content-between px-4 py-2 btn_grp">
						<div class="d-grid gap-2 d-md-block">
							<a href="notes.jsp" class="btn btn-success">All Notes</a>
			  				<a href="addnote.jsp" class="btn btn-primary me-md-2 disabled">Add Note</a>
						</div>
					  	<form class="d-grid gap-2 d-md-flex justify-content-md-end">
				        	<input class="form-control me-2" type="search" placeholder="Enter Title Here" aria-label="Search">
				        	<button class="btn btn-success" type="submit">Search</button>
				      	</form>
					</div>
					<% String addmsg = (String) session.getAttribute("added");
					   if (addmsg != null) { %>
						   <div class="alert alert-success m-0 p-3" role="alert"><%= addmsg %></div>
					<% }
					   session.removeAttribute("added");
					   String editmsg = (String) session.getAttribute("update_msg");
					   if (editmsg != null) { %>
					   		<div class="alert alert-primary m-0 p-3" role="alert"><%= editmsg %></div>
					<% }
					   session.removeAttribute("update_msg");
					   String delmsg = (String) session.getAttribute("delete_msg");
					   if (delmsg != null) { %>
					   		<div class="alert alert-primary m-0 p-3" role="alert"><%= delmsg %></div>
					<% }
					   session.removeAttribute("delete_msg");
					   String updtmsg = (String) session.getAttribute("profile_update");
					   if (updtmsg != null) { %>
					   		<div class="alert alert-success m-0 p-3" role="alert"><%= updtmsg %></div>
					<% }
					   session.removeAttribute("profile_update");
					%>
					<div class="d-flex flex-wrap justify-content-evenly">
						<% for (Notes note : notes) { %>
						<div class="card border-0 shadow col-3 m-4">
							<div class="card-body p-2 d-flex flex-column">
								<div class="note_content">
									<h5 class="card-title"><%= note.getTitle() %></h5>
									<p class="card-text"><%= note.getContent() %></p>
								</div>
								<div class="d-flex justify-content-between">
									<div class="time"><%= note.getTime() %></div>
									<div class="d-grid gap-3 d-md-flex justify-content-md-end icons">
										<button class="btn text-secondary" data-bs-toggle="modal" data-bs-target="#editModal<%= note.getId() %>">
											<i class="fa fa-pencil-square-o" aria-hidden="true"></i>
										</button>
										<button class="btn text-secondary ml-2" data-bs-toggle="modal" data-bs-target="#deleteModal<%= note.getId() %>">
											<i class="fa fa-trash-o" aria-hidden="true"></i>
										</button>
									</div>
								</div>
							</div>
						</div>
						<% } %>
					</div>
				</div>
				<% for (Notes note : notes) { %>
				<div class="modal fade" id="editModal<%= note.getId() %>" tabindex="-1"
					aria-labelledby="exampleModalLabel" aria-hidden="true">
					<div class="modal-dialog">
						<div class="modal-content">
							<form class="px-3 pt-3" action="editnote" method="post">
								<div class="mb-2">
									<label class="form-label">Title :</label> <input name="title" type="text" value="<%= note.getTitle() %>" class="form-control" required>
								</div>
								<div class="mb-2">
									<label class="form-label">Description :</label>
									<input name="desc" type="text" value="<%= note.getContent() %>" class="form-control" required>
								</div>
								<input name="nid" type="hidden" value="<%= note.getId() %>">
								<div class="modal-footer">
									<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
									<button type="submit" class="btn btn-primary">Edit</button>
								</div>
							</form>
						</div>
					</div>
				</div>
				<% } %>
				<% for (Notes note : notes) { %>
				<div class="modal fade" id="deleteModal<%=note.getId()%>" tabindex="-1"
					aria-labelledby="exampleModalLabel" aria-hidden="true">
					<div class="modal-dialog">
						<div class="modal-content">
							<form class="px-3 pt-3" action="deletenote">
								<div class="mb-2 delete">Do you want to delete this note ?</div>
								<input name="nid" type="hidden" value="<%=note.getId()%>">
								<div class="modal-footer border-top-0">
									<button type="button" class="btn btn-primary"
										data-bs-dismiss="modal">Cancel</button>
									<button type="submit" class="btn btn-danger">Delete</button>
								</div>
							</form>
						</div>
					</div>
				</div>
			<% }
			} else { %>
			<div class="container-fluid px-3 py-4" id="featured-3">
			<h2 class="pb-2 border-bottom count">TOTAL NOTES : <%= notes.size() %></h2>
			<div class="d-flex justify-content-between ps-4">
				<div class="d-grid gap-2 d-md-block">
					<a href="notes.jsp" class="btn btn-success">All Notes</a>
		  			<a href="addnote.jsp" class="btn btn-primary me-md-2 disabled">Add Note</a>
				</div>
				 <form class="d-grid gap-2 d-md-flex justify-content-md-end">
			      	<input class="form-control me-2" type="search" placeholder="Enter Title Here" aria-label="Search">
			     	<button class="btn btn-success disabled" type="submit">Search</button>
			      </form>
			</div>
			<h2 class="fst-italic text-center text-success">You don't have any Notes to Display</h2>
		</div>
		<% }
	} else {
		response.sendRedirect("login.jsp");
	} %>
</body>
</html>