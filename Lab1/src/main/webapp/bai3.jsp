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

    <div class="container">
      <h1>Bài 3</h1>
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
            <form action="bai3" method="post" class="mt-2">

                <input class="form-control w-50 " type="text"
                    placeholder="Nhập chiều dài" name="txtChieuDai"> 
                <input
                    class="form-control w-50 mt-3 " type="text"
                    placeholder="Nhập chiều rộng" name="txtChieuRong"> 
                    <label for="" class="form-label ms-2 mt-3">Chọn phương thức tinh hinh chữ nhật</label>
                    <select class="form-select w-50" aria-label="Default select example" name="txtPT">
                        <option selected>Chọn Diện tích/Chu vi</option>
                        <option value="dienTich">Diện tích</option>
                        <option value="chuVi" >Chu vi</option>            
                    </select>
                <button type="submit" class="btn btn-primary mt-3">Tính toán</button>
            </form>
        </div>
         <div class="col-md-6 w-50">
            <div class="result-section">
                <p>Kết quả diện tích/chu vi hình chữ nhật</p>
                <p>Chiều dài: ${ChieuDai}</p>
                <p>Chiều rộng: ${ChieuRong}</p>
                <p>${PT == 'dienTich' ? 'Diện tích' : 'Chu vi'} = ${ct}</p>
                <c:if test="${not empty error}">
                    <p class="error">${error}</p>
                </c:if>
            </div>
        </div>
    </div>
    </div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
      integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
      crossorigin="anonymous"></script>
  </body>

  </html>