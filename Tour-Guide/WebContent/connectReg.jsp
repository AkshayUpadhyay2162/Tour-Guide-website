<%@ page import = "java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<link href="https://fonts.googleapis.com/css?family=Josefin+Sans&display=swap" rel="stylesheet">
<title>Registration</title>
<script src="https:////code.jquery.com/jquery-1.10.2.min.js"></script>
<script
	src="https:////maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
<style>
*{
            margin: 0; padding: 0; font-family: 'Josefin Sans', sans-serif; 
        }

</style>
</head>
<body>
	<section>
		<nav class="navbar navbar-expand-lg navbar-light fixed-top">
			<div class="container-fluid">
			
			<a class="navbar-brand" style="font-size: 25px; font-weight: bold" href="HomePage.html">Tour Guide</a>
			<button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
				Menu
				<i class="fas fa-bars ml-1"></i>
			</button>
			<div class="collapse navbar-collapse" id="navbarResponsive">
				<ul class="navbar-nav text-uppercase ml-auto">
					<li class="nav-item"><a class="nav-link js-scroll-trigger" href="HomePage.html">Home</a></li>
					<li class="nav-item"><a class="nav-link js-scroll-trigger" href="#portfolio">Portfolio</a></li>
					<li class="nav-item"><a class="nav-link js-scroll-trigger" href="#aboutus">About</a></li>
					<li class="nav-item"><a class="nav-link js-scroll-trigger" href="#team">Team</a></li>
					<li class="nav-item"><a class="nav-link js-scroll-trigger" href="#contact">Contact</a></li>
				</ul>
				<a type="button" class="btn btn-outline-primary my-2 ml-2 mr-3" href="Login.html">Login</a>
				<a type="button" class="btn btn-outline-primary my-2" href="Register.html">Sign Up</a>
			</div>
			</div>
		</nav>
		</section>
<%
String firstname = request.getParameter("firstname");
String lastname = request.getParameter("lastname");
String email = request.getParameter("email");
String password = request.getParameter("password");
try{
	Class.forName("com.mysql.jdbc.Driver");
	Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/internship-tcs","test","");
	PreparedStatement ps = conn.prepareStatement("insert into registration(firstname,lastname,email,password) values(?,?,?,?)");
	ps.setString(1, firstname);
	ps.setString(2, lastname);
	ps.setString(3, email);
	ps.setString(4, password);
	int x = ps.executeUpdate();
	if(x>0){ %>
	<script>
		alert("Registration done");
	</script>
<div class="jumbotron w-50 mx-auto" style="margin-top: 100px;">
	<a href="Login.html" class="mx-auto p-5">Go to login page</a>
</div>
<%
}
	else {
		%>
		<script>
			alert("Registration failed")
		</script>
	<% 
	}
}
catch(Exception e){
	out.println(e);
}
%>
</body>
</html>
