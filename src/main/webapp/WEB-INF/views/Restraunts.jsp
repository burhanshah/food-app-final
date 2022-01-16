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
<title>Habib</title>
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
					<li><a href="WelcomeUser">Restaurants</a></li>
					<li><a href="#">Categories</a></li>
					<li><a href="home#client">Contact Us</a></li>
				</ul>
			</div>

			<div id="right">
				<!--  <li><a href="adminlogin">Admin <i class="fas fa-user-tie"></i></a></li>-->
				<c:if test='${sessionScope["userType"] == null}'>
					<li><a href="userlogin">Login <i class="fas fa-user"></i></a></li>
				</c:if>
				<c:if test='${sessionScope["userType"].equals("CUSTOMER")}'>
					<li><a href="logout">Logout <i class="fas fa-user"></i></a></li>
				</c:if>
				
				<li><a href="#">Ratings: ${restraunt.getRating() } <i
						class="fas fa-star"></i></a></li>
			</div>
		</nav>
	</header>
	<form id="menuitems" action="<%= request.getContextPath() %>/OrderServlet" method="post">
		<section id="menu_container">

			<div>
				<h1>Welcome To ${restraunt.getName() } Resturaunt</h1>
			</div>


			<div id="heading">

				<span>ITEM</span> <span>PRICE</span>
				<!--  <c:if test="${session.getAttribute(\"userType\").equals(\"ADMIN\")}">>
				<span>A QUANTITY</span>
			</c:if>
			<c:if test="${session.getAttribute(\"userType\").equals(\"CUSTOMER\")}">>
				<span>C QUANTITY</span>
			</c:if>
-->

				<c:if test='${sessionScope["userType"].equals("ADMIN")}'>
					<span>Add/Update</span>
				</c:if>
				<c:if test='${sessionScope["userType"].equals("CUSTOMER")}'>
					<span>QUANTITY</span>
				</c:if>
			</div>


			<span class="catg">VEG :</span>
			<c:forEach items="${menu.getVeg() }" var="m">
				<div id="menu_tab">
					<div>${m.getName() }</div>
					<div>${m.getPrice() }</div>
					<div><input type="number" name="veg_item_qty" min="0" max="100" /></div>
				</div>
			</c:forEach>

			<span class="catg">NonVeg :</span>
			<c:forEach items="${menu.getNonveg() }" var="m">
				<div id="menu_tab">
					<div>${m.getName() }</div>
					<div>${m.getPrice() }</div>
					<div><input type="number" name="non_veg_item_qty" min="0" max="100" /></div>
				</div>
			</c:forEach>

			<span class="catg">Bread :</span>
			<c:forEach items="${menu.getBread() }" var="m">
				<div id="menu_tab">
					<div>${m.getName() }</div>
					<div>${m.getPrice() }</div>
					<div><input type="number" name="bread_item_qty" min="0" max="100" /></div>
				</div>
			</c:forEach>

			<span class="catg">Beverages :</span>
			<c:forEach items="${menu.getBeverage() }" var="m">
				<div id="menu_tab">
					<div>${m.getName() }</div>
					<div>${m.getPrice() }</div>
					<div><input type="number" name="beverages_item_qty" min="0" max="100" /></div>
				</div>
			</c:forEach>

			<div class="btn">
				<c:if test='${sessionScope["userType"].equals("CUSTOMER")}'>
					<input type="submit" onClick="placeOrder()" value="Place Order">
					<input type="reset" value="Reset All">
				</c:if>
				<c:if test='${sessionScope["userType"].equals("ADMIN")}'>
					<input type="button" value="Add Items">
				</c:if>
				<c:if test='${sessionScope["userType"] == null}'>
					<h4>You need to login to place order</h4>
				</c:if>
				
			</div>
		</section>
		<input type="hidden" id="resname" name="resname" value="${restraunt.getName() }" >
	</form>


<script>
	function placeOrder() {
		var form = document.getElementById("menuitems");
        form.submit();
	}
</script>



</body>