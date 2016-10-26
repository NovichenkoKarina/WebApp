<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<link href="bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Add new client</title>
</head>
<body>

    <form method="POST" action='ClientController' name="frmAddClient">
    	<table class="table table-striped">
    		<tr>
    			<td>Client ID: </td>
    			<td>
    			<div class="input-group">
    				<input type="text" readonly="readonly" name="clientId" class="form-control" value="<c:out value="${client.clientId}" />" /> <br />  			
    			</div>
    			</td> 
    		</tr>
    		<tr>
    			<td>First Name: </td>
    			<td> <div class="input-group">
    				<input type="text" name="firstName" class="form-control" value="<c:out value="${client.firstName}" />" /> <br /> 
    			</div> </td>
    		</tr>
    		<tr>
    			<td>Last Name: </td>
    			<td> <div class="input-group">
    				<input type="text" name="lastName" class="form-control" value="<c:out value="${client.lastName}" />" /> <br /> 
            	</div></td>
    		</tr>
    		<tr>
    			<td>Country: </td>
    			<td> <div class="input-group">
    				<input type="text" name="country" class="form-control" value="<c:out value="${client.country}" />" /> <br />
    			</div></td>
    		</tr>
    	</table>		 
        
        <button class="btn btn-info" type="submit" value="Submit">OK</button>
    </form>
</body>
</html>