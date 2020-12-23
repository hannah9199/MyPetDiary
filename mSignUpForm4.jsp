<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  
<!DOCTYPE html>
<html>
<head>
<style type="text/css">

.good-result{/* 상태 양호 */
		font-size : 10pt;
		color:pink;
		font-weight: bolder;
	}
html {
    height: 100%;
}

body {
    margin: 0;
    height: 100%;
    background: #f5f6f7;
    font-family: Dotum,'돋움',Helvetica,sans-serif;
}
#logo {
    width: 240px;
    height: 44px;
    cursor: pointer;
}

#header {
    padding-top: 62px;
    padding-bottom: 20px;
    text-align: center;
    background-color: silver;
    font-size: 20px;
}
#wrapper {
    position: relative;
    height: 100%;
}

#content {
    position: absolute;
    left: 50%;
    transform: translate(-50%);
    width: 460px;
}




/* 입력폼 */


h3 {
    margin: 5px 0 5px;
    font-size: 12px;
    font-weight: 1000;
}


.box {
    display: block;
    width: 100%;
    height: 40px;
    border: solid 1px #dadada;
    padding: 1px 5px  ;
    box-sizing: border-box;
    background: #fff;
    position: relative;
}

.int {
    display: block;
    position: relative;
    width: 100%;
    height: 27px;
    border: none;
    background: #fff;
    font-size: 15px;
}

input {
    font-family: Dotum,'돋움',Helvetica,sans-serif;    
}

.box.int_id {
  border: 1px solid #dadada;
  padding-top: 1px;
  padding-right: 1px;
  padding-bottom: 1px;
  padding-left: 1px;
}

.box.int_pass {
    padding-right: 40px;
}

.box.int_pass_check {
    padding-right: 40px;
}

.step_url {
    /*@naver.com*/
    position: absolute;
    top: 16px;
    right: 13px;
    font-size: 15px;
    color: #8e8e8e;
}

.pswdImg {
    width: 18px;
    height: 20px;
    display: inline-block;
    position: absolute;
    top: 50%;
    right: 16px;
    margin-top: -10px;
    cursor: pointer;
}

#bir_wrap {
    display: table;
    width: 100%;
}

#bir_yy {
    display: table-cell;
    width: 147px;
    
}

#bir_mm {
    display: table-cell;
    width: 147px;
    vertical-align: middle;
}

#bir_dd {
    display: table-cell;
    width: 147px;
}

#bir_mm, #bir_dd {
    padding-left: 10px;
}

select {
    width: 100%;
    height: 29px;
    font-size: 15px;
    background: #fff url(https://static.nid.naver.com/images/join/pc/sel_arr_2x.gif) 100% 50% no-repeat;
    background-size: 20px 8px;
    -webkit-appearance: none;
    display: inline-block;
    text-align: start;
    border: none;
    cursor: default;
    font-family: Dotum,'돋움',Helvetica,sans-serif;
}

/* 버튼 */

.btn_area {
    margin: 30px 0 91px;
}

#btnJoin {
    width: 100%;
    padding: 21px 0 17px;
    border: 0;
    cursor: pointer;
    color: black;
    background-color: silver;
    font-size: 20px;
    font-weight: 300;
    font-family: Dotum,'돋움',Helvetica,sans-serif;
}

</style>
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

