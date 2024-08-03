<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Thông Tin Nhân Viên</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <div class="container mt-5 text-center">
        <h1 class="text-center">Thông Tin Nhân Viên</h1>
        <ul class="list-group">
        <li class="list-group-item">
                Hình ảnh <br> 
                <img src="files/${staff.photo}" alt="Hình ảnh" class="img-thumbnail" style="max-width: 150px;">
            </li>
            <li class="list-group-item">Họ và tên: <b>${staff.fullname}</b></li>
            <li class="list-group-item">Ngày sinh: <b>${staff.birthday}</b></li>
            <li class="list-group-item">Giới tính: <b>${staff.gender?"Nam":"Nữ"}</b></li>
            <li class="list-group-item">Quốc tịch: <b>${staff.country}</b></li>
            <li class="list-group-item">TT hôn nhân: <b>${staff.married?"Đã kết hôn":"Chưa kết hôn"}</b></li>
            <li class="list-group-item">Sở thích: <b>${staff.hobbies}</b></li>
            <li class="list-group-item">Ghi chú: <b>${staff.notes}</b></li>
        </ul>
    </div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
