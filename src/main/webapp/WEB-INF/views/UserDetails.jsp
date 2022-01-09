<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    	<meta http-equiv="X-UA-Compatible" content="IE=edge">
    	<meta name="viewport" content="width=device-width, initial-scale=1.0">
    	<title>user details</title>
	    <link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css" integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p" crossorigin="anonymous"/>
	    <link rel="shortcut icon" href="images/logo.png" type="image/x-icon">
	    <link rel="stylesheet" href="resources/style.css">
</head>
<body>

<c:set var="message" value='${requestScope["Msg"]}' />

</h2><c:out value="${Msg}"/>


<!-- 	<h1>User successfully registered!!</h1>
 -->	
	<%-- <p> ${user.getFirstName()} </p> --%>
</body>
</html>