<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Kết quả</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
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
		<h3 class="mb-4">Favorite</h3>
		<div class="input-group mb-3">
			<form id="favoriteForm" action="FavoriteServlet" method="post" class="d-flex w-100">
				<div class="form-check d-inline">
					<input class="form-check-input ps-2" type="radio" name="favorite" value="true" id="flexRadioDefault1" ${favorite ? 'checked' : ''}> 
					<label class="form-check-label" for="flexRadioDefault1"> Favorite </label>
				</div>
				<div class="form-check d-inline">
					<input class="form-check-input" type="radio" name="favorite" value="false" id="flexRadioDefault2" ${!favorite ? 'checked' : ''}> 
					<label class="form-check-label" for="flexRadioDefault2"> Not Favorite </label>
				</div>
			</form>
			<a href="home" class="btn btn-secondary">Quay
                lại</a>
		</div>
		<c:if test="${not empty error}">
			<div class="alert alert-danger">${error}</div>
		</c:if>
		<c:if test="${not empty videos}">
			<h4>Favorites</h4>
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
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
	<script>
		document.querySelectorAll('input[name="favorite"]').forEach((elem) => {
			elem.addEventListener('change', function() {
				document.getElementById('favoriteForm').submit();
			});
		});
	</script>
</body>
</html>
