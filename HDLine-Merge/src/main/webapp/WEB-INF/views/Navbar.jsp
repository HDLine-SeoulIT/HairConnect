<%@ page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%-- core 라이브러리 적용 --%>	
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- jQuery 3.7.0 적용 -->
<script  src="https://code.jquery.com/jquery-3.7.0.js"
  	integrity="sha256-JlqSTELeR4TLqP0OG9dxM7yDPqX1ox/HfgiSLBj8+kM=" 
  	crossorigin="anonymous"></script>
<!-- BootStrap 5.3.1  및 4.6.2 적용 -->
<script 
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js" 
	integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct" 
	crossorigin="anonymous"></script>
<script 
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" 
	integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" 
	crossorigin="anonymous"></script>
<link rel="stylesheet" 
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" 
	integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" 
	crossorigin="anonymous">
<link 
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" 
	rel="stylesheet" 
	integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" 
	crossorigin="anonymous">
<title></title>
 <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- 구글 폰트 사용방법 1 -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" >
</head>
<body>

	<div>
        <!-- Navbar -->
        <nav class="navbar fixed-top navbar-expand-lg" style="background-color: rgb(255, 243, 204, 0.5);">
            <div class="container">
                <a class="navbar-brand" href="/home">Hair Connect</a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
                    data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent"
                    aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav ms-auto mb-2 mb-lg-0">
                    <sec:authorize access="isAuthenticated()">
                    <sec:authentication property="principal.no" var="userno"/>
						    <!-- 로그인 후 메뉴 -->
						      <li class="nav-item"><a class="nav-link" href="${pageCotext.request.contextPath }/logout">로그아웃</a></li>
                        	<li class="nav-item"><a class="nav-link" href="/userinfo/${userno }">회원정보</a></li>
                        	<li class="nav-item"><a class="nav-link" href="/message/receive/list/${userno }">편지함</a></li>
						</sec:authorize>
						<sec:authorize access="!isAuthenticated()">
						
						    <!-- 로그인 전 메뉴 -->
						   <li class="nav-item"><a class="nav-link" href="${pageCotext.request.contextPath }/signup">회원가입</a></li>
                        	<li class="nav-item"><a class="nav-link" href="${pageCotext.request.contextPath }/loginForm">로그인</a></li>
						</sec:authorize>
<%--                         <li class="nav-item"><a class="nav-link" href="${pageCotext.request.contextPath }/modelboard/list/">지원해요!</a></li> --%>
						<sec:authorize access="hasRole('ROLE_ADMIN')">
                        	<li class="nav-item"><a class="nav-link" href="${pageCotext.request.contextPath }/admin/intro">관리자페이지</a></li>
						</sec:authorize>
<%--                         <li class="nav-item"><a class="nav-link" href="${pageCotext.request.contextPath }/createmember">관리자및 멤버추가</a></li> --%>
                    </ul>
                </div>
            </div>
      </nav>
      </div>
      <br />
       <!-- bootstrap CDN -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
</body>
</html>