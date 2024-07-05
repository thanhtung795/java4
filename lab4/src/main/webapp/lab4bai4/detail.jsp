<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
	crossorigin="anonymous">
</head>
<body>
	<div class="container">
		<div class="row">
			<c:forEach var="item" items="${items}">
				<div class="col-md-4">
					<div class="card text-center bg-light">
						<div class="card-header">
							<h1>${item.name}</h1>
						</div>
						<div class="card-body">
							<img class="img-fluid" src="lab4bai3/img/${item.img}" alt=""
								width="150">
							<ul class="list-group list-group-flush">
								<li class="list-group-item"><span> Giá gốc: <fmt:formatNumber
											value="${item.price}" pattern="#,##0" /> $
								</span></li>
								<li class="list-group-item"><span> Giá mới: <fmt:formatNumber
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
								Ngày: <span> <fmt:formatDate value="${item.date}"
										pattern="dd/MM/yyyy" />
								</span>
							</p>
						</div>
					</div>
				</div>
			</c:forEach>
		</div>
	</div>
</body>
</html>
