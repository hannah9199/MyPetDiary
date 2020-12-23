<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="./../common/common.jsp"%>

<!DOCTYPE html>  
   
<%
	int myoffset = 2;
	int mywidth = 12 - 2 * myoffset;
	int formleft = 3;
	int formright = 12 - formleft;
%>
	<html>
	<head>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/modify_form.css">
	<script type="text/javascript" src="jquery.js"></script>
	<script type="text/javascript" src="jquery.validate.js"></script>
	<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>

	<style type="text/css">
	.form-group {
		margin-bottom: 2px;
		}
		.good-result{/* 상태 양호 */
		font-size : 10pt;
		color:pink;
		font-weight: bolder;
	}
	</style>

	<head>
	<body>
		<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
		<script>
		    //본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
		    function sample4_execDaumPostcode() {
		        new daum.Postcode({
		            oncomplete: function(data) {
		                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

		                // 도로명 주소의 노출 규칙에 따라 주소를 조합한다.
		                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
		                var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
		                var extraRoadAddr = ''; // 도로명 조합형 주소 변수

		                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
		                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
		                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
		                    extraRoadAddr += data.bname;
		                }
		                // 건물명이 있고, 공동주택일 경우 추가한다.
		                if(data.buildingName !== '' && data.apartment === 'Y'){
		                   extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
		                }
		                // 도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
		                if(extraRoadAddr !== ''){
		                    extraRoadAddr = ' (' + extraRoadAddr + ')';
		                }
		                // 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.
		                if(fullRoadAddr !== ''){
		                    fullRoadAddr += extraRoadAddr;
		                }

		                // 우편번호와 주소 정보를 해당 필드에 넣는다.
		                document.getElementById('sample4_postcode').value = data.zonecode; //5자리 새우편번호 사용
		                document.getElementById('sample4_roadAddress').value = fullRoadAddr;
		                document.getElementById('sample4_jibunAddress').value = data.jibunAddress;
		            }
		        }).open();
		    }
	</script>
