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
<title>Insert title here</title>
	<!-- for Bootstrap CSS -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<!-- YOUR own local CSS -->
<link rel="stylesheet" href="/css/main.css"/>
</head>
<body>
<h1 class=" container">Edit Book</h1>
<a href="/dashboard" class="btn btn-primary container">Go to dashboard</a>
<!-- set the id in the route, the name you gave it in the edit getmapping route, in this cae foundBook -->
<form:form action="/edit/${foundBook.id}" method="POST" modelAttribute="foundBook" class="form-control container">
<!-- make sure the model attribute is the same name as the modelattribute in the controller -->
     <input type="hidden" name="_method" value="put">
 
    <p>
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
        <form:label path="description">Description</form:label>
        <form:textarea path="description" class="form-control"/>
        <form:errors path="description" class="text-danger"/>
    </p>
    <!-- the most important part of edit form -->
    <!-- make sure the path is set to the name of the main table name -->
    <form:hidden path="user" />
 
    <input type="submit" value="Submit" class="btn btn-success"/>
</form:form>


</body>
</html>