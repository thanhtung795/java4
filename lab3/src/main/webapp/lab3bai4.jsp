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
	<div class="container-fluid">
		<h1>Lab 3 Bài 4</h1>
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
						<li class="nav-item"><a class="nav-link" href="lab3bai1">Bài
								1</a></li>
						<li class="nav-item"><a class="nav-link" href="lab3bai2">Bài
								2</a></li>
						<li class="nav-item"><a class="nav-link" href="lab3bai3">Bài
								3</a></li>
						<li class="nav-item"><a class="nav-link" href="lab3bai4">Bài
								4</a></li>
					</ul>
				</div>
			</div>
		</nav>
	</div>
	<div class="container mt-2">
		<div class="row justify-content-center">
			<div class="col-md-8">
				<div class="card bg-l">
					<div class="card-header bg-primary">
						<h3 class="card-title text-center">Email Form</h3>
					</div>
					<div class="card-body bg-secondary">
						<h2>${message}</h2>
						<h2>${error}</h2>
						<form role="form" class="form-horizontal" action="lab3bai4"
							method="post" enctype="multipart/form-data">
							<div class="form-group row mb-3">
								<label class="col-sm-2 col-form-label" for="inputForm">
									<span class="glyphicon glyphicon-user"></span> Form
								</label>
								<div class="col-sm-10">
									<input type="email" value="vothanhtung795@gmail.com"
										name="form" class="form-control" id="inputForm"
										placeholder="Form">
								</div>
							</div>
							<div class="form-group row">
								<label class="col-sm-2 col-form-label" for="inputTo"> <span
									class="glyphicon glyphicon-user"></span> To
								</label>
								<div class="col-sm-10">
									<input type="email" class="form-control" name="to" id="inputTo"
										placeholder="comma separated list of recipients">
								</div>
							</div>
							<div class="form-group row mt-3">
								<label class="col-sm-2 col-form-label" for="inputSubject">
									<span class="glyphicon glyphicon-list-alt"></span> Subject
								</label>
								<div class="col-sm-10">
									<input type="text" class="form-control" name="subject"
										id="inputSubject" placeholder="subject">
								</div>
							</div>
							<div class="form-group row mt-3">
								<label class="col-sm-2 col-form-label" for="inputBody">
									<span class="glyphicon glyphicon-list"></span> Message
								</label>
								<div class="col-sm-10">
									<textarea class="form-control" name="message" id="inputBody"
										rows="8"></textarea>
								</div>
								<div class="form-group row mt-3">
									<label class="col-sm-2 col-form-label" for="inputFile">File</label>
									<div class="col-sm-10">
										<input type="file" name="file" class="form-control"><br>
									</div>
								</div>
							</div>
							<div class="form-group row mt-3">
								<div class="col-sm-10 offset-sm-2">
									<button type="submit" class="btn btn-primary">Send</button>
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>

</html>