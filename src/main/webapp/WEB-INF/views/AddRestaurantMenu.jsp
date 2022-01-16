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
<title>Admin</title>
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
				<c:if test='${sessionScope["userType"].equals("ADMIN")}'>
					<li><a href="logout">Logout <i class="fas fa-user"></i></a></li>
				</c:if>

				<li><a href="#">Ratings: ${restraunt.getRating() } <i
						class="fas fa-star"></i></a></li>
			</div>
		</nav>
	</header>
	<form id="menuitems"
		action="<%=request.getContextPath()%>/${operation}" method="post">
		<section id="menu_container">

			<div>
				<h1>Welcome To ${restraunt.getName() } Restaurant</h1>
			</div>

			<div id="heading">

				<span>ITEM</span> 
				<span>PRICE</span>
			</div>

			<div>
				<table>
					<tr>
						<td>
							<span>Food Item Name:</span>
							<input style="width:300px;" type="text" value=""/>
							<span>Food Item Price:</span>
							<input style="width:300px;" type="text" value=""/>
							<select>
								<option value="Veg">Veg</option>
								<option value="Non-Veg">Non-Veg</option>
								<option value="Bread">Bread</option>
								<option value="Beverage">Beverage</option>
							</select>
							<input type="button" style="width:100px;" value="Add" onClick="addItem(this)"/>
						</td>
					</tr>
				</table>
			</div>

			<span class="catg">VEG :</span>
			<c:forEach items="${menu.getVeg() }" var="m">
				<div id="menu_tab">
					<div hidden>${m.getId() }</div>
					<div>${m.getName() }</div>
					<div>${m.getPrice() }</div>
				</div>
			</c:forEach>

			<span class="catg">NonVeg :</span>
			<c:forEach items="${menu.getNonveg() }" var="m">
				<div id="menu_tab">
					<div hidden>${m.getId() }</div>
					<div>${m.getName() }</div>
					<div>${m.getPrice() }</div>
				</div>
			</c:forEach>

			<span class="catg">Bread :</span>
			<c:forEach items="${menu.getBread() }" var="m">
				<div id="menu_tab">
					<div hidden>${m.getId() }</div>
					<div>${m.getName() }</div>
					<div>${m.getPrice() }</div>
				</div>
			</c:forEach>

			<span class="catg">Beverages :</span>
			<c:forEach items="${menu.getBeverage() }" var="m">
				<div id="menu_tab">
					<div hidden>${m.getId() }</div>
					<div>${m.getName() }</div>
					<div>${m.getPrice() }</div>
				</div>
			</c:forEach>

			<div class="btn">
				<input type="reset" value="Reset All">
				<input type="submit" onClick="modifiyMenu()" value="${action} ">
			</div>
		</section>
		<input type="hidden" id="resname" name="resname"
			value="${restraunt.getName() }">
		<input type="hidden" id="restid" name="restid"
			value="${restraunt.getId() }">
		<input type="hidden" id="menuModification" name="menuModification" value="" />
	</form>
	
	<script>
		var foodMap = new Map();
		
		function modifiyMenu() {
			var form = document.getElementById("menuitems");
			document.getElementById("menuModification").value = getStringFromMap();
			form.submit();
		}
		
		function addItem(node) {
			const tdElement = node.parentElement;
			
			const foodName = tdElement.children[1].value;
			const foodPrice = tdElement.children[3].value;
			const foodCategory = tdElement.children[4].value;
			
			if(foodName == null || foodName.trim() == "") {
				alert("Give valid input for Food Name!!");
				return;
			}
			if(foodPrice == null || isNaN(foodPrice)) {
				alert("Give valid input for Food Price!!");
				return;
			}
			
			const trElement = tdElement.parentElement;
			var clone = trElement.cloneNode(true);
			
			// hide add button and disable other fields
			tdElement.children[5].setAttribute("hidden", true);
			tdElement.children[1].setAttribute("disabled", true);
			tdElement.children[3].setAttribute("disabled", true);
			tdElement.children[4].setAttribute("disabled", true);
			
			
			// clear value of input fields in cloned node
			clone.children[0].children[1].value = "";
			clone.children[0].children[3].value = "";
			
			// append newly cloned row
			trElement.parentElement.appendChild(clone);
			
			foodMap.set(foodName, foodPrice + "$" + foodCategory);
		}
		
		function getStringFromMap() {
			// If map is empty, nothing to update/delete, return empty string
			if(foodMap.size < 1) {
				return "";
			}
			var str = "";
			// convert the map to string
			// eg: food1 => 45, food2 => 89 would be converted to
			// food1$45##food2$89
			// That is id1#price1,id2#price2... so on.
			foodMap.forEach((k, v) => {
				str += v + "$" + k + "##";
			});
			// remove last 2 ##
			str = str.substr(0, str.length-2);
			return str;
		}
	</script>
</body>
</html>