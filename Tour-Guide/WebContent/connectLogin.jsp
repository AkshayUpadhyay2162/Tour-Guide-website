<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
<%@ page import = "java.sql.*,java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<link href="https://fonts.googleapis.com/css?family=Josefin+Sans&display=swap" rel="stylesheet">
<title>Login</title>
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
#map{
height:500px;
width:100%;
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
String email = request.getParameter("email");
session.putValue("email",email);
String password = request.getParameter("password");
Class.forName("com.mysql.jdbc.Driver");
Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/internship-tcs","test","");
Statement st = conn.createStatement();
ResultSet rs = st.executeQuery("select * from registration where email='"+email+"' and password='"+password+"'");
try{
	rs.next();
	if(rs.getString("password").equals(password) && rs.getString("email").equals(email)){
		%>
		<div id="map"></div>
		<script>
		function initMap(){
			
		}
		</script>
	<% 
	}
}
catch(Exception e){
	%>
	<div class="jumbotron w-75 pt-5 mx-auto mt-5">
	<h1 class="text-center mb-3 mt-3">Login failed: Incorrect email or password</h1>
	<hr class="w-50 mx-auto pt-5">
	</div>
	<% 
}
%>
</body>
</html>