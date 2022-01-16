<%@page import="com.foodapp.model2.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Admin Pannel</title>
<link rel="stylesheet"
	href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css"
	integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p"
	crossorigin="anonymous" />
<link rel="shortcut icon" href="images/logo.png" type="image/x-icon">
<link rel="shortcut icon" href="../images/logo.png" type="image/x-icon">
<link rel="stylesheet" href="resources/style.css">
<link rel="stylesheet" href="../resources/style.css">
</head>
<body>
	<header>
		<nav id="navbar">
			<div id="left">
				<img src="images/logo.png" alt="Logo" onerror='this.style.display = "none"'>
				<img src="../images/logo.png" alt="Logo" onerror='this.style.display = "none"'> 
				<span id="logo_des"><strong>IUnTummy</strong></span>
			</div>

			<div id="mid">
				<ul>
					<li><a href="home">Home</a></li>
					<li><a href="#">Edit Order</a></li>
					<li><a href="#">Order Status</a></li>
					<li><a href="#">Cancel Order</a></li>
				</ul>
			</div>

			<div id="right">
				<li><a href="logout">Logout<i class="fas fa-user-tie"></i></a></li>

				</a>
				</li>
			</div>
		</nav>
	</header>


	<section id="admin">
		<h1>Administration Pannel</h1>
		<h3>Restaurant : <%=((Owner) session.getAttribute("user")).getRestaurant().getName() %> </h3>
		<h4>
			Welcome,
			<%= ((User) session.getAttribute("user")).getUserName() %>
		</h4>

		<div id="pannel">

			<a href="RestaurantMenuUpdate?name=<%=((Owner) session.getAttribute("user")).getRestaurant().getName() %>">
				<div class="opt">
					<i class="fas fa-plus-circle"></i> <span>Update Menu</span>
				</div>
			</a> <a href="RestaurantMenuDelete?name=<%=((Owner) session.getAttribute("user")).getRestaurant().getName() %>">
				<div class="opt">
					<i class="fas fa-minus-circle"></i> <span>Remove Menu</span>
				</div>
			</a> <a href="restraunt?name=<%=((Owner) session.getAttribute("user")).getRestaurant().getName() %>">
				<div class="opt">
					<i class="fas fa-eye"></i> <span>View Menu</span>
				</div>
			</a> <a href="#">
				<div class="opt">
					<i class="fas fa-envelope"></i> <span>Customer Complains</span>
				</div>
			</a>

		</div>




		<div id="pannel">

			<a href="OrderServlet?userName=<%=((Owner) session.getAttribute("user")).getUserName() %>">
				<div class="opt">
					<i class="fas fa-hamburger"></i> <span>View Order</span>
				</div>
			</a> <a href="RestaurantMenuAdd?name=<%=((Owner) session.getAttribute("user")).getRestaurant().getName() %>">
				<div class="opt">
					<i class="fas fa-folder-plus"></i> <span>Add Menu</span>
				</div>
			</a> <a href="#">
				<div class="opt">
					<i class="fas fa-percent"></i> <span>Apply Discounts</span>
				</div>
			</a> <a href="#">
				<div class="opt">
					<i class="fas fa-gift"></i> <span>Complimetary</span>
				</div>
			</a>

		</div>





	</section>