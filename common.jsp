<%----- IMPORT, TAGLIB -----%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="java.util.*" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>    
 
 
<%----- LOGIN STATE -----%>

<%-- Not Login --%>
<c:if test="${empty sessionScope.loginfo}">
	<c:set var="login-type" value="0" />
</c:if>

<c:if test="${not empty sessionScope.loginfo}">
	<%-- Admin Login --%>
	<c:if test="${sessionScope.loginfo.id == 'admin'}">
		<c:set var="login-type" value="1" />
	</c:if>
	
	<%-- Member Login --%>
	<c:if test="${sessionScope.loginfo.id != 'admin'}">
		<c:set var="login-type" value="2" />
	</c:if>
</c:if>
    
    
<%----- COMMAND -----%>

<%!
	String YesForm = null;
	String NoForm = null;
%>

<%
	String contextPath = request.getContextPath();
	String mappingName = "/Mypet";
	
	// Form TAG 변수
	YesForm = contextPath + mappingName;
	
	// Not Form TAG 변수
	NoForm = contextPath + mappingName + "?command=";	
%>
	
	    
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<head profile="http://www.w3.org/2005/10/profile">
	<link href="https://fonts.googleapis.com/css2?family=Roboto:wght@300;400;500&display=swap" rel="stylesheet">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/main.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>

<body>
	  <div class="body--container">
        <!-- HEADER -->
        <header>
            <div class="inner clearfix">
                <div class="menu-group float--left">
                    <div class="logo">
                        <a href="#">MyPetDiary :)</a>
                    </div>
                    
                    <ul class="main-menu">
                            <li class="dropdown-board"><a href="#" class="hover-color">Community</a>
                            	<ul class="dropdown-submenu">
                            		<li><a href="#">자유 게시판</a></li>
                            		<li><a href="#">사진 게시판</a></li>
                            		<li><a href="#">문의 게시판</a></li>
                            	</ul>
                            </li>
                            
                            <li class="dropdown-mypage"><a href="#" class="hover-color">My Page</a>
                                <ul class="dropdown-submenu">
                                	<li><a href="#">My Diary</a></li>
                            		<li><a href="#">정보 수정</a></li>
                            		<li><a href="#">주문 조회</a></li>
                            		
                            		<c:if test="${whologin == 2}">
										<li><a href="<%=NoForm%>#">관리자 메뉴</a></li>
									</c:if>
                            	<!-- 	<li><a href="#">관리자 메뉴</a></li> -->
                            	</ul>
                            </li>
                            
                            <li class="dropdown-shop"><a href="#" class="hover-color">Shop</a>
                            	<ul class="dropdown-submenu">
                            		<li><a href="#">강아지</a></li>
                            		<li><a href="#">고양이</a></li>
                            	</ul>
                           </li>
                    </ul>
                </div>

                <div class="sign-group float--right">
                    <div class="btn-group">
                    	<span>님 환영합니다!</span>
                        <a href="#" class="log-in btn--home">로그인</a>
                        <a href="<%=NoForm%>mSignUp" class="sign-up btn--home">회원가입</a>
                        <a href="#" class="shop-cart">Cart</a>
                    </div>
                </div>
            </div>
        </header>

        <footer>
             <div class="footer-inner">
                <div class="copyright">
                    <p>© 2020. TEAM2 All rights reserved</p>
                </div>
    
                <div class="contact">
                    <address>서울 마포구 백범로 23</address><br>
                    <a href="mailto:mypetdiaryex@gmail.com">메일 보내기</a>
                    <span>/</span>
                    <a href="tel:019-1234-5678">고객센터 연결</a>
                </div>
            </div>
        </footer>
    </div>
    <c:if test="${not empty requestScope.errmsg}">
		<div class="alert alert-danger alert-dismissable">
    		<a href="#" id="myalert" class="close" data-dismiss="alert" aria-label="close">닫기</a>
    		<strong>${requestScope.errmsg}</strong>
		</div>
	</c:if>
	
	<c:if test="${not empty sessionScope.message}">
		<script type="text/javascript">
			alert('${sessionScope.message}') ;	 
		</script>
		<% session.removeAttribute("message") ; %>
	</c:if>			
</body>
</html>