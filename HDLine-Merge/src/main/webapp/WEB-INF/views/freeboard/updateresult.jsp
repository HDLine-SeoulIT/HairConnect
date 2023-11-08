<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<jsp:include page="/WEB-INF/views/Navbar.jsp"/>
<jsp:include page="/WEB-INF/views/Navbar2.jsp"/>
	<h1>게시물 수정 완료</h1>
	<script type="text/javascript">
        alert("게시물이 성공적으로 수정되었습니다.");
        window.location.href = "/admin/freeboard/boardlist"; // 수정 완료 후 이동할 페이지로 수정
    </script>
    <%-- 추가로 작성자와 작성일을 표시 --%>
<p>작성자: ${post.members.id}</p>
<p>작성일: <fmt:formatDate value="${post.createdate}" pattern="yyyy-MM-dd HH:mm:ss" /></p>
</body>
</html>