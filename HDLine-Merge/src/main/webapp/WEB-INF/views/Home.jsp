<%@ page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%-- core 라이브러리 적용 --%>	
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%> 
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
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
<!--         Navbar -->
<!--         <nav class="navbar fixed-top navbar-expand-lg" style="background-color: hsl(197, 100%, 81%);"> -->
<!--             <div class="container"> -->
<!--                 <a class="navbar-brand" href="" style="font-size:24px">Hair Connect</a> -->
<!--                 navbar burger bootstrap -->
<!--                 <button class="navbar-toggler" type="button" data-bs-toggle="collapse" -->
<!--                     data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" -->
<!--                     aria-expanded="false" aria-label="Toggle navigation"> -->
<!--                 <span class="navbar-toggler-icon"></span> -->
<!--                 </button> -->
<!--                 <div class="collapse navbar-collapse" id="navbarSupportedContent"> -->
<!--                     <ul class="navbar-nav ms-auto mb-2 mb-lg-0"> -->
<!--                     </ul> -->
<!--                 </div> -->
<!--                 <a href="#"><img src="/img/Icon2.png" width="40" height="40"></a>&nbsp; -->
<!--                 <a href="#"><img src="/img/Icon3.png" width="40" height="40"></a>&nbsp; -->
<!--                 <a href="#"><img src="/img/Icon1.png" width="40" height="35"></a>&nbsp; -->
<!--             </div> -->
<!--         </nav> -->
    </header>
	<jsp:include page="/WEB-INF/views/Navbar.jsp"></jsp:include>
	<jsp:include page="/WEB-INF/views/Navbar2.jsp"></jsp:include>
	<sec:authentication property="principal.classify"/>
    <!-- <div class="menubar"> -->
<!--         <ul class="menu"> -->
<!--             <li> -->
<!--                <a href="#">공지사항</a> -->
       
<!--              </li> -->
<!--             <li> -->
<!--                 <a href="#">디자이너</a> -->
<!--                 <ul class="submenu"> -->
<!--                   <li><a href="#">서울</a></li> -->
<!--                   <li><a href="#">인천/경기</a></li> -->
<!--                   <li><a href="#">강원</a></li> -->
<!--                   <li><a href="#">전라/충청</a></li> -->
<!--                   <li><a href="#">경상/부산</a></li> -->
<!--                   <li><a href="#">제주</a></li> -->
<!--                 </ul> -->
<!--               </li> -->
<!--               <li> -->
<!--                 <a href="modelboard/list">모델해요!</a> -->
<!--                 <ul class="submenu"> -->
<!--                   <li><a href="#">서울</a></li> -->
<!--                   <li><a href="#">인천/경기</a></li> -->
<!--                   <li><a href="#">강원</a></li> -->
<!--                   <li><a href="#">전라/충청</a></li> -->
<!--                   <li><a href="#">경상/부산</a></li> -->
<!--                   <li><a href="#">제주</a></li> -->
<!--                 </ul> -->
<!--               </li> -->
<!--               <li> -->
<!--                 <a href="#">자유게시판</a> -->
<!--                 <ul class="submenu"> -->
<!--                 </ul> -->
<!--               </li> -->
             
<!--         </ul> -->

    <!-- middle 모델 및 디자이너 게시글 노출 영역 -->
		    <iframe src="" frameborder="0" name="iframe" style="width: 100%;">
	    <div class="ratio ratio-">
	    </div>
	
	    
	    <!-- 게시판 노출영역 -->
	    <div id="middle-container">
	        <div class="containerline">
	            <div class="middle2">
	            
	            </div>
	            <div class="middle3"></div>
	        </div>
	
	        <div class="containerline">
	            <div class="middle4"></div>
	            <div class="middle5"></div>
	        </div>
	    </div>
		
	</iframe>

     <!-- bootstrap CDN -->
     <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
</body>
</html>