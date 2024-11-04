<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Add Note</title>
<%@ include file="component/bootstrap_css.jsp" %>
<style type="text/css">
	.add_note {
		width: 100%;
	}
	.add_note input {
		width: 80%;
	}
	.add_note textarea {
		width: 80%;
		height: 130px;
	}
	.add_note label {
		font-size: 19px;
	}
</style>
</head>
<body>
	<%@ include file="component/home_navbar.jsp" %>
	<div class="container-fluid">
		<div class="row justify-content-center m-5">
			<div class="col-md-8 shadow d-flex">
					<form class="p-4 add_note" action="addnote" method="post">
						<div class="d-flex justify-content-between mb-4">
							<label for="exampleInputEmail1" class="form-label">Note Title</label>
							<input type="text" class="form-control" id="exampleInputEmail1" name="title" aria-describedby="emailHelp">
						</div>
						<div class="d-flex justify-content-between mb-3">
  							<label for="floatingTextarea2">Note Content</label>
  							<textarea class="form-control" placeholder="Write your content here" id="floatingTextarea2" name="desc"></textarea>
						</div>
						<input name="uid" type="hidden" value="">
						<div class="d-md-flex justify-content-md-end">
							<button type="submit" class="btn btn-primary">Add</button>
						</div>
					</form>
				</div>
		</div>
	</div>
</body>
</html>