function findmZipcode( ){
	var url='<%=NoForm%>mZipCheck';
	window.open(url, 'mywin',
		'height=600,width=720,status=yes,scrollbars=yes,resizable=no');
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
</head>

    
  
    <body>
        <!-- header -->
        <div id="header">
            <label for = "header">회원 가입</label>
           
        </div>


        <!-- wrapper -->
        <div id="wrapper">

            <!-- content-->
            <div id="content">

                <!-- ID -->
                <div>
                    <h3 class="join_title">
                        <label for="id"><font color = red>*</font> 아이디</label>
                    </h3>
                   <span class="box int_id">           
   					<input type="text" id="id" class="int" maxlength="30"
                        placeholder="아이디를 입력해 주세요." value="${requestScope.bean.id}"
                        onkeyup="isCheckFalse();">
                        <span class="err" id="spanid">${errid}</span>
                    </span> 
                </div>
                <div>
                	<input type="button" class="btn btn-info" value="중복 검사" 
								onclick="checkDuplicateId();">
                </div>
          
                <!-- PW1 -->
                <div>
                    <h3 class="join_title">
                    <label for="password"><font color = red>*</font> 비밀 번호</label>
                    </h3>
                    <span class="box int_password">
                        <input type="text" id="password" class="int" maxlength="20"
                        placeholder="비밀번호를 입력해 주세요." value="${requestScope.bean.password}"
                        onkeyup="isCheckFalse();">
                        <span class="err" >${errpassword}</span>
                    </span>
                </div>

                <!-- NAME -->
                <div>
                    <h3 class="join_title"><label for="name">이름</label></h3>
                    <span class="box int_name">
                        <input type="text" id="name" class="int" maxlength="20"
                    placeholder="이름을 입력해 주세요." value="${requestScope.bean.name}"> 
                    <span class="err">${errname}</span>
                    </span>
                </div>
                
				<!-- nickname -->
				<div>
                    <h3 class="join_title">
                        <label for="nickname"><font color = red>*</font> 닉네임</label>
                    </h3>
                    <span class="box int_nickname">
                        <input type="text" id="nickname" class="int" maxlength="20"
                        placeholder="닉네임을 입력해 주세요." value="${requestScope.bean.nickname}"
                        onkeyup="isCheckFalse();">
                        <span class="err" id="spannickname">${errnickname}</span>
                    </span>
                </div>
                <div>
                	<input type="button" class="btn btn-info" value="중복 검사"
								onclick="checkDuplicatenickname();">
                </div>
                
                <!-- EMAIL -->
                <div>
                    <h3 class="join_title"><label for="email">본인확인 이메일<span class="optional">(선택)</span></label></h3>
                    <span class="box int_email">
                        <input type="text" id="email" class="int" maxlength="100" placeholder="이메일을 입력해 주세요.">
                         <select name="email">
                        <option>@ naver.com</option>
                            <option>@ daum.net</option>
                            <option>@ gmail.com</option>
                            <option>@ nate.com</option>  
                        </select>
                    </span>
                </div>

                <!-- phone -->
                <div>
                    <h3 class="join_title"><label for="phone">휴대전화</label></h3>
                    <span class="box int_phone">
                        <input type="tel" id="phone" class="int" maxlength="16" placeholder="전화번호를 입력해 주세요.">
                    </span>
                   <span class="err">${errphone}</span>   
                </div>
                
                
                <!-- post -->
                <div>
                    <h3 class="join_title"><label for="zipcode">우편 번호</label></h3>
                    <span class="box int_zipcode">
                        <input type="text" id="zipcode" class="int" maxlength="16" placeholder="">
                    </span>
                    <input type="button" class="btn btn-info" value="우편 번호 찾기"
								onclick="findZipcode();">
                   <span class="err">${errzipcode}</span> 
                </div>
                
                <!-- Address -->
                <div>
                    <h3 class="join_title"><label for="address1">주소</label></h3>
                    <span class="box int_address1">
                        <input type="text" id="address1" class="int" maxlength="16" placeholder="">
                    </span>
                     <span class="box int_address2">
                    <input type="text" id="address2" class="int" maxlength="16" placeholder="세부주소를 입력해 주세요.">
                    </span>
                    <span class="err">${erraddress1}</span> 
                </div>
                <!-- pet  -->
                <div>
                    <h3 class="join_title">
                        <label for="pet">기르는 애완동물</label>
                    </h3>
                   
                       <input type="radio" id="pet" name="pet" value="강아지"><font size =2.7>강아지</font><br>
						<input type="radio" id="pet" name="pet" value="고양이"><font size =2.7>고양이</font><br>
						<input type="radio" id="other" name="other" value="기타"><font size =2.7>기타</font><br>
                    <span class="err">${errpet}</span>
                </div>
                
                <!-- JOIN BTN-->
                <div class="btn_area">
                    <button type="button" id="btnJoin">
                        <span>가입하기</span>
                    </button>
                </div>

                

            </div> 
            <script type="text/javascript">
		$(document).ready(function() {
			//alert('dd') ;
			$(".datepicker").datepicker();
			$("#spanid").addClass('good-result');
		});
	</script>
        </div> 
        <!-- wrapper -->
    <script src="main.js"></script>
    </body>
</html>