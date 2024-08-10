<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>User Manager</title>
<link
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
	rel="stylesheet">
</head>
<body>
	<div class="row">
		<div class="col-md-5 mx-auto">
			<div class="container-fluid">
				<h1 class="text-center">User Manager</h1>

				<div class="mt-4">
					<c:if test="${not empty message}">
						<div class="alert alert-success">${message}</div>
					</c:if>
					<c:if test="${not empty error}">
						<div class="alert alert-danger">${error}</div>
					</c:if>
				</div>

				<form class="mt-4" action="/user/UserCRUD" method="post">
					<div class="form-group">
						<label for="id">ID</label> <input name="id" type="text"
							class="form-control" id="id" value="${user.id}" readonly
							aria-describedby="idHelp">
					</div>
					<div class="form-group">
						<label for="password">Password</label> <input name="password"
							type="password" class="form-control" id="password"
							value="${user.password}">
					</div>
					<div class="form-group">
						<label for="fullname">Fullname</label> <input name="fullname"
							type="text" class="form-control" id="fullname"
							value="${user.fullname}">
					</div>
					<div class="form-group">
						<label for="email">Email</label> <input name="email" type="email"
							class="form-control" id="email" value="${user.email}">
					</div>
					<div class="form-group">
						<label>Role:</label>
						<div class="form-check">
							<input id="admin" type="radio" class="form-check-input"
								name="admin" value="true" ${user.admin?'checked':''}> <label
								for="admin" class="form-check-label">Admin</label>
						</div>
						<div class="form-check">
							<input id="user" type="radio" class="form-check-input"
								name="admin" value="false" ${user.admin?'':'checked'}> <label
								for="user" class="form-check-label">User</label>
						</div>
					</div>
					<div class="btn-group" role="group" aria-label="User actions">
						<button formaction="create" class="btn btn-success">
							<i class="fas fa-plus"></i> Create
						</button>
						<button formaction="update" class="btn btn-warning">
							<i class="fas fa-edit"></i> Update
						</button>
						<button formaction="delete" class="btn btn-danger">
							<i class="fas fa-trash"></i> Delete
						</button>
						<button formaction="reset" class="btn btn-info">
							<i class="fas fa-undo"></i> Reset
						</button>
					</div>
				</form>
			</div>
		</div>
		<div class="col-md-7 ">
			<div class="input-group mb-3 mt-3">
				<form action="search" method="post">
					<div class="input-group">
						<input type="text" class="form-control" name="keyword"
							aria-describedby="btnGroupAddon2">
						<button class="btn btn-outline-secondary" type="submit"
							id="button-addon2">Tìm kiếm</button>
					</div>
				</form>
				
			</div>
			<form class = "d-flex m-3" action="filter" method="post" id="filterForm">

					<div class="form-check">
						<input id="admin" type="radio" class="form-check-input"
							name="roleFilter" value="admin"
							${param.roleFilter == 'admin' ? 'checked' : ''}> <label
							for="admin" class="form-check-label">Admin</label>
					</div>
					<div class="form-check">
						<input id="user" type="radio" class="form-check-input"
							name="roleFilter" value="user"
							${param.roleFilter == 'user' ? 'checked' : ''}> <label
							for="user" class="form-check-label">User</label>
					</div>
					<div class="form-check">
						<input id="all" type="radio" class="form-check-input"
							name="roleFilter" value="all"
							${param.roleFilter == 'all' ? 'checked' : ''}> <label
							for="all" class="form-check-label">All</label>
					</div>

				</form>
			<div class="container-fluid">
				<table class="table table-hover table-striped table-bordered m-auto">
					<thead class="thead-dark">
						<tr>
							<th scope="col">ID</th>
							<th scope="col">Password</th>
							<th scope="col">Name</th>
							<th scope="col">Email</th>
							<th scope="col">Role</th>
							<th scope="col">Action</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="item" items="${users}">
							<tr>
								<td>${item.id}</td>
								<td>${item.password}</td>
								<td>${item.fullname}</td>
								<td>${item.email}</td>
								<td>${item.admin ? 'Admin' : 'User'}</td>
								<td><a href="edit?id=${item.id}">Edit</a> <a
									href="delete?id=${item.id}">Remove</a></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
			<div class="container-fluid">
				<div class="row">
					<nav aria-label="Page navigation example" class="m-auto">
						<ul class="pagination m-auto">
							<c:forEach var="i" begin="1" end="${totalPages}">
								<li class="page-item ${i == page ? 'active' : ''}"><a
									class="page-link" href="?page=${i}">${i}</a></li>
							</c:forEach>
						</ul>
					</nav>
				</div>
			</div>

		</div>
	</div>
	<script>
    document.addEventListener('DOMContentLoaded', function () {
        // Lấy đối tượng form và các radio button
        const filterForm = document.getElementById('filterForm');
        const roleRadios = filterForm.querySelectorAll('input[name="roleFilter"]');
        
        // Lắng nghe sự thay đổi của các radio button
        roleRadios.forEach(radio => {
            radio.addEventListener('change', function () {
                filterForm.submit();
            });
        });
    });
</script>

	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.3/dist/umd/popper.min.js"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
