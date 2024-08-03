<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Result</title>
</head>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
	crossorigin="anonymous">
	<Style>
		body {
			text-align: center;
			background: #E6E2C3;
			color: #1C315E;
		}
		img {
			width: 30%;
			height: auto;
		}
	</Style>
<body>
	<h2>1. Image: ${img.name}</h2>
	<img src="/Lab32spring2024java4/files/${img.name}" class="img-thumbnail" alt="...">
	<h2>2. Doc: ${doc.name}</h2>
	<a href="/Lab32spring2024java4/files/${doc.name}">Download</a>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
		crossorigin="anonymous"></script>
		<a href="/Lab32spring2024java4">trang chủ</a>
</body>
</html>