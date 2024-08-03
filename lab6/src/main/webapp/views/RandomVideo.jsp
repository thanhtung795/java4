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
		<h3 class="mb-4">Random video</h3>
		<form action="RandomVideoServlet" method="post">
			<label for="limit">Số video cần lấy:</label> <input type="number"
                name="limit" id="limit" min="1" max="10" required> <input type="submit"
                value="Lấy danh sách"> <a href="home" class="btn btn-secondary">Quay
                lại</a>
		</form>
		</div>
		<c:if test="${not empty videos}">
			<table class="table table-bordered table-hover">
				<thead>
					<tr>
						<th>ID</th>
						<th>Title</th>
						<th>Views</th>
						<th>Active?</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="item" items="${videos}">
						<tr>
							<td>${item.id}</td>
							<td>${item.title}</td>
							<td>${item.views}</td>
							<td>${item.active ? 'Yes' : 'No'}</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</c:if>
	</div>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
		crossorigin="anonymous"></script>
</body>
</html>
