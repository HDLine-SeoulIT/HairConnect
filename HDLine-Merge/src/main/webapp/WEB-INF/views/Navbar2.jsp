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
    <link rel="stylesheet" type="text/css" href="/css/Home.css"/>
    <!-- 부트 스트랩 CDN -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.min.js" integrity="sha384-BBtl+eGJRgqQAUMxJ7pMwbEyER4l1g+O15P+16Ep7Q9Q+zqX6gSbd85u4mG4QzX+" crossorigin="anonymous"></script>
    <!-- 구글 폰트 사용방법 1 -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<title>Insert title here</title>
</head>
<body>
  <header>
    </header>

        <ul class="menu">
			<li>
                <a href="${pageCotext.request.contextPath }/desboard/list/">디자이너에요! </a>
                <ul class="submenu">
                  <li><a href="${pageCotext.request.contextPath }/desboard/list/seoul/">서울</a></li>
                  <li><a href="${pageCotext.request.contextPath }/desboard/list/IG/">인천/경기</a></li>
                  <li><a href="${pageCotext.request.contextPath }/desboard/list/Gang/">강원</a></li>
                  <li><a href="${pageCotext.request.contextPath }/desboard/list/JC/">전라/충청</a></li>
                  <li><a href="${pageCotext.request.contextPath }/desboard/list/GB/">경상/부산</a></li>
                  <li><a href="${pageCotext.request.contextPath }/desboard/list/JEJU/">제주</a></li>
                </ul>
              </li>
              <li>
                <a href="${pageCotext.request.contextPath }/modelboard/list/">모델해요!</a>
                <ul class="submenu">
                  <li><a href="${pageCotext.request.contextPath }/modelboard/list/seoul/">서울</a></li>
                  <li><a href="${pageCotext.request.contextPath }/modelboard/list/IG/">인천/경기</a></li>
                  <li><a href="${pageCotext.request.contextPath }/modelboard/list/Gang/">강원</a></li>
                  <li><a href="${pageCotext.request.contextPath }/modelboard/list/JC/">전라/충청</a></li>
                  <li><a href="${pageCotext.request.contextPath }/modelboard/list/GB/">경상/부산</a></li>
                  <li><a href="${pageCotext.request.contextPath }/modelboard/list/JEJU/">제주</a></li>
                </ul>
              </li>
              <li>
                <a href="${pageCotext.request.contextPath }/freeboard/boardlist">자유게시판</a>
              </li>
              <li>
<!--                <a href="#">공지사항</a> -->
             </li>
        </ul>
     <!-- bootstrap CDN -->
     <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
</body>
</html>