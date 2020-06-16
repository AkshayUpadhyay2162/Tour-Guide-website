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
.navbar{
background-color:#0A3D62;
}
</style>
</head>
<body>
<section>
<nav class="navbar navbar-default">
	<div class="container-fluid">
	<div class="navbar-header">
	<a class="navbar-brand" style="color: #ffffff; font-size: 25px; font-weight: bold" href="HomePage.html">Tour Guide</a>
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
	<div class="jumbotron w-75 pt-5 mx-auto mt-5">
		<h1 class="text-center mt-3 mb-3">Registration Done</h1>
		<hr class="w-50 mx-auto pt-5">
		<h5 class="text-capitalize mx-auto text-center">Go to <a href="Login.html"> login page</a></h5> 
		</div>
		<%
}
	else {
		%>
		<div class="jumbotron w-75 pt-5 mx-auto mt-5">
		<h1 class="text-center mt-3 mb-3">Registration Failed</h1>
		<hr class="w-50 mx-auto pt-5">
		<h5 class="text-capitalize mx-auto text-center"><a href="Register.html">Register again</a></h5>
	</div>
	<% 
	}
}
catch(Exception e){
	out.println(e);
}
%>
</body>
</html>
