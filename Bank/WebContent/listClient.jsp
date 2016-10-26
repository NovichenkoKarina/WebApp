<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<link href="bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Show All Clients</title>
</head>
<body>
	<table class="table table-striped">
		<thead>
			<tr>
				<th>Client Id</th>
				<th>First Name</th>
				<th>Last Name</th>
				<th>Country</th>
				<th colspan=2>Action</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${clients}" var="client">
				<tr>
					<td><c:out value="${client.clientId}" /></td>
					<td><c:out value="${client.firstName}" /></td>
					<td><c:out value="${client.lastName}" /></td>
					<td><c:out value="${client.country}" /></td>
					<td><a href="ClientController?action=edit&clientId=<c:out value="${client.clientId}"/>"><button class="btn btn-default btn-md btn-block">Update</button></a></td>
					<td><a href="ClientController?action=delete&clientId=<c:out value="${client.clientId}"/>"><button class="btn btn-default btn-md btn-block">Delete</button></a></td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<p>
		<a href="ClientController?action=insert"><button class="btn btn-info">Add Client</button></a>
	</p>
</body>
</html>