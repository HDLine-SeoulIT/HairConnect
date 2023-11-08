<%@ page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%-- core 라이브러리 적용 --%>	
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>  
<%@ taglib prefix="sec"  uri="http://www.springframework.org/security/tags" %>
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

</head>
<body >
<%@ include file="/WEB-INF/views/Navbar.jsp" %>
<div style="align-content: center;">
   <form method="get" action="/desboard/search">
		<table border="1" class="table table-hover"
			style="width: 80%; margin: auto;">
			<tr>
				<td align="center"><select name="searchField">
						<option value="title">제목</option>
						<option value="content">내용</option>
<!-- 						<option value="nickname">닉네임</option> -->
						<c:if test="${not empty id }">
							<c:if test="${id=='admin' }">
								<option value="id">아이디</option>
							</c:if>
						</c:if>
				</select> <input type="text" name="keyword" /> <input type="submit"
					value="검색하기" /></td>
			</tr>
		</table>
	</form>
	<table style="width: 80%; border: none; margin: auto;">
		<tr align="center">
<%-- 			<td style="width: *;">${map.pagingImg }</td> --%>
<%-- 			<c:if test="${ id != null }"> --%>
				<td width="100" align="right"><button type="button"
						class="btn btn-outline-secondary btn-sm"
						onclick="location.href='../desboard/writeform';">글쓰기</button></td>
<%-- 			</c:if> --%>
		</tr>
	</table>
	</div>
	<div style="align-items: center;">
   <c:forEach items="${boardPage.content}" var="list"> 
	   <div class="card mb-8" style="max-width: 80%; margin: auto; float: none;">
		  	<div class="row g-0">
			    <div class="col-md-4" style="max-width: 300px;">
			    	<div style="width:200px; height: 200px; overflow: hidden">
			      		<img src="Uploads/${list.currentphoto }" class="img-fluid img-thumbnail rounded-start" alt="...">
			      	</div>
			    	<div style="width:200px; height: 200px; overflow: hidden">
			      		<img src="http://loaclhost:8082/image?image=${list.currentphoto }" class="img-fluid img-thumbnail rounded-start" alt="...">
			      	</div>
			    	<div style="width:200px; height: 200px; overflow: hidden">
			      		<img src="http://loaclhost:8082/static/Uploads/${list.currentphoto }" class="img-fluid img-thumbnail rounded-start" alt="...">
			      	</div>
			    	<div style="width:200px; height: 200px; overflow: hidden">
			      		<img src="${pageContext.request.contextPath }/resources/uploads/${list.currentphoto }" class="img-fluid img-thumbnail rounded-start" alt="...">
			      	</div>
			    	<div style="width:200px; height: 200px; overflow: hidden">
			      		<img src="${list.filepath}${list.currentphoto}" class="img-fluid img-thumbnail rounded-start" alt="...">
			      	</div>
	   		 	</div>
		    	<div class="col-md-8">
			      	<div class="card-body">
			        	<h5 class="card-title">${list.title}</h5>
			        	<p class="card-text">${list.content }</p>
			        	<p class="card-text"><small class="text-muted">${list.user.email }</small></p>
			        	<c:if test="<sec"></c:if>
		      		</div>
		  		</div>
		  	</div>
		</div>
		<br />
			<table style="width: 80%; border: none; margin: auto;">
		<tr align="center">
			<td style="width: *;">${map.pagingImg }</td>
			<c:if test="${ id != null }">
				<td width="100" align="right"><button type="button"
						class="btn btn-outline-secondary btn-sm"
						onclick="location.href='../desboard/write';">모델 등록</button></td>
			</c:if>
		</tr>
	</table>
	</c:forEach>
	</div>
	
</body>
</html>