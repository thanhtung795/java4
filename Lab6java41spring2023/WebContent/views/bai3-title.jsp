<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Title Search</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
	crossorigin="anonymous">
	<style>
		.input-group {
			width: 30%;
			margin-left: auto;
			margin-right: auto;
		}
		.btn {
			height: 100%;
		}
		.user {
			width: 30%;
			margin-left: auto;
			margin-right: auto;
			border: 1px solid #678983;
			background: #F0E9D2;
			padding-top: 0.5%;
			color: #181D31;
			border-radius: 10px;
		}
	</style>
</head>
<body>
	<div class="container">
		<form action="/Lab6java41spring2023/bai3-title" method="post">
			<div class="input-group mt-3">
			    <input name="title" type="text" class="form-control" placeholder="Title" value="${keyword}">
			    <div class="input-group-append">
			      <button class="btn btn-secondary" type="submit">
			        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-search" viewBox="0 0 16 16">
					  <path d="M11.742 10.344a6.5 6.5 0 1 0-1.397 1.398h-.001c.03.04.062.078.098.115l3.85 3.85a1 1 0 0 0 1.415-1.414l-3.85-3.85a1.007 1.007 0 0 0-.115-.1zM12 6.5a5.5 5.5 0 1 1-11 0 5.5 5.5 0 0 1 11 0z"/>
					</svg>
			      </button>
			    </div>
			  </div>
		  </form>
		<table class="table mt-3">
		  <thead class="thead-dark">
		    <tr>
		      <th scope="col">ID</th>
		      <th scope="col">Title</th>
		      <th scope="col">Views</th>
		      <th scope="col">Active</th>
		    </tr>
		  </thead>
		  <tbody>
		    <c:forEach var="video" items="${videos}">
		    	<tr>
			      <th scope="row">${video.id}</th>
			      <td>${video.title}</td>
			      <td>${video.views}</td>
			      <td>${video.active}</td>
			    </tr>
		    </c:forEach>
		  </tbody>
		</table>
	</div>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
		crossorigin="anonymous"></script>
</body>
</html>