<%@ page import="java.sql.*" %>
<% Class.forName("com.mysql.jdbc.Driver"); %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<link href="bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Selecting</title>
</head>
<body>
<div class="table-scrol">
    <h2 align="center">View</h2>

<div class="table-responsive">
<%! 
public class Client {
	String URL = "jdbc:mysql://localhost:3306/client";
	String USERNAME = "root";
	String PASSWORD = "5514";

	Connection connection = null;
	PreparedStatement selectClients = null;
	ResultSet resultSet = null;

public Client(){
	
	try{
		connection = DriverManager.getConnection(URL,USERNAME,PASSWORD);		
		selectClients = connection.prepareStatement("SELECT clientId, clientName, clientAge, clientCountry, clientNumber FROM client");
		
	}catch(SQLException e){
		e.printStackTrace();
	}
}
public ResultSet getClients(){		
	try{
		resultSet = selectClients.executeQuery();
	}catch (SQLException e) {
		e.printStackTrace();
	}
	return resultSet;
}} 
%>

<%
	Client client = new Client();
	ResultSet clients = client.getClients(); 
%>

<table class="table table-striped">
	<tbody>
		<tr>
			<td>Id</td>
			<td>Name</td>
			<td>Age</td>
			<td>Country</td>
			<td>Number</td>
		</tr>
		<% while (clients.next()) {  %>
		<tr>
			<td><%= clients.getString("clientId")%></td>
			<td><%= clients.getString("clientName")%></td>
			<td><%= clients.getString("clientAge")%></td>
			<td><%= clients.getString("clientCountry")%></td>
			<td><%= clients.getString("clientNumber")%></td>
		</tr>
		<% } %>
	</tbody>
</table>
	
	</div>
</div>
<h1><a href="index.jsp"><button class="btn btn-info"> Back </button></a></h1>
</body>
</html>