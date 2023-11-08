<%@ page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%-- core 라이브러리 적용 --%>	
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri = "http://www.springframework.org/security/tags" prefix="sec" %> 
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- css 파일 연결 -->
    <link rel="stylesheet" type="text/css" href="/css/test.css"/>
    <!-- 부트 스트랩 CDN -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.min.js" integrity="sha384-BBtl+eGJRgqQAUMxJ7pMwbEyER4l1g+O15P+16Ep7Q9Q+zqX6gSbd85u4mG4QzX+" crossorigin="anonymous"></script>
    <!-- 구글 폰트 사용방법 1 -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" >
<title>Home</title>
</head>
<body>
    <header>
    
        <div class="wrap">
            <div class="intro_bg">
            <%@ include file="/WEB-INF/views/Navbar.jsp" %>
		
                <div class="intro_text">
                    <h1>Hair Connect, 헤어 디자인과 헤어모델의 모든 곳</h1><br />
                    <h4>저희는 헤어디자이너와 헤어모델을 연결해드립니다.</h4>
                    <h4>헤어디자이너 혹은 헤어모델을 구하시려면 로그인을 진행해주세요.</h4>
                </div>
            </div>
        </div>
    </header>
    <!-- 중앙 텍스트 -->
    <!-- intro_bg 아래부분 -->
    <div class="intro_mid">
        <div class="model1">
            <img src="../img/model3.jpg" class="view1" alt="중앙 첫번째 사진">
        </div>
        <div class="model2">
            <img src="../img/model2.jpg" class="view2" alt="중앙 두번쨰 사진">
        </div>
        <div class="model3">
            <img src="../img/model4.jpg" class="view3" alt="중앙 세번째 사진">
        </div>
    </div>



    <footer>
        <div class="intro_end">
            <div class="intro_end_design">

            </div>
        </div>
    </footer>
    
        <!-- bootstrap CDN -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
</body>
</html>