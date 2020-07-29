<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
<%@ page import = "java.sql.*,java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<link href="https://fonts.googleapis.com/css?family=Josefin+Sans&display=swap" rel="stylesheet">
<title>Login</title>
<style>
*{
            margin: 0; padding: 0; font-family: 'Josefin Sans', sans-serif; 
        }

#map{
height: 500px;
width: 100%;
}
b{
	text-align: center;
	padding: 10px;
	margin-right: 10px;
}
#right-panel {
	margin: 20px;
	border-width: 2px;
	width: 20%;
	height: 100%;
	float: left;
	text-align: left;
	padding-top: 0;
}

#directions-panel {
	margin-top: 10px;
	background-color: #FFEE77;
	padding: 10px;
	overflow: scroll;
	height: 174px;
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
		<div class="jumbotron w-75 mx-auto" style="margin-top: 100px;">
			<form action="">
			<div class="form-group">
				<div class="row">
				<div class="col-lg-4">
					<div class="input-group">
					<b>Select city: </b>
					<select name="city" id="city" class="form-control">
						<option value="Gwalior">Gwalior</option>
						<option value="Delhi">Delhi</option>
					</select>
				</div>
				</div>
				<div class="col-lg-4">
					<button class="btn btn-primary btn-block" id="get-location">Get location</button>
				</div>
			</div>
		</div>
			<div class="form-group">
				<div class="row">
					<div class="col-lg-3">
						<div class="input-group">
							<b>Start Point: </b>
							<Select name="start" id="start" class="form-control">
								<option value="">Govindpuri</option>
								<option value="">Maharaja Bada</option>
								<option value="">Thatipur</option>
								<option value="">City center</option>
								<option value="">Thatipur</option>
								<option value="">Kampoo</option>
							</Select>
						</div>
						</div>
					<div class="col-lg-3">
						<div class="input-group">
							<b>Waypoints: </b>
							<select multiple name="wp" id="wp" class="form-control">
								<option value="">Govindpuri</option>
								<option value="">Maharaja Bada</option>
								<option value="">Thatipur</option>
								<option value="">City center</option>
								<option value="">Thatipur</option>
								<option value="">Kampoo</option>
							</select>
						</div>
					</div>
					<div class="col-lg-3">
						<div class="input-group">
							<b>End Point: </b>
							<Select name="end" id="end" class="form-control">
								<option value="">Govindpuri</option>
								<option value="">Maharaja Bada</option>
								<option value="">Thatipur</option>
								<option value="">City center</option>
								<option value="">Thatipur</option>
								<option value="">Kampoo</option>
							</Select>
						</div>
					</div>
					<div class="col-lg-3">
						<button id="submit" type="submit" class="btn btn-primary">Load Map</button>
					</div>
				</div>
			</div>
		</form>
		</div>
		<div id="map" class="mb-5"></div>
		<script>

			if(navigator.geolocation)	
				navigator.geolocation.getCurrentPosition(function(position){
				console.log(position);
			});
			else
				console.log("geolocation not supported");
	

		</script>
		  <script async defer src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDrta6YIpc31dsbeuDDmG4obUw1XNW_8d8&callback=initMap"
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
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI" crossorigin="anonymous"></script>
</html>