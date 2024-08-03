<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Favorite Search</title>
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
		.label {
			color: #678983;
			font-size: 20px;
		}
		.lab,.input {
			margin-left: 7px!important;
		}
	</style>
</head>
<body>
	<div class="container">
		<form action="/Lab6java41spring2023/favorite-search" method="post">
			<div class="input-group mt-3">
			    <Label class="label" for="like">Favorite</Label>
			    <input ${favorite?'checked':''} onClick="fvAction(true)" class="input" name="favorite" type="radio" id="like">
			    <Label class="label lab" for="dontLike">Not Favorite</Label>
			    <input ${favorite?'':'checked'} onClick="fvAction(false)" class="input" name="favorite" type="radio" id="dontLike">
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
		    <c:forEach var="video" items="${Video}">
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
  	<script>
		function fvAction(x){
			window.location = "/Lab6java41spring2023/favorite-search?favorite="+x;
		}
	</script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
		crossorigin="anonymous"></script>
</body>
</html>