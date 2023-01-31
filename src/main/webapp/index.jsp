<!doctype html>

<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>Note Taker: Home page</title>
    <%@include file="all_js_css.jsp" %>
  </head>
  <body>
    <div class="container-fluid">
    	<%@include file="navbar.jsp" %>
    	<br>
    	
		<div class="card py-5">
			<img alt="" class="img-fluid mx-auto" style="max-width:200px;" src="image/note.png">	
			<h1 class="text-primary text-uppercase text-center mt-3">Start taking your notes</h1>
			
			<div class="container text-center" >
				<a class="btn btn-outline-primary text-center" style="text-decoration: none;" href="add_notes.jsp">Start here</a>
			</div>
		</div>
    </div>

  </body>
</html>