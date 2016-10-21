<%@ page import="java.sql.*" %>  
<%@ page import="java.io.*" %>  
<% Class.forName("com.mysql.jdbc.Driver"); %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>  
<!DOCTYPE html>  
<html>  
<head>  
	<link href="bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">  
	<title>Number of clients</title>  
</head>  
<body>  
    <h1 align="center">View</h1>

<%  
    try {  
  
    String URL = "jdbc:mysql://localhost:3306/client";  
	String USERNAME = "root";
	String PASSWORD = "5514";
	
    
    Statement statement = null;  
    ResultSet resultSet = null;  
    
    Connection connection = DriverManager.getConnection(URL,USERNAME,PASSWORD); 	
    statement = connection.createStatement();  
    String Data = "SELECT COUNT(*) FROM client";  
    resultSet = statement.executeQuery(Data);  
%>  
<table class="table table-striped" >  
	<tr>  
    	<td>Number of clients</td>  
	</tr>  
<%  
    while (resultSet.next()) {  
%>  
	<tr>  
    	<td><%=resultSet.getString("COUNT(*)")%></td>  
	</tr>  
<%   }    %>  
</table>  
<%  
	resultSet.close();  
    statement.close();  
    connection.close();  
    } catch (Exception e) {  
    out.println("Can’t connect to database.");  
    }  
%>  
	<h1><a href="index.jsp"><button class="btn btn-info"> Back </button></a></h1>
</body>
</html>  