<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

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
		<h3 class="mb-4">Favorites video time</h3>
		<c:if test="${not empty error}">
			<div class="alert alert-danger">${error}</div>
		</c:if>
		<div class="input-group mb-3">
			<form id="findVideoMonth" action="findVideoMonth" method="post"
				class="d-flex w-100">
				<div class="form-check d-inline">
					<input class="form-check-input" type="checkbox" name="month"
						value="1" id="flexCheckDefault"
						<c:if test="${fn:contains(selectedMonths, 1)}">checked</c:if>>
					<label class="form-check-label" for="flexCheckDefault"> 1 </label>
				</div>
				<div class="form-check d-inline ms-2">
					<input class="form-check-input" type="checkbox" name="month"
						value="2" id="flexCheckChecked"
						<c:if test="${fn:contains(selectedMonths, 2)}">checked</c:if>>
					<label class="form-check-label" for="flexCheckChecked"> 2 </label>
				</div>
				<div class="form-check d-inline ms-2">
					<input class="form-check-input" type="checkbox" name="month"
						value="3" id="flexCheckChecked"
						<c:if test="${fn:contains(selectedMonths, 3)}">checked</c:if>>
					<label class="form-check-label" for="flexCheckChecked"> 3 </label>
				</div>
				<!-- Lặp lại cho các tháng còn lại -->
				<div class="form-check d-inline ms-2">
					<input class="form-check-input" type="checkbox" name="month"
						value="4" id="flexCheckChecked"
						<c:if test="${fn:contains(selectedMonths, 4)}">checked</c:if>>
					<label class="form-check-label" for="flexCheckChecked"> 4 </label>
				</div>
				<div class="form-check d-inline ms-2">
					<input class="form-check-input" type="checkbox" name="month"
						value="5" id="flexCheckChecked"
						<c:if test="${fn:contains(selectedMonths, 5)}">checked</c:if>>
					<label class="form-check-label" for="flexCheckChecked"> 5 </label>
				</div>
				<div class="form-check d-inline ms-2">
					<input class="form-check-input" type="checkbox" name="month"
						value="6" id="flexCheckChecked"
						<c:if test="${fn:contains(selectedMonths, 6)}">checked</c:if>>
					<label class="form-check-label" for="flexCheckChecked"> 6 </label>
				</div>
				<div class="form-check d-inline ms-2">
					<input class="form-check-input" type="checkbox" name="month"
						value="7" id="flexCheckChecked"
						<c:if test="${fn:contains(selectedMonths, 7)}">checked</c:if>>
					<label class="form-check-label" for="flexCheckChecked"> 7 </label>
				</div>
				<div class="form-check d-inline ms-2">
					<input class="form-check-input" type="checkbox" name="month"
						value="8" id="flexCheckChecked"
						<c:if test="${fn:contains(selectedMonths, 8)}">checked</c:if>>
					<label class="form-check-label" for="flexCheckChecked"> 8 </label>
				</div>
				<div class="form-check d-inline ms-2">
					<input class="form-check-input" type="checkbox" name="month"
						value="9" id="flexCheckChecked"
						<c:if test="${fn:contains(selectedMonths, 9)}">checked</c:if>>
					<label class="form-check-label" for="flexCheckChecked"> 9 </label>
				</div>
				<div class="form-check d-inline ms-2">
					<input class="form-check-input" type="checkbox" name="month"
						value="10" id="flexCheckChecked"
						<c:if test="${fn:contains(selectedMonths, 10)}">checked</c:if>>
					<label class="form-check-label" for="flexCheckChecked"> 10
					</label>
				</div>
				<div class="form-check d-inline ms-2">
					<input class="form-check-input" type="checkbox" name="month"
						value="11" id="flexCheckChecked"
						<c:if test="${fn:contains(selectedMonths, 11)}">checked</c:if>>
					<label class="form-check-label" for="flexCheckChecked"> 11
					</label>
				</div>
				<div class="form-check d-inline ms-2">
					<input class="form-check-input" type="checkbox" name="month"
						value="12" id="flexCheckChecked"
						<c:if test="${fn:contains(selectedMonths, 12)}">checked</c:if>>
					<label class="form-check-label" for="flexCheckChecked"> 12
					</label>
				</div>
			</form>
			<a href="home" class="btn btn-secondary">Quay
                lại</a>
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
	<script>
        // Lấy tất cả các checkbox
        const checkboxes = document.querySelectorAll('input[name="month"]');
        
        // Thêm sự kiện change cho mỗi checkbox
        checkboxes.forEach(checkbox => {
            checkbox.addEventListener('change', function() {
                // Submit form khi bất kỳ checkbox nào thay đổi
                document.getElementById('findVideoMonth').submit();
            });
        });
    </script>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
		crossorigin="anonymous"></script>
</body>
</html>
