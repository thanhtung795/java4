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
        <h3 class="mb-4">Video ID</h3>
        <div class="input-group mb-3">
            <form action="VideoIdSServler" method="post" class="d-flex w-100">
                <input type="text" name="id" class="form-control" placeholder="Nhập Video ID">
                <button class="btn btn-outline-secondary" type="submit" id="button-addon2">Search</button>
            </form>
            <a href="home" class="btn btn-secondary">Quay
                lại</a>
        </div>
        <c:if test="${not empty error}">
            <div class="alert alert-danger">${error}</div>
        </c:if>
        <c:if test="${not empty users}">
            <h4>Favorites</h4>
            <table class="table table-bordered table-hover">
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Fullname</th>
                        <th>Email</th>
                        <th>Admin?</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="item" items="${users}">
                        <tr>
                            <td>${item.id}</td>
                            <td>${item.fullname}</td>
                            <td>${item.email}</td>
                            <td>${item.admin ? 'Yes' : 'No'}</td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </c:if>
    </div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</body>
</html>
