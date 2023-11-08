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
    <!-- 부트 스트랩 CDN -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.min.js" integrity="sha384-BBtl+eGJRgqQAUMxJ7pMwbEyER4l1g+O15P+16Ep7Q9Q+zqX6gSbd85u4mG4QzX+" crossorigin="anonymous"></script>
    <!-- 구글 폰트 사용방법 1 -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<link rel="stylesheet" text="html/css" href="/css/M.css">
<title>message</title>
</head>
<body>
<jsp:include page="/WEB-INF/views/Navbar.jsp"/>
<jsp:include page="/WEB-INF/views/Navbar2.jsp"/>
<sec:authentication property="principal.no" var="userno"/>
<sec:authentication property="principal.userid" var="userid"/>
<sec:authentication property="principal.userid"/>

 <div class="back">
    <div class="left">
        <button type="button" onclick="location.href='/message/messageForm'">쪽지쓰기</button>
        <button type="button" onclick="location.href='/message/receive/list/${userid}'">받은 메일함</button>
        <button type="button" onclick="location.href='/message/send/list/${userid}'">보낸 메일함</button>
    </div>
        
    <div class="right">
        <div class="message">
            <form method="post" action="/message/write" >
            
            	<input type="hidden" name="sender"  value="${userid}"/>
                <div class="form_top">
                    <p>New Message</p>
                </div>
                <label>받는 사람</label><br/>
                <input type="text" id="receiver" name="receiver" placeholder=" 받는 사람" value="${reciever }"/><br/>
                <label>제목</label><br/>
                <input type="text" id="title" name="title" placeholder=" 제목" value=""/><br/>
                <label>내용</label><br/>
                <textarea id="content" name="content" placeholder=" 내용" value=""></textarea><br/>
                <div class="keys">
                    <input type="submit" class="button" value="전송"/>
                    <input type="reset"  class="reset"  value="취소"/>
                </div>
            </form>
       	</div>
    </div>
</div>
</body>
</html>