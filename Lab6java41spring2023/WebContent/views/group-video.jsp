<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Group Video</title>
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
		<table class="table mt-3">
		  <thead class="thead-dark">
		    <tr>
		      <th scope="col">ID</th>
		      <th scope="col">Favorite Count</th>
		      <th scope="col">Newest Date</th>
		      <th scope="col">Oldest Date</th>
		    </tr>
		  </thead>
		  <tbody>
		    <c:forEach var="report" items="${reports}">
		    	<tr>
			      <th scope="row">${report.groupp}</th>
			      <td>${report.likes}</td>
			      <td>${report.newest}</td>
			      <td>${report.oldest}</td>
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