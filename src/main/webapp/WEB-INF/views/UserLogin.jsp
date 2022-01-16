<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
    	<meta http-equiv="X-UA-Compatible" content="IE=edge">
    	<meta name="viewport" content="width=device-width, initial-scale=1.0">
    	<title>User Login</title>
	    <link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css" integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p" crossorigin="anonymous"/>
	    <link rel="shortcut icon" href="images/logo.png" type="image/x-icon">
	    <link rel="stylesheet" href="resources/style.css">
</head>
<body>
	<header>
		<nav id="navbar">
			<div id="left">
				<img src="images/logo.png" alt="Logo"> <span id="logo_des"><strong>IUnTummy</strong></span>
			</div>

			<div id="mid">
				<ul>
					<li><a href="home">Home</a></li>
					<!--  <li><a href="#">Forgot Password</a></li> -->
					<li><a href="#">Help</a></li>
					<li><a href="#">Contact Us</a></li>
				</ul>
			</div>

			<div id="right">
				<li><a href="userlogin">User <i
						class="fas fa-user-tie"></i></a></li>

				</a></li>
			</div>
		</nav>
	</header>


	<section id="user">
		<h1>Login</h1>





		<form id="forms" action="<%= request.getContextPath() %>/userlogin" method="post" >

			
			<div id="field">
				<!-- Added Selection for User Type -->
				<label for="role">Choose a User Type:</label>
				
				<select name="role" id="field">
  					<option value="admin">Admin</option>
  					<option value="customer">Customer</option>
				</select>
			</div>
			
			<div id="field">
				<div>ID:</div>
				<div>
					<input type="text" id="name" name="username">
				</div>
			</div>

			<div id="field">
				<div>Password:</div>
				<div>
					<input type="password" id="password" name="password">
				</div>
			</div>



			<div class="btn">
				<input type="submit" value="Login">
				<input type="reset"
					value="Reset All">
					<a href="register"><input type="button" value="Register"> </a>
<!-- 					<a href="UserRegistration.jsp"><input type="button" value="Register"> </a>
 -->					
			</div>

			<div class="btn">
    			
   			</div>

		</form>
		
		<!-- <div class="btn">
		<a href="UserRegistration.jsp"><input type="button" value="Register"> </a>
		</div> -->




	</section>