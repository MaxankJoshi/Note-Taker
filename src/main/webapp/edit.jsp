<%@page import="com.Entities.Note"%>
<%@page import="org.hibernate.Session"%>
<%@page import="org.hibernate.SessionFactory"%>
<%@page import="com.Helper.FactoryProvider"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
	<meta charset="UTF-8">
	<title>Edit Page</title>
	<%@include file="all_js_css.jsp" %>
	</head>
	<body>
		<div class="container-fluid">
    		<%@include file="navbar.jsp" %>
    		<br>
    	
			<h1>Edit your note</h1>
			
			<%
				int note_Id = Integer.parseInt(request.getParameter("note_id").trim());
			
				SessionFactory factory = FactoryProvider.getFactory();
				
				Session s = factory.openSession();
				
				Note note = s.get(Note.class, note_Id);
				
				s.close();
			%>
			
			<form action="UpdateServlet" method="post">
				
				<input value="<%= note.getId() %>" name="note_id" type="hidden"/>
		
  				<div class="mb-3">
    				<label for="title" class="form-label">Note Title</label>
    				<input required name="title" type="text" class="form-control" id="title" aria-describedby="emailHelp" 
    				placeholder="Enter your title here" value="<%= note.getTitle() %>">
  				</div>
  		
  				<div class="mb-3">
    				<label for="content" class="form-label">Note Content</label>
    				<textarea required name="content" id="content" placeholder="Enter your content here" 
    				class="form-control" style="height: 300px;"><%= note.getContent() %></textarea>
  				</div>
  		
  				<div class="container text-center" >
  					<button type="submit" class="btn btn-success">Save your note</button>
  				</div>
			</form>
    	</div>
	</body>
</html>