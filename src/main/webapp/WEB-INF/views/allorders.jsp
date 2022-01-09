<%@page import="com.foodapp.model2.*"%>
<%@page import="java.util.*"%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page session="true"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>All Orders</title>
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
					<li><a href="home">Home</a></li>
					<li><a href="#">Restaurants</a></li>
					<li><a href="#">Categories</a></li>
					<li><a href="#">Contact Us</a></li>
				</ul>
			</div>

			<div id="right">
				<li><a href="logout">Logout <i class="fas fa-user"></i></a></li>
				<!-- <li><a href="#">Ratings: ${restraunt.getRating() } <i
						class="fas fa-star"></i></a></li>  -->
			</div>
		</nav>
	</header>
	
	<section id="menu_container">
		<div>
			<h1>All order details</h1>
			<h4>Total Orders - ${allorders.size()} </h4>
		</div>
		
		<div id="heading">
			<span>Item</span> <span>Amount</span> <span>Quantity</span>
		</div>
		
		<c:forEach items="${allorders}" var="order">
			<h5>Order id : ${order.getOrderId()} </h5>
			<h5>Restaurant : ${order.getResName()}</h5>
			<c:forEach items="${order.getOrderItems().getVeg() }" var="m">
				<div id="menu_tab">
					<div>${ m.getName() }</div>
					<div>${ m.getPrice() }</div>
					<div>${ m.getQty() }</div>
				</div>
			</c:forEach>
			<c:forEach items="${order.getOrderItems().getNonveg() }" var="m">
				<div id="menu_tab">
					<div>${ m.getName() }</div>
					<div>${ m.getPrice() }</div>
					<div>${ m.getQty() }</div>
				</div>
			</c:forEach>
			<c:forEach items="${order.getOrderItems().getBread() }" var="m">
				<div id="menu_tab">
					<div>${ m.getName() }</div>
					<div>${ m.getPrice() }</div>
					<div>${ m.getQty() }</div>
				</div>
			</c:forEach>
			<c:forEach items="${order.getOrderItems().getBeverage() }" var="m">
				<div id="menu_tab">
					<div>${ m.getName() }</div>
					<div>${ m.getPrice() }</div>
					<div>${ m.getQty() }</div>
				</div>
			</c:forEach>
			<h4>Bill Amount : ${order.getTotalPrice()} </h4>
			<h4>Delivery Address : ${order.getAddress()} </h4>
			<h4>Delivery Instructions : ${order.getComments()} </h4>
			<h4>Contact No.  : ${order.getContact()} </h4>
			<hr/>
		</c:forEach>
	</section>



</body>