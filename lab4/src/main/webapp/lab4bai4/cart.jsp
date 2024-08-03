<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Giỏ hàng</title>
<link
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
	rel="stylesheet">
<style>
body {
	background-color: #f8f9fa;
}

.table thead th {
	background-color: #343a40;
	color: white;
}

.table tfoot td {
	font-weight: bold;
}

.btn-checkout {
	background-color: #007bff;
	color: white;
}

.btn-checkout:hover {
	background-color: #0056b3;
}
</style>
</head>
<body>
	<div class="container mt-5">
		<div class="row">
			<div class="col-md-12">
			<td><a href = "${pageContext.request.contextPath}/lab4/detailSevlerbai4">Trang Chủ</a></td>
				<h2 class="text-center">Giỏ hàng của bạn</h2>
				<table class="table table-bordered mt-4">
					<thead>
						<tr>
							<th>Tên sản phẩm</th>
							<th>Hình ảnh</th>
							<th>Giá</th>
							<th>Số lượng</th>
							<th>Tổng cộng</th>
							<th></th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="item" items="${sessionScope.cart}">
							<tr>
								<td>${item.name}</td>
								<td><img
									src="${pageContext.request.contextPath}/lab4bai4/img/${item.img}"
									alt="${item.name}" width="50"></td>
								<td>${item.price}$</td>
								<td>1</td>
								<!-- Giả định số lượng là 1, bạn có thể thêm logic để quản lý số lượng -->
								<td>${item.price}$</td>
								<td><a href = "${pageContext.request.contextPath}/lab4bai4/deleteItem?name=${item.name}">Delete</a></td>
							</tr>
						</c:forEach>
					</tbody>
					<tfoot>
						<tr>
							<td colspan="4" class="text-right">Tổng cộng:</td>
							<td>${sessionScope.totalPrice}$</td>
						</tr>
					</tfoot>

				</table>
				<div class="text-right">
					<a href="${pageContext.request.contextPath}/lab4bai4/checkout"
						class="btn btn-checkout">Thanh toán</a>
				</div>
			</div>
		</div>
	</div>
	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
