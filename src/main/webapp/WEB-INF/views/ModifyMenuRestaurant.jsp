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
				<c:if test='${sessionScope["userType"].equals("ADMIN")}'>
					<span>${action }</span>
				</c:if>
				<c:if test="<%=request.getAttribute(\"action\").equals(\"Update\") %>">
					<span>Action</span>
				</c:if>
			</div>


			<span class="catg">VEG :</span>
			<c:forEach items="${menu.getVeg() }" var="m">
				<div id="menu_tab">
					<div hidden>${m.getId() }</div>
					<div>${m.getName() }</div>
					<div>${m.getPrice() }</div>
					<c:if test="<%=request.getAttribute(\"action\").equals(\"Update\") %>">
						<div>
							<input type="text" name="veg_item_qty" />
						</div>
					</c:if>
					<input type="button" value="${action}" onClick="handleChanges(this)"/>
				</div>
			</c:forEach>

			<span class="catg">NonVeg :</span>
			<c:forEach items="${menu.getNonveg() }" var="m">
				<div id="menu_tab">
					<div hidden>${m.getId() }</div>
					<div>${m.getName() }</div>
					<div>${m.getPrice() }</div>
					<c:if test="<%=request.getAttribute(\"action\").equals(\"Update\") %>">
						<div>
							<input type="text" name="non_veg_item_qty" />
						</div>
					</c:if>
					<input type="button" value="${action}" onClick="handleChanges(this)"/>
				</div>
			</c:forEach>

			<span class="catg">Bread :</span>
			<c:forEach items="${menu.getBread() }" var="m">
				<div id="menu_tab">
					<div hidden>${m.getId() }</div>
					<div>${m.getName() }</div>
					<div>${m.getPrice() }</div>
					<c:if test="<%=request.getAttribute(\"action\").equals(\"Update\") %>">
						<div>
							<input type="text" name="bread_item_qty" />
						</div>
					</c:if>
					<input type="button" value="${action}" onClick="handleChanges(this)"/>
				</div>
			</c:forEach>

			<span class="catg">Beverages :</span>
			<c:forEach items="${menu.getBeverage() }" var="m">
				<div id="menu_tab">
					<div hidden>${m.getId() }</div>
					<div>${m.getName() }</div>
					<div>${m.getPrice() }</div>
					<c:if test="<%=request.getAttribute(\"action\").equals(\"Update\") %>">
						<div>
							<input type="text" name="beverages_item_qty" />
						</div>
					</c:if>
					<input type="button" value="${action}" onClick="handleChanges(this)"/>
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
	
		var idToValueMap = new Map();
		var idDeleteSet = new Set();
		var prevAction = "";
		
		function modifiyMenu() {
			
			var form = document.getElementById("menuitems");
			form.submit();
		}
		
		function handleChanges(obj) {
			const parent = obj.parentElement;
			const action = obj.value;
			// This will have new value that need to be updated
			const input = parent.children[3].children[0];
			
			// This will have all the ids which are changed or deleted
			const changes = document.getElementById("menuModification");
			
			// Id is the first child, it is hidden input
			const foodId = parent.children[0].innerText;
			
			if(action == "Update") {
				if(!validateInputNumber(input.value)){
					input.value = "";
					return;
				}
				idToValueMap.set(parseInt(foodId), input.value);
				//console.log(idToValueMap);
				//console.log(getStringFromMap());
				prevAction = obj.value;
				obj.value = "Revert";
				changes.value = getStringFromMap();
			} else if(action == "Revert") {
				if(prevAction == "Delete") {
					idDeleteSet.delete(parseInt(foodId));
					obj.value = prevAction;
					changes.value = getStringFromSet();
					return;
				}
				if(!validateInputNumber(input.value)){
					input.value = "";
					return;
				}
				idToValueMap.delete(parseInt(foodId));
				//console.log(idToValueMap);
				//console.log(getStringFromMap());
				input.value = "";
				obj.value = prevAction;
				changes.value = getStringFromMap();
			} else if(action == "Delete") {
				idDeleteSet.add(parseInt(foodId));
				prevAction = obj.value;
				obj.value = "Revert";
				changes.value = getStringFromSet();
			}
		}
		
		function validateInputNumber(input) {
			if(input == '' || isNaN(input) || parseInt(input) < 1 || parseInt(input) > 1000) {
				alert("Enter valid number between 1 and 1000");
				return false;
			}
			return true;
		}
		
		function getStringFromMap() {
			// If map is empty, nothing to update/delete, return empty string
			if(idToValueMap.size < 1) {
				return "";
			}
			var str = "";
			// convert the map to string
			// eg: 1 => 45, 5 => 89 would be converted to
			// 1#45,5#89
			// That is id1#price1,id2#price2... so on.
			idToValueMap.forEach((k, v) => {
				str += v + "#" + k + ",";
			});
			// remove last comma
			str = str.substr(0, str.length-1);
			return str;
		}
		
		function getStringFromSet() {
			if(idDeleteSet.size < 1) {
				return "";
			}
			var str = "";
			idDeleteSet.forEach(x => {
				str += x + ",";
			});
			str = str.substr(0, str.length-1);
			return str;
		}
	</script>



</body>