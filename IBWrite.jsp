<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="./../../common/common.jsp"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
String cp = request.getContextPath();
%>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>이미지 게시판 글 등록하기</title>
<script type="text/javascript"
	src="<%=cp%>/board/board_image/IBWrite.js"></script>
<!--경로 -->
</head>
<script type="text/javascript">
	function sendIt() {
		f = document.myForm;

		title = f.title.value;
		title = title.trim();
		if (!title) {
			alert("제목을 입력하세요 !!!");
			f.title.focus();
			return;
		}
		
		content = f.content.value;
		content = content.trim();
		if (!content) {
			alert("글 내용을 입력하세요 !!!");
			f.content.focus();
			return;
		}

		imageFile = f.imageFile.value;
		if (!imageFile) {
			alert("이미지 파일을 선택 하세요 !!!");
			f.imageFile.focus();
			return;
		}

		// console.log('전송전 데이터 확인: ',f.title.value)
		f.submit();//전송 
	}
</script>

<body>
	<div align="center">
		<div class="panel-heading">
			<h1 class="panel-title" align="center">이미지 게시판 글 등록하기</h1>
		</div>
		<form action="<%=cp%>/Mypet?command=IBWrite" method="post"
			enctype="multipart/form-data" name="myForm">
			<table class="table table-hover table-striped" border="0">

				<tr>
					<td width="25%">작성자</td>
					<td width="75%">${sessionScope.loginfo.nickname}(${sessionScope.loginfo.id})</td>
				</tr>
				<tr>
					<td width="25%">제목</td>
					<td width="75%"><input type="text" name="title" id="title">
					</td>
				</tr>
				<tr>
					<td width="25%">글 내용</td>
					<td width="75%">
						<textarea rows="3" 
						name="content" id="content"></textarea>
					</td>
				</tr>
			</table>
			<table width="400" align="center">
				<tr>
					<td bgcolor="#999999">파 일</td>
					<td width="300"><input type="file" name="imageFile"></td>
				</tr>
			</table>
			<br>
			<div align="center">
				<input value="등록하기" type="button" onclick="sendIt();"> <input
					value="다시입력" type="reset"> <input value="작성취소"
					type="button"
					onclick="javascript:location.href='<%=cp%>/Mypet?command=IBList'">
			</div>
		</form>
	</div>
</body>
</html>
