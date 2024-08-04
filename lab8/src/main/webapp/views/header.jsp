<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<style>
.nav-link {
	color: #fff !important;
}

.dropdown-menu {
	background-color: #343a40;
}

.dropdown-item .nav-link {
	color: #fff !important;
}
</style>

<body>
	<fmt:setLocale value="${sessionScope.lang}" scope="request" />
	<fmt:setBundle basename="global" scope="request" />
	<ul class="nav justify-content-center bg-dark">
		<li class="nav-item"><a class="nav-link active"
			aria-current="page" href="home"><fmt:message key="menu.home" /></a></li>
		<li class="nav-item"><a class="nav-link" href="about"><fmt:message
					key="menu.about" /></a></li>
		<li class="nav-item"><a class="nav-link" href="contact"><fmt:message
					key="menu.contact" /></a></li>
		<li class="nav-item"><a class="nav-link" href="managent"><fmt:message
					key="menu.user" /></a></li>
		<li class="nav-item dropdown"><a class="nav-link dropdown-toggle"
			href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown"
			aria-expanded="false"> <fmt:message key="menu.language" />
		</a>
			<ul class="dropdown-menu" aria-labelledby="navbarDropdown">
				<li><a class="dropdown-item nav-link" href="?lang=vi">Tiếng
						Việt</a></li>
				<li><a class="dropdown-item nav-link" href="?lang=en">English</a></li>
			</ul></li>
	</ul>
</body>