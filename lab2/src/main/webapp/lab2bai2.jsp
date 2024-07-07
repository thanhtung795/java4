<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
  <!DOCTYPE html>
  <html>

  <head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
      integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
  </head>

  <body>
    <div class="container-fluid">
      <h1>Lab 2 Bài 2</h1>
      <hr>
      <nav class="navbar navbar-expand-lg bg-body-tertiary">
        <div class="container-fluid">
          <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav"
            aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
          </button>
          <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav">
              <li class="nav-item">
                <a class="nav-link" href="index.jsp">Trang chủ</a>
              </li>
              <li class="nav-item">
                <a class="nav-link" href="lab2bai1">Bài 1</a>
              </li>
              <li class="nav-item">
                <a class="nav-link" href="lab2bai2">Bài 2</a>
              </li>
              <li class="nav-item">
                <a class="nav-link" href="lab2bai3">Bài 3</a>
              </li>
            </ul>
          </div>
        </div>
      </nav>
    </div>
    <div class="container">
      <div class="container bootstrap snippets bootdey">
        <h1 class="text-primary">Đăng ký</h1>
        <hr>
        <div class="row">
          <!-- edit form column -->
          <div class="personal-info">
            <form class="form-horizontal" action="lab2bai2" role="form" method="post">
              <div class="form-group">
                <label class="col-lg-3 control-label">Tên đăng nhập</label>
                <div class="col-lg-8">
                  <input class="form-control" type="text" name="txtTenDangNhap" value="${tenDangNhap}">
                </div>
                <c:if test="${not empty errorTDN}">
                  <p style="color: red;">${errorTDN}</p>
                </c:if>
              </div>
              <div class="form-group">
                <label class="col-lg-3 control-label">Mật khẩu</label>
                <div class="col-lg-8">
                  <input class="form-control" type="password" name="txtMatKhau" value="${MatKhau }">
                </div>
                <c:if test="${not empty errorMK}">
                  <p style="color: red;">${errorMK}</p>
                </c:if>
              </div>
              <div class="form-group">
                <label class="col-lg-3 control-label">Giới tính</label>
                <div class="col-lg-8 d-flex ">
                  <div class="form-check">
                    <label class="form-check-label">
                      <input type="radio" class="form-check-input" name="gioiTinh" id="nam" value="true">
                      Nam
                    </label>
                  </div>
                  <div class="form-check me-3">
                    <label class="form-check-label">
                      <input type="radio" class="form-check-input" name="gioiTinh" id="nu" value="false">
                      Nữ
                    </label>
                  </div>
                </div>
                <c:if test="${not empty errorGT}">
                  <p style="color: red;">${errorGT}</p>
                </c:if>
              </div>
              <div class="form-check">
                <input id="my-input" class="form-check-input" type="checkbox" name="chkGD" value="true">
                <label for="my-input" class="form-check-label">Gia Đình</label>
              </div>
              <div class="form-group w-25">
                <label for="my-select">Quốc gia</label>
                <select id="my-select" class="form-control" name="QuocGia">
                  <option value="VN">VN</option>
                  <option value="US">US</option>
                </select>
              </div>
              <div class="form-group d-flex">
                <label for="">Sở thích: </label>
                <div class="form-check">
                  <input id="valorant" class="form-check-input" type="checkbox" name="soThich" value="Valorant">
                  <label for="valorant" class="form-check-label">Valorant</label>
                </div>
                <div class="form-check">
                  <input id="lol" class="form-check-input" type="checkbox" name="soThich" value="LOL">
                  <label for="lol" class="form-check-label">LOL</label>
                </div>
                <div class="form-check">
                  <input id="cs2" class="form-check-input" type="checkbox" name="soThich" value="CS2">
                  <label for="cs2" class="form-check-label">CS2</label>
                </div>
                <div class="form-check">
                  <input id="code" class="form-check-input" type="checkbox" name="soThich" value="Code">
                  <label for="code" class="form-check-label">Code</label>
                </div>
                <div class="form-check">
                  <input id="fix-bug" class="form-check-input" type="checkbox" name="soThich" value="Fix Bug">
                  <label for="fix-bug" class="form-check-label">Fix bug</label>
                </div>
                <hr>
              </div>
               <c:if test="${not empty errorST}">
                  <p style="color: red;">${errorST}</p>
                </c:if>
              <div class="form-group">
                <label for="my-input">Ghi chú</label>
                <textarea id="my-input" class="form-control" name="txtGhiChu"></textarea>
              </div>
              <button type="submit" class="btn btn-primary">đăng ký</button>
            </form>
          </div>
        </div>
      </div>
      <hr>
    </div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
      integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
      crossorigin="anonymous"></script>
  </body>

  </html>