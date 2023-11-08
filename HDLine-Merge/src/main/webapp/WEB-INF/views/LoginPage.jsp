<%@ page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%-- core 라이브러리 적용 --%>	
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%> 
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- css 파일 연결 -->
    <link rel="stylesheet" type="text/css" href="/css/LoginStyle.css"/>
    <!-- 부트 스트랩 CDN -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.min.js" integrity="sha384-BBtl+eGJRgqQAUMxJ7pMwbEyER4l1g+O15P+16Ep7Q9Q+zqX6gSbd85u4mG4QzX+" crossorigin="anonymous"></script>
    <!-- 구글 폰트 사용방법 1 -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https: //fonts.googleapis.com/css2? family= Black+Han+Sans & display=swap" rel="stylesheet">
<title>LoginPage</title>

</head>
<body>
<!-- navbar -->
 <nav class="navbar fixed-top navbar-expand-lg" style="background-color: rgb(241, 241, 241, 0.9);">
        <div class="container">
            <a class="navbar-brand" href="">Hair Connect</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
                data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false"
                aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav ms-auto mb-2 mb-lg-0">
                    <li class="nav-item"><a class="nav-link" href="/MainPage.jsp">홈</a></li>
                    <li class="nav-item"><a class="nav-link" href="">회원가입</a></li>
                    <li class="nav-item"><a class="nav-link active" href="">로그인</a></li>
                    <li class="nav-item"><a class="nav-link" href="">자유게시판</a></li>
                    <li class="nav-item"><a class="nav-link" href="">오시는 길</a></li>
                </ul>
            </div>
        </div>
    </nav>
<!-- 로그인 폼  -->
	<div class="login_bg">
		<div class="login_border">
			<h1 class="login_name">Hair Connect <br>Login</h1>
			
			<!-- //jsp -->
			<c:url value="j_spring_security_check" var="loginUrl" />
			<form class="login_form" action="${loginUrl}" method="post">
				<!-- //jsp    -->
				<c:if test="${param.error != null}">
					<p>
						Login Error! <br /> ${error_message}
					</p>
				</c:if>

				<input type="text" placeholder="ID" id="" name="j_username" value="${username}"> 
				<input type="password" placeholder="Password" id="" name="j_password">
				<input class="button" type="submit" value="Login">


				<div class="social_login">
					<a href=""><img class="naver" src="/image/naver_login.png" onclick=""></a> 
					<a href=""><img class="kakao" src="/image/kakao.png" onclick=""></a> 
					<a href=""><img class="google" src="/image/google.png" onclick=""></a>
				</div>
			</form>
		</div>
	</div>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>

	<%-- 
<div>
<c:url value="j_spring_security_check" var="loginUrl"/>
<form action="${loginUrl}" method="post">
<c:if test="${param.error != null}">
	<p>
		Login Error! <br/>
		${error_message}
	</p>
	</c:if>
	ID : <input type="text" name="j_username" value="${username}"> <br/>
	PW : <input type="text" name="j_password"> <br/>
	<input type="submit" value="LOGIN"> <br/>
</form>
</div> --%>

</body>
</html>