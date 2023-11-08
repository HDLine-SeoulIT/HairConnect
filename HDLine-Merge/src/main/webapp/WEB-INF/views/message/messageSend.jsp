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
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<link rel="stylesheet" text="html/css" href="/css/M.css">
<title></title>
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
       		<c:forEach items="${messagelist}" var="list">
       		<div class="card mb-8" style="max-width: 80%; margin: auto; float: none;">
		    	<div class="col-md-8">
			      	<div class="card-body">
			        	<h5 class="card-title">${list.title}</h5>
			        	<p class="card-text">${list.content }</p>
			        	<p class="card-text" ><a class="text-muted" href="/message/messageForm/${list.reciever }">${list.reciver }</a></p>
			        	<p class="card-text">
			        		<a href="/message/delete/${list.message_no}" class="btn btn-danger" id="delete">삭제</a>
			        	</p>
		      		</div>
		  		</div>
		  	</div>
       		</c:forEach>
		</div>
   </div>
</body>
</html>