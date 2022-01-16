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
					<li><a href="home#client">Contact Us</a></li>
				</ul>
			</div>

			<div id="right">
				<li><a href="#">User <i class="fas fa-user-tie"></i></a></li>
				<li><a href="logout">Logout <i class="fas fa-user"></i></a></li>
				<!-- <li><a href="#">Ratings: ${restraunt.getRating() } <i
						class="fas fa-star"></i></a></li>  -->
			</div>
		</nav>
	</header>
	<form id="menuitems"
		action="<%=request.getContextPath()%>/checkout" method="post">
		<section id="menu_container">

			<div>
				<h1>Your order details</h1>
				<h4>From Restaurant - ${sessionScope['order'].getResName()} </h4>
			</div>


			<div id="heading">

				<span>ITEM</span> <span>PRICE</span>
				<c:if test='${sessionScope["userType"].equals("ADMIN")}'>
					<span>Add/Update</span>
				</c:if>
				<c:if test='${sessionScope["userType"].equals("CUSTOMER")}'>
					<span>QUANTITY</span>
				</c:if>
			</div>


			<span class="catg">VEG :</span>
			
			<c:forEach items="${sessionScope['order'].getOrderItems().getVeg() }" var="m">

				<div id="menu_tab">
					<div>${ m.getName() }</div>
					<div>${ m.getPrice() }</div>
					<div>${ m.getQty() }</div>
				</div>
			</c:forEach>

			<span class="catg">NonVeg :</span>
			<c:forEach items="${sessionScope['order'].getOrderItems().getNonveg() }" var="m"
				varStatus="count">
				<div id="menu_tab">
					<div>${ m.getName() }</div>
					<div>${ m.getPrice() }</div>
					<div>${ m.getQty() }</div>
				</div>
			</c:forEach>

			<span class="catg">Bread :</span>
			<c:forEach items="${sessionScope['order'].getOrderItems().getBread() }" var="m">
				<div id="menu_tab">
					<div>${ m.getName() }</div>
					<div>${ m.getPrice() }</div>
					<div>${ m.getQty() }</div>
				</div>
			</c:forEach>

			<span class="catg">Beverages :</span>
			<c:forEach items="${sessionScope['order'].getOrderItems().getBeverage() }" var="m">
				<div id="menu_tab">
					<div>${ m.getName() }</div>
					<div>${ m.getPrice() }</div>
					<div>${ m.getQty() }</div>
				</div>
			</c:forEach>
			<hr/>
			<div>Address: <textarea value="" name="address"> </textarea></div>
			<div>Contact: <input type="number" value="" name="contact"></div>
			<div>Delivery Instruction: <input type="text" value="" name="comments"></div>

			<div class="btn">
				<div>Total Amount : ${sessionScope['order'].getTotalPrice()} </div>
				<input type="submit" onClick="checkOut()" value="Checkout"> 
				<input type="button"value="Cancel">
			</div>
		</section>
	</form>
<script>
	function checkOut() {
		var form = document.getElementById("menuitems");
        form.submit();
	}
</script>


</body>