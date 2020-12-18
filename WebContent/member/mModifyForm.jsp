<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="./../common/common.jsp"%>
    
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>MyPetDiary | 정보 수정</title>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/modify_form.css">
	<script>
		function dropCheck() {
			if (!confirm('회원을 탈퇴 하시겠습니까?')) {
				return false;
			}
		}
	</script>
</head>

<body>
		<form name="modify-form" action="<%=YesForm%>" method="POST">
			<input type="hidden" name="command" value="mModify">
			
			<table class="modify-table">
				<thead>
					<tr>
						<th><h1>회원정보 수정</h1></th>
					</tr>
				</thead>
				
				<tbody>
					<tr>
						<th>
							<label for="id">ID</label>
						</th>
						<td>
							<input type="text" name="disabled-id" disabled="disabled" size="25" value="${requestScope.bean.mID}">
							<input type="hidden" name="id" value="${requestScope.bean.id}">
	 						<span class="error">${error_id}</span>	
						</td>
					</tr>	
						
					<tr>	
						<th>
							<label for="name">이름</label>
						</th>
						<td>
							<input type="text" name="disabled-name" disabled="disabled" size="25" value="${requestScope.bean.mName}">
							<input type="hidden" name="Name" value="${requestScope.bean.mName}">
							<span class="error">${error_name}</span>
						</td>
					</tr>
					
					<tr>
						<th>
							<label for="nickname">닉네임</label>
						</th>	
						<td>
							<input type="text" name="nickname" size="25" value="${requestScope.bean.mNickname}">&nbsp;&nbsp;
							<button onclick="checkDuplicateID();">중복 검사</button>
							<span class="error">${error_nickname}</span>
						</td>
					</tr>
					
					<tr>	
						<th>
							<label for="passowrd">패스워드</label>
						</th>	
						<td>
							<input type="password" name="password1" size="25">
							<span class="error">${error_password}</span>
						</td>
					</tr>
					
					<tr>
						<th>
							<label for="check-password">패스워드 확인</label>
						</th>	
						<td>
							<input type="password" name="password2" size="25">
							<span class="error">${error_repassword}</span>
						</td>
					</tr>
					
					<tr>
						<th>
							<label for="email">E-mail</label>
						</th>		
						<td>
							<input type="email" name="email" size="25">
							<span class="error">${error_email}</span>
						</td>
					</tr>
					
					<tr>	
						<th>
							<label for="hphone">핸드폰 번호</label>
						</th>	
						<td>
							<input type="tel" name="hphone" size="25">
							<span class="error">${error_hphone}</span>
						</td>
					</tr>
					
					<tr>	
						<th>
							<label for="zipcode">우편번호</label>
						</th>	
						<td>
							<input type="text" name="disabled-zipcode" disabled="disabled" size="25" value="${requestScope.bean.mZipcode}">
							&nbsp;
							<button onclick="findZipcode();">우편번호 찾기</button>
							<span class="error">${error_zipcode}</span>
						</td>
					</tr>
					
					<tr>	
						<th>
							<label for="zipcode">주소</label>
						</th>	
						<td>
							<input type="text" name="disabled-address" disabled="disabled" size="25" value="${requestScope.bean.mAdress1}">
							<input type="hidden" name="address" value="${requestScope.bean.mAdress1}">
							<span class="error">${error_address1}</span>
						</td>
					</tr>
					
					<tr>	
						<th>
							<label for="zipcode">상세 주소</label>
						</th>	
						<td>
							<input type="text" name="address-detail" size="25" value="${requestScope.bean.mAdress2}">
							&nbsp;&nbsp;&nbsp;&nbsp;
							<span class="error">${error_address2}</span>
						</td>
					</tr>
					
					<tr>	
						<td>
							<p>Point : ${requestScope.bean.mPoint} / 레벨 : ${requestScope.bean.mLevel}&nbsp;</p>
						</td>
					</tr>
					
					<tr>
						<td colspan="2" align="center" class="button-group">
							<button type="submit">정보 수정</button>&nbsp;&nbsp;
							<a href="<%=NoForm%>mDelete&id=${sessionScope.loginfo.mID}" onclick="return dropCheck();">
								회원 탈퇴</a>&nbsp;&nbsp;
							<button type="reset">취소</button>&nbsp;&nbsp;
						</td>
					</tr>
			</tbody>
		</table>
	</form>
</body>
</html>