<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<title>Insert title here</title>
</head>
<body>
	<div class="container-fluid">
        <div class="row">
            <div class="col-md-6">
                <%@ include file = "layout/form.jsp" %>
            </div>
            <div class="col-md-6">
                <%@ include file = "layout/table.jsp" %>
            </div>
        </div>
    </div>
</body>
</html>