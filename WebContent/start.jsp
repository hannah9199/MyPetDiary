<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>START</title>
</head>
<body>
<%
	String temp = request.getContextPath() + "/Mypet?command=main";
	response.sendRedirect(temp);
%>
</body>
</html>