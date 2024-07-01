<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
</head>
<body>
<div class="container bootstrap snippets bootdey">
<div class="panel-body inf-content">
    <div class="row">
        <div class="col-md-12">
            <strong><h1>Thông tin đăng ký</h1></strong><br>
            <div class="table-responsive">
            <table class="table table-user-information">
                <tbody>
                    <tr>        
                        <td class="w-25">
                            <strong>
                                <span class="glyphicon glyphicon-asterisk text-primary"></span>
                                Tên đăng nhập
                            </strong>
                        </td>
                        <td class="text-primary">
                            ${tenDangNhap}
                        </td>
                    </tr>
                    <tr>    
                        <td>
                            <strong>
                                <span class="glyphicon glyphicon-user  text-primary"></span>    
                                Mật khẩu
                            </strong>
                        </td>
                        <td class="text-primary">
                            ${MatKhau}
                        </td>
                    </tr>
                    <tr>        
                        <td>
                            <strong>
                                <span class="glyphicon glyphicon-cloud text-primary"></span>  
                                Giới tính
                            </strong>
                        </td>
                        <td class="text-primary">
                            ${gioiTinh}
                        </td>  
                        </td>
                    </tr>

                    <tr>        
                        <td>
                            <strong>
                                <span class="glyphicon glyphicon-bookmark text-primary"></span> 
                                Tình trạng hôn nhân                                               
                            </strong>
                        </td>
                        <td class="text-primary">
                            ${TinhTrangHonNhan}
                        </td>
                    </tr>
                    <tr>        
                        <td>
                            <strong>
                                <span class="glyphicon glyphicon-eye-open text-primary"></span> 
                                Quốc tịch
                            </strong>
                        </td>
                        <td class="text-primary">
                            ${QuocGia}
                        </td>
                    </tr>
                    <tr>        
                        <td>
                            <strong>
                                <span class="glyphicon glyphicon-envelope text-primary"></span> 
                                Sở thích
                            </strong>
                        </td>
                        <td class="text-primary">
                            ${ST}
                        </td>
                    </tr>                                    
                    <tr>        
                        <td>
                            <strong>
                                <span class="glyphicon glyphicon-envelope text-primary"></span> 
                                Ghi chú
                            </strong>
                        </td>
                        <td class="text-primary">
                            ${ghiChu}
                        </td>
                    </tr>                                    
                </tbody>
            </table>
            </div>
        </div>
    </div>
</div>
</div>                                   
</body>
</html>