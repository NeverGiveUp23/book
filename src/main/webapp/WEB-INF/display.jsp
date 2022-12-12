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

<div class="container">
<!--  grabbing the user via userName, It could be calud whatever that name you call in your DB-->
<h1><c:out value="${user.userName}"></c:out> read 
<!-- book in "book.title" and "book.author" is the name we gave in ln 102 of the controller -->
<!-- it is associated with the book name in ln 94 in the controller -->
<c:out value="${book.title}"></c:out> by <c:out value="${book.author}"></c:out>
</h1>

<h2>Here are <c:out value="${user.userName}"></c:out>'s thoughts:</h2>

<div class="">
<!-- book in "book.description" is the name we gave in ln 102 of the controller -->
<!-- it is associated with the book name in ln 94 in the controller -->
<p><c:out value="${book.description}"></c:out></p>
<!-- session scope and c:if, is checking if the book associated with the user and id is the person that posted it -->
<!--  if so, it will display the edit and delete button for that user-->
<c:if test="${sessionScope.userId == book.user.id}">
  <%-- show the edit and delete buttons --%>
  <!-- make sure to pass in the correct naming convention for the edit and delete route -->
  <!--  tried to use user.id instead but, the id we want is from the book, and book has the user tied to it-->
  <a class="btn btn-success" href="/book/${book.id}/edit"<c:out value="${book.id}" />>Edit</a>
  <!-- make a form for the delete button passing in the naming conv and id -->
  <!-- remember the hidden input -->
        <form action="/delete/${book.id}" method="post">
    		<input type="hidden" name="_method" value="delete">
   			 <input type="submit" value="Delete" class="btn btn-danger">
		</form>
</c:if>
</div>
<a href="/dashboard">Go to dashboard</a>


</div>




</body>
</html>