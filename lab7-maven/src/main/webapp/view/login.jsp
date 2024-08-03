<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Đăng nhập</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <style>
        body {
            margin-top: 20px;
            background-color: #f6f9fc;
        }
        .account-block {
            background-image: url(https://bootdey.com/img/Content/bg1.jpg);
            background-size: cover;
            background-repeat: no-repeat;
            height: 100vh;
            position: relative;
        }
        .overlay {
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background-color: rgba(0, 0, 0, 0.5);
        }
        .account-testimonial {
            position: absolute;
            bottom: 20%;
            left: 50%;
            transform: translateX(-50%);
            text-align: center;
            color: #fff;
            padding: 0 1.5rem;
        }
        .text-theme {
            color: #5369f8 !important;
        }
        .btn-theme {
            background-color: #5369f8;
            border-color: #5369f8;
            color: #fff;
        }
        .login-form {
            display: flex;
            align-items: center;
            justify-content: center;
            min-height: 100vh;
        }
        .login-form .card {
            border-radius: 1rem;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        }
        .login-form h3 {
            margin-bottom: 1.5rem;
        }
    </style>
</head>
<body>
    <section class="container-fluid">
        <div class="row g-0">
            <div class="col-md-6 d-none d-md-block account-block">
                <div class="overlay"></div>
                <div class="account-testimonial">
                    <h4 class="text-white mb-4">Chào mừng đến với trang web của chúng tôi!</h4>
                    <p class="lead">"Sự đầu tư tốt nhất bạn có thể thực hiện là vào chính bản thân mình."</p>
                    <p>- Warren Buffett</p>
                </div>
            </div>
            <div class="col-md-6 d-flex justify-content-center align-items-center">
                <div class="card p-4">
                    <div class="card-body">
                        <h3 class="mb-4">Đăng nhập</h3>
                        <form action="${pageContext.request.contextPath}/Sign-In" method="post">
                            <div class="mb-3">
                                <input type="email" name="email" class="form-control" placeholder="Email" required autofocus>
                            </div>
                            <div class="mb-3">
                                <input type="password" name="password" class="form-control" placeholder="Mật khẩu" required>
                            </div>
                            <div class="d-grid">
                                <button type="submit" class="btn btn-primary btn-theme text-uppercase fw-bold">Đăng nhập</button>
                            </div>
                            <hr class="my-4">
                            <div class="text-center">
                                <span class="text-danger">${message}</span>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-syCFj8so1F6gVd1o1gQG36x0HhzovFfNEhLbs5+PcE6ikz0I3VfT2C+ow5crTK" crossorigin="anonymous"></script>
</body>
</html>
