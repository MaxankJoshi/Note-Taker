<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.Entities.Note"%>
<%@page import="java.util.List"%>
<%@page import="javax.persistence.TypedQuery"%>
<%@page import="org.hibernate.Session"%>
<%@page import="org.hibernate.SessionFactory"%>
<%@page import="com.Helper.FactoryProvider"%>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>All Notes</title>
		<%@include file="all_js_css.jsp" %>
	</head>
	<body>
		<div class="container-fluid">
    	<%@include file="navbar.jsp" %>
    	<br>
    	
    	<h1 class="text-uppercase">All Notes:</h1>
    	
    		<div class="row">
    			<div class="col-12">
    				<%
						SessionFactory factory = FactoryProvider.getFactory();
			
						Session s = factory.openSession();
			
						@SuppressWarnings("unchecked")
						TypedQuery<Note> q = s.createQuery("from Note");
						List<Note> list = q.getResultList();
			
						for(Note note:list) {
					%>
							<div class="card mt-2 mb-2 card-body px-5" >
  								<img style="max-width: 100px" src="image/note.png" class="card-img-top mx-auto" alt="...">
  								<div>
    								<h5 class="card-title"><%= note.getTitle() %></h5>
    								<p class="card-text"><%= note.getContent() %></p>
    								<p><b class="text-primary"><%= note.getAddedDate().toLocaleString() %></b></p>
    								
    								<div class="container text-center mt-2">
    									<a href="DeleteServlet?note_id=<%= note.getId() %>" class="btn btn-danger">Delete</a>
    									<a href="edit.jsp?note_id=<%= note.getId() %>" class="btn btn-primary">Update</a>
    								</div>
  								</div>
							</div>
					<%
						}
			
						s.close();
					%>
    			</div>
    		</div>
    	</div>
	</body>
</html>