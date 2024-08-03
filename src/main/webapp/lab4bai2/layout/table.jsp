<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
	
<div class="container-fluid mt-4">
	<table class="table table-info text-center table-hover">
		<thead>
			<tr>
				<th scope="col">Username</th>
				<th scope="col">Password</th>
				<th scope="col">Remember</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="item" items="${items}">	
				<tr>
					<td>
						${item.username}
					</td>
					<td>
						${item.password}
					</td>
					  <td>${item.remember ? 'Yes' : 'No'}</td>
				</tr>
			</c:forEach>

		</tbody>
	</table>
</div>