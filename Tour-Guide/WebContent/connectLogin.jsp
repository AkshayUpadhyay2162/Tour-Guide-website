<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
<%@ page import = "java.sql.*,java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<link href="https://fonts.googleapis.com/css?family=Josefin+Sans&display=swap" rel="stylesheet">
<title>Login</title>
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
height: 500px;
width: 100%;
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
		<div class="container content-div">
			<div class="row">
				<div class="form-group">
					<div class="col-md-4">
						<select class="form-control input-md" id="city" name="city">
						<option value="Gwalior">Gwalior</option>
						<option value="Delhi">Delhi</option>
						</select>
					</div>
					<div class="col-md-4">
					<button class="btn btn-primary" id="submit" name="submit">Get location</button>
					</div>	
				</div>
			</div>
			<div class="row" style = "padding:20px;"></div>
			<div class="row">
				<div id="right-panel">
					<div class="col-md-3">
					<b>Start:</b>
					<select class="form-control input-md" id="start"></select>
					</div>
					<div class="col-md-4">
					<b>Waypoints:</b>
					</div>
				</div>
			</div>
		</div>
		<script>
		
		function initMap() {
			var location = {lat: 26.152300, lng: 78.781303};

			var map = new google.maps.Map(document.getElementById('map'), {
				    zoom: 4,
				    center: location
				  });
				  
		    var marker = new google.maps.Marker({
					  position: location,
					  map: map
					});

				
		}
		
		
		</script>
		  <script async defer src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDHWdd1OvZ5YcZ0hiTGmyPAMqtbfP1bI_M&callback=initMap"
  type="text/javascript"></script>
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
<script src="https:////code.jquery.com/jquery-1.10.2.min.js"></script>
</html>