<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
	crossorigin="anonymous">
</head>
<body>

	<div class="container">
		<h1>Bài 2</h1>
		<hr>
		<nav class="navbar navbar-expand-lg bg-body-tertiary">
			<div class="container-fluid">

				<button class="navbar-toggler" type="button"
					data-bs-toggle="collapse" data-bs-target="#navbarNav"
					aria-controls="navbarNav" aria-expanded="false"
					aria-label="Toggle navigation">
					<span class="navbar-toggler-icon"></span>
				</button>
				<div class="collapse navbar-collapse" id="navbarNav">
					<ul class="navbar-nav">
						<li class="nav-item">
						  <a class="nav-link" href="index.jsp">Trang chủ</a>
						</li>
						<li class="nav-item">
						  <a class="nav-link" href="bai1.jsp">Bài 1</a>
						</li>
						<li class="nav-item">
						  <a class="nav-link" href="bai2">Bài 2</a>
						</li>
						<li class="nav-item">
						  <a class="nav-link" href="bai3">Bài 3</a>
						</li>
					  </ul>
				</div>
			</div>
		</nav>
		<div class="row">
			<div class="col-md-6">
				<form action="bai2" method="post" class="mt-2">

					<input class="form-control w-50 " type="text"
						placeholder="Nhập số thứ nhất" name="txtSoThuNhat"> <input
						class="form-control w-50 mt-3 " type="text"
						placeholder="Nhập số thứ hai" name="txtSoThuHai"> 
					<select
						class="form-select w-50" aria-label="Default select example"
						name="txtPhepTinh">
						<option selected>Phép tính</option>
						<option value="+">+</option>
						<option value="-">-</option>
						<option value="*">*</option>
						<option value="/">/</option>
					</select>
					<button type="submit" class="btn btn-primary mt-3">Tính toán</button>
				</form>
			</div>
			<div class="col-md-6 w-50">
				<p>Kết quả tính toán</p>
				<p>Số thứ nhất: ${SoTN}</p>
				<p>Số thứ hai: ${SoTH}</p>
				<p>${SoTN} ${PhepTinh} ${SoTH} = ${ketQua}</p>
				<c:if test="${not empty error}">
					<p style="color: red;">${error}</p>
				</c:if>
			</div>
		</div>
	</div>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
		crossorigin="anonymous"></script>
</body>
</html>