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
      <h1>Lab 3 Bài 1</h1>
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
                <a class="nav-link" href="lab3bai1">Bài 1</a>
              </li>
              <li class="nav-item">
                <a class="nav-link" href="lab3bai2">Bài 2</a>
              </li>
              <li class="nav-item">
                <a class="nav-link" href="lab3bai3">Bài 3</a>
              </li>
              <li class="nav-item">
                <a class="nav-link" href="lab3bai4">Bài 4</a>
              </li>
            </ul>
          </div>
        </div>
      </nav>
    </div>
  <div class="container">
    <h1>Upload</h1>
    <form action="lab3bai1" method="post" enctype="multipart/form-data">
        Hình ảnh: 
        <input type="file" name="photo_file" class="form-control"><br>
        

        <c:if test="${not empty imgError}">
            <div class="alert alert-danger">${imgError}</div>
        </c:if>

        Tài liệu: 
        <input type="file" name="doc_file" class="form-control"><br>
        
        
        
        <c:if test="${not empty docError}">
            <div class="alert alert-danger">${docError}</div>
        </c:if>
        
        <hr>
        <button class="btn btn-primary">Upload</button>
    </form>
</div>

  </body>

  </html>