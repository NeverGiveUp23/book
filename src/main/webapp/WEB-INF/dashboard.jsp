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
<title>Books</title>
	<!-- for Bootstrap CSS -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<!-- YOUR own local CSS -->
<link rel="stylesheet" href="/css/main.css"/>
</head>
<body>

<div class="container">


<h1>Welcome <c:out value="${userName }"></c:out></h1>
<p> <a href="/logout">Logout</a></p>
<p>Books from everyone's shelf:</p>
<table class="table">
  <thead>
    <tr>
    <th scope="col">ID</th>
      <th scope="col">Title</th>
      <th scope="col">Authors</th>
      <th scope="col">Posted By</th>
    </tr>
  </thead>
  <tbody>
  <!-- var = travel, will be the value name in your table. EX. travel.name or if it was called expenses it will be expenses.name -->
  <c:forEach var = "books" items="${bookList}">
    <tr>
    <td><c:out value="${books.id}"></c:out></td>
      <td> <a href="/display/book/${books.id}"> <c:out value="${books.title}"></c:out></a> </td>
      <td><c:out value="${books.author}"></c:out></td>
      <td><c:out value="${books.user.userName}"></c:out></td>
      
      <!-- with the a tag, make sure to put in the correct href -->
    </tr>
	</c:forEach>   
  </tbody>
</table>
<p> <a href="/book/new">Add a book to my shelf</a></p>

</div> 
</body>
</html>