<body>
	<div id="main_container" align="center"
		class="container col-xs-offset-<%=myoffset%> col-lg-offset-<%=myoffset%> col-xs-<%=mywidth%> col-lg-<%=mywidth%>">
		<div class="panel panel-default ">
			<div class="panel-heading" align="center">
				<font color="black"><b>회원 가입</b></font> 
			</div>
			<div class="panel-body sub_container">
				<form id="myform" name="myform" class="form-horizontal" role="form"
					action="<%=YesForm%>" method="post">
					<input type="hidden" name="command" value="mSignUp"> <input
						type="hidden" name="isCheck" value="false"> 
						
					<div class="form-group">
						<label for="id"
							class="col-xs-<%=formleft%> col-lg-<%=formleft%> control-label"><font size = 2><font color =red >*</font> 아이디</font></label>
						<div class="col-xs-<%=formright - 2%> col-lg-<%=formright - 2%>">
							<input type="text" name="id" id="id" class="form-control"
								placeholder="아이디" value="${requestScope.bean.id}"
								onkeyup="isCheckFalse();"> <span class="err" id="spanid">${errid}</span>
						</div>
						<div class="col-xs-<%=1%> col-lg-<%=1%>" align="left">
							<input type="button" class="btn btn-info" value="중복 검사"
								onclick="checkDuplicateId();">
						</div>
					</div>
					<div class="form-group">
						<label for="nickname"
							class="col-xs-<%=formleft%> col-lg-<%=formleft%> control-label"><font size = 2><font color =red >*</font> 닉네임</font></label>
						<div class="col-xs-<%=formright - 2%> col-lg-<%=formright - 2%>">
							<input type="text" name="nickname" id="nickname" class="form-control"
								placeholder="닉네임" value="${requestScope.bean.nickname}"
								onkeyup="isCheckFalse();"> <span class="err" id="spannickname">${errnickname}</span>
						</div>
						<div class="col-xs-2 col-lg-2" align="left">
							<input type="button" class="btn btn-info" value="중복 검사"
								onclick="checkDuplicatenickname();">
						</div>
					</div>
					<div class="form-group">
						<label for="pet"
							class="col-xs-<%=formleft%> col-lg-<%=formleft%> control-label">성별</label>
						<div class="col-xs-<%=formright%> col-lg-<%=formright%>"
							align="left">
							<label class="radio-inline"> 
							<input type="radio"name="pet" id="pet1" value="강아지">강아지
							</label> &nbsp;&nbsp;<label class="radio-inline"> 
							<input type="radio" name="pet" id="pet2" value="고양이">고양이
							</label> &nbsp;&nbsp;<label class="radio-inline"> 
							<input type="radio" name="pet" id="pet3" value="기타">기타
							</label> <span class="form-control-static err">${errgender}</span>
						</div>
					</div>
						
					<div class="form-group">
						<label for="name"
							class="col-xs-<%=formleft%> col-lg-<%=formleft%> control-label"><font size = 2>이름</font></label>
						<div class="col-xs-<%=formright%> col-lg-<%=formright%>">
							<input type="text" name="name" id="name" class="form-control"
								placeholder="이름" value="${requestScope.bean.name}"> <span
								class="err">${errname}</span>
						</div>
					</div>
					<div class="form-group">
						<label for="password"
							class="col-xs-<%=formleft%> col-lg-<%=formleft%> control-label"><font size = 2><font color =red >*</font> 비밀
							번호</font></label>
						<div class="col-xs-<%=formright%> col-lg-<%=formright%>">
							<input type="password" name="password" id="password"
								class="form-control" placeholder="비밀 번호를 넣어 주세요"
								value=""> <span
								class="err">${errpassword}</span>
						</div>
					</div>
					
					<div class="form-group">
						<label for="email"
							class="col-xs-<%=formleft%> col-lg-<%=formleft%> control-label"><font size = 2><font color =red >*</font> 이메일 
						</font></label>
						<div class="col-xs-<%=formright%> col-lg-<%=formright%>">
                        <input type="text" name="email" class="form-control">@<select name="email">
                            <option>naver.com</option>
                            <option>daum.net</option>
                            <option>gmail.com</option>
                            <option>nate.com</option>                        
                        </select>
                    </div>
                </div>
                <div class="form-group">
						<label for="phone"
							class="col-xs-<%=formleft%> col-lg-<%=formleft%> control-label"><font size = 2>핸드폰 
							번호</font></label>
						<div class="col-xs-<%=formright%> col-lg-<%=formright%>">
							<input type="text" name="phone" id="phone"
								class="form-control" placeholder="핸드폰 번호를 넣어 주세요"
								value=""> <span
								class="err">${errphone}</span>
						</div>
					</div>
					
				<div class="form-group">
						<label for="zipcode"
							class="col-xs-<%=formleft%> col-lg-<%=formleft%> control-label"><font size = 2>우편  
							번호</font></label>
						<div class="col-xs-<%=formright%> col-lg-<%=formright%>">
					<input type="text" id="sample4_postcode" placeholder="">
					<input type="button"  onclick="sample4_execDaumPostcode()" type="button" class="btn btn-info" class="form-control" value="우편번호 찾기">
					<input type="text" name ="zipcode" id="sample4_roadAddress" class="form-control" placeholder="도로명주소">
					<input type="text" name ="address1" id="sample4_jibunAddress" class="form-control" placeholder="지번주소">
					<input type="text" name="address2" id="address2" class="form-control" placeholder="상세주소">
					<span id="guide" style="color:#999"></span>
				</div>
				</div>
					
					<div class="form-group">
						<div class="col-xs-<%=12%> col-lg-<%=12%>" align="center">
							<button type="submit" class="btn btn-default"
								onclick="return checkForm();">
								<b>회원 가입</b>
							</button>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>

	<script type="text/javascript">
		$(document).ready(function() {
			//alert('dd') ;
			$(".datepicker").datepicker();
			$("#spanid").addClass('good-result');
		});
		
	</script>
</body>
</html>
	<script type="text/javascript">
		function checkDuplicateId(  ){
			var id = document.myform.id.value ;
			if( id.length == 0 ){
				alert('아이디를 입력해 주세요') ;
				document.myform.id.focus() ; 
				return false ;
			}
			var url='<%=NoForm%>mIDCheck&id=' + id ; 
			window.open(url, 'mywin', 'height=150,width=300') ;
		}
		function checkDuplicatenickname(  ){
			var nickname = document.myform.nickname.value ;
			if( nickname.length == 0 ){
				alert('닉네임을 입력해 주세요') ;
				document.myform.nickname.focus() ; 
				return false ;
			}
			var url='<%=NoForm%>mNicknameCheck&nickname=' + nickname ; 
			window.open(url, 'mywin', 'height=150,width=300') ;
		}
		
		function isCheckFalse() {
			document.myform.isCheck.value = false;
		}
		function checkForm() {
			var isCheck = document.myform.isCheck.value;
			//alert( isCheck ) ;
			if (isCheck == 'false') {
				alert('아이디 중복 체크를 우선 해주세요.');
				return false;
			}
		}
</script>
