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
<title>Book</title>
	<!-- for Bootstrap CSS -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<!-- YOUR own local CSS -->
<link rel="stylesheet" href="/css/main.css"/>
</head>
<body>


<h1 class="container">Add a Book to your Shelf, <c:out value="${userName}"></c:out>!</h1>
<p class="container"> <a href="/logout">Logout</a></p>
<p class="container"> <a href="/dashboard">Back to dashboard</a></p>

<!-- model attribute to be the same name in your controller -->
<form:form action="/book/new" method="POST" modelAttribute="newBook" class="form-control container">
    <p>
    <!--  Path names will be the same as you have it in your database-->
        <form:label path="title">Title</form:label>
        <form:input path="title" class="form-control"/>
        <form:errors path="title" class="text-danger"/>
    </p>
    <p>
        <form:label path="author">Author</form:label>
        <form:input path="author" class="form-control"/>
        <form:errors path="author" class="text-danger"/>
    </p>
    <p>
        <form:label path="description">My Thoughts</form:label>
        <form:input path="description" class="form-control"/>
        <form:errors path="description" class="text-danger"/>
    </p>  
    <form:hidden path="user" value="${userId}" />
    
    <button type="submit" class="btn btn-primary">Add Book</button>
</form:form>
        


</body>
</html>