<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Trang chủ</title>
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
<link
    href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
    rel="stylesheet"
    integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
    crossorigin="anonymous">
<style>
a {
    text-decoration: none;
}
</style>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"
    integrity="sha384-KyZXEAg3QhqLMpG8r+8fhAXLR8t7r+e2K8k+GI6Ztv9l5hdGAk5ERk+QSOO2x3uT"
    crossorigin="anonymous"></script>
<script>
  
</script>
</head>
<body>
    <div class="container">
		<a href="TrangChu.jsp">Trang Chu</a>
        <div class="row">
            <c:forEach var="item" items="${items}">
                <div class="col-md-4">
                    <div class="card text-center bg-light">
                        <div class="card-header">
                            <h1>${item.name}</h1>
                        </div>
                        <div class="card-body">
                            <img class="img-fluid" src="../img/${item.img}" alt=""
                                width="150">
                            <ul class="list-group list-group-flush">
                                <li class="list-group-item"><span>Giá gốc: <fmt:formatNumber
                                        value="${item.price}" pattern="#,##0" /> $
                                </span></li>
                                <li class="list-group-item"><span>Giá mới: <fmt:formatNumber
                                        value="${item.price}" pattern="#,##0" /> $
                                </span></li>
                            </ul>
                            <c:set var="newPrice" value="${item.price * item.discount}" />
                            <c:choose>
                                <c:when test="${item.price < 100}">
                                    Giá thấp
                                </c:when>
                                <c:when test="${item.price > 100}">
                                    Giá cao
                                </c:when>
                                <c:otherwise>
                                    Bình thường
                                </c:otherwise>
                            </c:choose>
                        </div>
                        <div class="card-footer">
                            <p>
                                Ngày: <span><fmt:formatDate value="${item.date}"
                                        pattern="dd/MM/yyyy" /></span>
                            </p>
                        </div>
                        <!-- Nút button mua hàng -->
                        <a href="${pageContext.request.contextPath}/addCart?name=${item.name}" class="btn btn-primary mt-3">Mua hàng</a>
                    </div>
                </div>
            </c:forEach>
        </div>
    </div>
    <div class="container mt-5">
        <div class="row">
            <div class="col-md-12">
                <h2 class="text-center">Giỏ hàng của bạn</h2>
                <table class="table table-bordered mt-4">
                    <thead>
                        <tr>
                            <th>Tên sản phẩm</th>
                            <th>Hình ảnh</th>
                            <th>Giá</th>
                            <th>Số lượng</th>
                            <th>Tổng cộng</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="item" items="${cartsItems}">
                            <tr>
                                <td>${item.name}</td>
                                <td><img
                                    src="${pageContext.request.contextPath}/img/${item.img}"
                                    alt="${item.name}" width="50"></td>
                                <td>${item.price}$</td>
                                <td>1</td>
                                <!-- Giả định số lượng là 1, bạn có thể thêm logic để quản lý số lượng -->
                                <td>${item.price}$</td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
                <div class="text-right">
                    <!-- Nút thanh toán -->
                    <a href = "checkout" class="btn btn-primary">Thanh toán</a>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
