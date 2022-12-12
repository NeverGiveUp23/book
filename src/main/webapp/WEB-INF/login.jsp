<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
               <!-- New line below to use the JSP Standard Tag Library -->
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core"%>
<%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>BookClub</title>
	<!-- for Bootstrap CSS -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<!-- YOUR own local CSS -->
<link rel="stylesheet" href="/css/main.css"/>
</head>
<body>

<div class="container">


<h1>Book Club</h1>
<p>A place for friends to share thoughts on books</p>
</div>

<div class="container mt-5">
<h1>Register</h1>
<!-- model attribute to be the same name in your controller -->
 <form:form action="/register" method="POST" modelAttribute="newUser" class="form-control container">
    <div class="form-group">
    <!--  Path names will be the same as you have it in your database-->
        <form:label path="userName">Name:</form:label>
        <form:input path="userName" class="form-control"/>
        <form:errors path="userName" class="text-danger"/>
    </div>

    <div class="form-group">
        <form:label path="email">Email:</form:label>
        <form:input path="email" class="form-control"/>
        <form:errors path="email" class="text-danger"/>
    </div>
    <div class="form-group">
        <form:label path="password">Password:</form:label>
        <form:input path="password" type="password" class="form-control"/>
        <form:errors path="password" class="text-danger"/>
    </div>
    <div class="form-group">
        <form:label path="confirm">Confirm Password:</form:label>
        <form:input type="password" path="confirm" class="form-control"/>
        <form:errors path="confirm" class="text-danger"/>     
    </div>    
    <button type="submit" class="btn btn-primary">Register</button>
  </form:form>   

<h1>Login</h1>
<form:form action="/login" method="POST" modelAttribute="newLogin" >
<!--  login form-->
    <div class="form-group">
        <form:label path="email">Email:</form:label>
        <form:input path="email" class="form-control"/>
        <form:errors path="email" class="text-danger"/>
    </div>
    <div class="form-group">
        <form:label path="password">Password:</form:label>
        <form:input path="password" type="password" class="form-control"/>
        <form:errors path="password" class="text-danger"/>
    </div>
    <button type="submit" class="btn btn-primary">Login</button>

</form:form>   


</div>



</body>
</html>