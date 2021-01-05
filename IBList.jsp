<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
String cp = request.getContextPath();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div align="center">
		<br>
		<div class="head" align="center"><h3>이미지 게시판</h3></div>
		<br>
		<table width="600">
			<tr>
				<td >${pagingStatus}</td>
				<td colspan="2" align="right"><input type="button" value="게시물 등록"
					onclick="javascript:location.href='<%=cp%>/Mypet?command=IBWrite';"></td>
			</tr>
			<tr>
				<c:set var="a" value="0"></c:set>
				<c:forEach var="bean" items="${lists}">
					<td align="center" style="padding:20px" >
						<input type="text" value="${bean.title}"
							style="background-color: transpartent; border: 0 solid black; text =align: center;">
						<a href="<%=cp%>/Mypet?command=IBDetailView&no=${bean.no}">
							<img alt="${bean.title}" src="<%=cp%>/upload/${bean.fileName}"
							width="140" height="140" />
						</a>
						<br>
						<div class="desc">${bean.content}</div></td>
					<c:set var="a" value="${a+1 }"></c:set>
					<c:if test="${a==3 }">
					</tr>
					<tr>
					<c:set var="a" value="0"></c:set>
					</c:if>
				</c:forEach>
		</table>
		<div style="background-color: gray; height: 3px; width: 600px">
		</div>
		<div align="center">
			<footer>${pagingHtml}</footer>
		</div>
	</div>
</body>
</html>
