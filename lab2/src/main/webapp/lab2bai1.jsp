`<%@ page language="java" contentType="text/html; charset=UTF-8"
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
	<div class="container-fluid">
		<h1>Lab 2 Bài 1</h1>
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
						<li class="nav-item"><a class="nav-link" href="index.jsp">Trang
								chủ</a></li>
						<li class="nav-item"><a class="nav-link" href="lab2bai1">Bài
								1</a></li>
						<li class="nav-item"><a class="nav-link" href="lab2bai2">Bài
								2</a></li>
						<li class="nav-item"><a class="nav-link" href="lab2bai3">Bài
								3</a></li>
					</ul>
				</div>
			</div>
		</nav>
	</div>
	<div class="container">
		<div class="row">
			<div class="col-md-6">
				<form action="lab2bai1" method="post" class="mt-2">

					<input class="form-control w-50 " type="text"
						placeholder="Nhập cạnh A" name="txtCanhA"
						value="${canhA != null ? canhA : ''}"> <input
						class="form-control w-50 mt-3 " type="text"
						placeholder="Nhập cạnh B" name="txtCanhB"
						value="${canhB != null ? canhB : ''}"> <input
						class="form-control w-50 mt-3 " type="text"
						placeholder="Nhập cạnh C" name="txtCanhC"
						value="${canhC != null ? canhC : ''}">

					<button type="submit" formaction="/lab2/dientich"
						class="btn btn-primary mt-3">Tính diện tích</button>
					<button type="submit" formaction="/lab2/chuvi"
						class="btn btn-primary mt-3">Tính Chu vi</button>
				</form>
			</div>
			<div class="col-md-6 w-50">
				<h2>Kết quả</h2>
				<p>Diện tích hình tam giác: ${dientich}</p>
				<p>Chu vi hình tam giác: ${chuvi}</p>
				<c:if test="${not empty error}">
					<p style="color: red;">${error}</p>
				</c:if>
			</div>
		</div>
	</div>
	</div>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
		crossorigin="anonymous"></script>
</body>
</html>