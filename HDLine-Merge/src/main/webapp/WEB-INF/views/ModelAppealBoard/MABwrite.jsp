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

 </script>
 </head>
<body>
<sec:authentication property="principal.region" var="userRegion"/>
<c:set var="user" value="${userRegion }"></c:set>
<jsp:include page="/WEB-INF/views/Navbar.jsp"/>
<jsp:include page="/WEB-INF/views/Navbar2.jsp"/>
<br /><br /><br />
<form action="../modelboard/write" name="wirteFrm" method="post" enctype="multipart/form-data"	
			onsubmit="return validateForm(this)">
<!-- 			세션에 저장된 유저no -->
		<input type="hidden" name="no" id="userno" value="<sec:authentication property="principal.no"/>" />
		
<%-- 		<c:set var="userRegion" value="<sec:authentication property="principal.region"/>"></c:set> --%>
	<table border="1" class="table" style="width: 80%;margin: auto;">
		<tr>
			<td>지역</td>
			
			<td>

				<select name="region" id="regionselector" >
                            <option value="서울" <c:if test="${userRegion eq '서울' }">selected</c:if> >서울</option>
                            <option value="경기인천" <c:if test="${userRegion eq '경기인천' }">selected</c:if>>경기인천</option>
                            <option value="충청전라"<c:if test="${userRegion eq '충청전라' }">selected</c:if>>충청전라</option>
                            <option value="경상부산" <c:if test="${userRegion eq '경상부산' }">selected</c:if>>경상부산</option>
                            <option value="강원" <c:if test="${userRegion eq '강원' }">selected</c:if>>강원</option>
                            <option value="제주" <c:if test="${userRegion eq '제주' }">selected</c:if>>제주</option>
                        </select>
			</td>
		</tr>
		<tr>
			<td>제목</td>
			<td>
				<input type="text"  name="title" style="width:90%; "/>
			</td>
		</tr>
		<tr>
			<td>내용</td>
			<td>
				<textarea name="content" style="width:90%;height:200px"></textarea>
			</td>
		</tr>
		<tr>
			<td>첨부 파일</td>
			<td><input type="file" name="file" id="" /> </td>
		</tr>
		<tr>
			<td colspan="2" align="center">
				<button class="btn-light sm" type="submit" id="sub">작성완료</button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<button class="btn-light sm" type="reset">reset</button>	
				<button class="btn-light sm" type="button" onclick="location.href='/modelboard/list;">목록 바로가기</button>
			</td>
		</tr>
	</table>		
	</form>
		
</body>
</html>