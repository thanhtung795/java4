<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Chi tiết sản phẩm</title>
<link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
<style>
    body {
        background-color: #f8f9fa;
    }
    .card {
        margin: 20px;
    }
    .card img {
        margin: 10px 0;
    }
    .list-group-item span {
        font-weight: bold;
    }
    .btn-add-to-cart {
        background-color: #28a745;
        color: white;
    }
    .btn-add-to-cart:hover {
        background-color: #218838;
        color: white;
    }
</style>
</head>
<body>
<div class="container mt-5">
    <div class="row justify-content-center">
        <div class="col-md-6">
            <div class="card text-center bg-light">
                <div class="card-header">
                    <h1>${selectedItem.name}</h1>
                </div>
                <div class="card-body">
                    <img class="img-fluid" src="${pageContext.request.contextPath}/lab4bai4/img/${selectedItem.img}" alt="" width="150">
                    <ul class="list-group list-group-flush">
                        <li class="list-group-item">
                            <span>Giá gốc:</span> ${selectedItem.price} $
                        </li>
                        <li class="list-group-item">
                            <span>Giá mới:</span> ${selectedItem.price * (1 - selectedItem.discount)} $
                        </li>
                        <li class="list-group-item">
                            <span>Giảm giá:</span> ${selectedItem.discount * 100} %
                        </li>
                        <li class="list-group-item">
                            <span>Ngày tạo:</span> ${selectedItem.date}
                        </li>
                    </ul>
                    <a href="${pageContext.request.contextPath}/lab4bai4/addCart?name=${selectedItem.name}" class="btn btn-add-to-cart mt-3">Thêm vào giỏ hàng</a>
                </div>
            </div>
        </div>
    </div>
</div>
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
