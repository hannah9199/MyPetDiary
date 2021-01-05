<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="./../../common/common.jsp"%>
<%
String cp = request.getContextPath();
%>
<script type="text/javascript">
		function gotoBack(){
			location.href='<%=NoForm%>IBList&${requestScope.parameters}';
	}
		function IBdelete(){
			location.href='<%=cp%>/Mypet?command=IBDelete&no=${bean.no}';
			
		}
		
		function IBModify(){
			location.href = "<%=NoForm%>IBModify&${requestScope.parameters}";
			
		}
		
</script>

<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>BootStrap</title>
<style type="text/css">
/*.panel-body{ margin-bottom: -30px;}*/
</style>
</head>
<body>
	<div class="container col-md-offset-<%=2%> col-md-<%=8%>" align="right">
		<div class="panel panel-default">
			<div class="panel-heading">
				<h1 class="panel-title" align="left">이미지 상세 보기</h1>
			</div>
			<div class="panel-body" align="left">
				<div class="col-md-12">
					<div class="col-md-<%=4%>" align="center">
						<table class="table table-bordered" border="0">
							<tr>
								<td align="center"><img align="middle" alt="" width="180"
									height="180" class="img-rounded"
									src="<%=cp%>/upload/${bean.fileName}" class="img-thumbnail"
									alt="Cinque Terre"></td>
							</tr>
						</table>
					</div>
				</div>
				<!-- end left side image -->
				<div class="col-md-<%=10%>" align="center">
					<table class="table table-hover table-striped" border="0">
						<tr>
							<td width="25%" align="center">제목</td>
							<td width="75%" align="left">${bean.title}</td>
						</tr>
						<tr>
							<td width="25%" align="center">작성자</td>
							<td width="75%" align="left">${bean.writer}</td>
						</tr>
						<tr>
							<td width="25%" align="center">글 내용</td>
							<td width="75%" align="left">${bean.content}</td>
						</tr>
					</table>
				</div>

				<hr>
				<div class="col-sm-offset-5 col-sm-4" align="center">
					<button class="btn btn-primary" onclick="gotoBack();">돌아
						가기</button>
					<button class="btn btn-primary" onclick="IBModify();">수정</button>
					<button class="btn btn-primary" onclick="IBdelete();">삭제</button>
				</div>
				<!-- 댓글 영역 -->
				<c:if test="${requestScope.commentList != null }">
					<c:forEach var="comment" items="${requestScope.commentList}">

						<tr>
							<!--아이디, 작성 날짜-->
							<td width="150">
								<div>
									${comment.comment_id}<br> <font size="2" color="lightgray">${comment.created_at}</font>
								</div>
							</td>
							<!--본문 내용-->
							<td width="550">
								<div class="text_wrapper">${comment.comment_content}</div>
							</td>
							<!--버튼-->
							<td width="100">
								<div id="btn" style="text-align: center;">
									<a href="#">[답변]</a><br>
									<!--댓글 작성이지만 수정, 삭제 가능하도록-->
									<c:if test="${comment.comment_id == sessionScope.sessionID}">
										<a href="#">[수정]</a>
										<br>
										<a href="#">[삭제]</a>
										<br>
									</c:if>
								</div>
							</td>
						</tr>
					</c:forEach>
				</c:if>
				<!--로그인 했을 경우만 댓글 작성 가능-->
				<c:if test="${seesionScope.sessionID != null}">
					<tr bgcolor="#f5f5f5">
						<form id="writeCommentForm">
							<input type="hidden" name="comment_board"
								value="${board.board_no}"> <input type="hidden"
								name="comment_id" value="${sessionScope.sessionID}">
						</form>
				</c:if>
				<!-- <div class="form-group">
							<div class="col-xs-offset-3 col-xs-2 col-lg-2">
								<button type="submit" class="btn btn-info" >저장하기</button>
							</div>
						</div> -->
				</form>
			</div>
		</div>

	</div>
	</div>
	<script>
		$(document).ready(function() {
			$('[data-toggle="popover"]').popover();
		});
	</script>
</body>