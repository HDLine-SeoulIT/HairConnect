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
	<h1>게시물 삭제 완료</h1>
	<script type="text/javascript">
        alert("게시물이 성공적으로 삭제되었습니다.");
        window.location = "/admin/freeboard/boardlist"; // 삭제 완료 후 이동할 페이지로 수정
    </script>
</body>
</html>