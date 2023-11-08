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

<script>
document.getElementById("delete").onclick = function() {
    var confirmation = confirm("삭제하시겠습니까?");
    if (confirmation) {
        // 사용자가 확인을 누르면 링크 이동을 진행합니다.
    } else {
        // 사용자가 취소를 누르면 아무 작업도 하지 않습니다.
        event.preventDefault(); // 링크 이동을 취소합니다.
    }
};
</script>
 </head>
<body>
<sec:authentication property="principal.region" var="userRegion"/>
<c:set var="user" value="${userRegion }"></c:set>
<sec:authentication property="principal.no" var="userno"/>
<jsp:include page="/WEB-INF/views/Navbar.jsp"/>
<jsp:include page="/WEB-INF/views/Navbar2.jsp"/>
<br /><br /><br />
<form action="../desboard/write" name="wirteFrm" method="post" enctype="multipart/form-data"	
			onsubmit="return validateForm(this)">
<!-- 			세션에 저장된 유저no -->
		<input type="hidden" name="no" id="userno" value="<sec:authentication property="principal.no"/>" />
		
<%-- 		<c:set var="userRegion" value="<sec:authentication property="principal.region"/>"></c:set> --%>
	<table border="1" class="table" style="width: 80%;margin: auto;">
		<tr>
			<td>지역</td>
			
			<td>
				${post.region }
			</td>
		</tr>
		<tr>
			<td>제목</td>
			<td>
				${post.title }
			</td>
		</tr>
		<tr>
			<td>내용</td>
			<td>${post.content }</td>
		</tr>
		<tr>
			<td colspan="2" align="center">
				<c:if test="${userno == post.user.no}">
			        		<a href="/desboard/${post.DABno}/updateform" class="btn btn-light">수정</a>
			        		<a href="/desboard/${post.DABno}/delete" class="btn btn-danger" id="delete">삭제</a>
	        	</c:if>
				<button class="btn btn-light sm" type="button" onclick="location.href='/desboard/list/'">목록으로 돌아가기</button>
			</td>
		</tr>
	</table>		
	</form>
		
</body>
</html>