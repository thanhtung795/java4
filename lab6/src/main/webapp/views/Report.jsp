<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Kết quả</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
	crossorigin="anonymous">
<style>
.table thead {
	background-color: blue;
	color: white;
}

.table tbody tr:nth-child(odd) {
	background-color: #f8f9fa;
}

.table tbody tr:nth-child(even) {
	background-color: #e9ecef;
}

.table tbody tr:hover {
	background-color: #d6d8db;
}
</style>
</head>
<body>
	<div class="container mt-5 text-center">
		<h2 class="mb-4">Danh sách thông tin</h2>
		<h3 class="mb-4">Report</h3>
		<a href="home" class="btn btn-secondary">Quay
                lại</a>
		<table class="table table-bordered table-hover">
			<thead>
				<tr>
					<th>ID</th>
					<th>Favorite count</th>
					<th>Newest Date</th>
					<th>Oldest Date</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="item" items="${videos}">
					<tr>
						<th scope="row">${item.group}</th>
						<td>${item.likes}</td>
						<td>${item.newest}</td>
						<td>${item.oldest}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
		crossorigin="anonymous"></script>
</body>
</html>
