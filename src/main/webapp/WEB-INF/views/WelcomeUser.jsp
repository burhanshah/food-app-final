<%@page import="com.foodapp.model2.*"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Welcome Page</title>
<link rel="stylesheet"
	href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css"
	integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p"
	crossorigin="anonymous" />
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
					<li><a href="home">Main Page</a></li>
					<li><a href="#">Edit Order</a></li>
					<li><a href="OrderServlet">Order Status</a></li>
					<li><a href="#">Cancel Order</a></li>
				</ul>
			</div>

			<div id="right">
				<c:if test='${sessionScope["userType"].equals("CUSTOMER")}'>
					<li><a href="logout">Logout<i class="fas fa-user"></i></a>
				</c:if>
				<c:if test='${sessionScope["userType"].equals("ADMIN")}'>
					<li><a href="logout">Logout Admin<i class="fas fa-user-tie"></i></a>
				</c:if>
			</div>
		</nav>
	</header>

	<section id="admin">
		<h1>Welcome!!</h1>
		<h3>Please select restraunt of your choice!!</h3>
		<h4>
			${userName}
		</h4>
		<div id="pannel">

			<a href="restraunt?name=habib" name="habib">
				<div class="opt">
					<i class="fas fa-bread-slice"></i> <span>Habib</span>
				</div>
			</a> <a href="restraunt?name=Sajjad">
				<div class="opt">
					<i class="fas fa-hamburger"></i> <span>Sajjad</span>
				</div>
			</a> <a href="restraunt?name=Kolachi">
				<div class="opt">
					<i class="fas fa-dragon"></i> <span>Kolachi</span>
				</div>
			</a>
			</a> <a href="restraunt?name=bbq">
				<div class="opt">
					<i class="fas fa-dragon"></i> <span>Kolachi</span>
				</div>
			</a>
		</div>


	</section>