<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Add Note</title>
		<%@include file="all_js_css.jsp" %>
	</head>
<body>
	<div class="container-fluid">
    	<%@include file="navbar.jsp" %>
    	<br>
    
    	<h1>Please fill your note details</h1>
	
		<!-- This is add form -->
	
		<form action="SaveNoteServlet" method="post">
	
  			<div class="form-group mb-3">
    			<label for="title" class="form-label">Note Title</label>
    			<input required name="title" type="text" class="form-control" id="title" aria-describedby="emailHelp" 
    			placeholder="Enter your title here">
  			</div>
  		
  			<div class="form-group mb-3">
    			<label for="content" class="form-label">Note Content</label>
    			<textarea required name="content" id="content" placeholder="Enter your content here" 
    			class="form-control" style="height: 300px;"></textarea>
  			</div>
  		
  			<div class="container text-center" >
  				<button type="submit" class="btn btn-primary">Add</button>
  			</div>
		</form>
	</div>
</body>
</html>