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
<style type="text/css">
  a {
    color: #73685d;
  }

  .pagination {
    margin: 20px 0;
    text-align: center;
    margin: auto;
    align-content: center;
  }

  .pagination a, .pagination span {
    display: inline-block;
    padding: 5px 10px;
    margin: 5px;
    border: 1px solid #73685d;
    background: #fff;
    color: #73685d;
    border-radius: 5px;
    text-decoration: none;
  }
</style>
</head>
<body >
<%-- <%@ include file="/WEB-INF/views/Navbar.jsp" %> --%>
<jsp:include page="/WEB-INF/views/Navbar.jsp"/>
<jsp:include page="/WEB-INF/views/Navbar2.jsp"/>
<br />
<div style="align-content: center;">
   <form method="get" action="/desboard/list/${region}/search">
		<table border="1" class="table table-hover"
			style="width: 80%; margin: auto;">
			<tr>
				<td align="center"><select name="searchField">
						<option value="title">제목</option>
						<option value="content">내용</option>
<!-- 						<option value="nickname">닉네임</option> -->
<%-- 						<c:if test="${not empty id }"> --%>
<%-- 							<c:if test="${id=='admin' }"> --%>
<!-- 								<option value="id">아이디</option> -->
<%-- 							</c:if> --%>
<%-- 						</c:if> --%>
				</select> <input type="text" name="keyword" /> <input type="submit"	value="검색하기" />
				&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<sec:authentication property="principal.classify" var="userClass"/>
					<c:if test="${ userClass == 'shop'}">
						<button type="button"
							class="btn btn-outline-secondary btn-sm"
							onclick="location.href='/desboard/writeform';">글쓰기</button>
						
					</c:if>
				
				
			</tr>
		</table>
	</form>
	</div>
	<div style="align-items: center; width: 100%; margin: auto; text-align: center;">
	<c:choose>
			<c:when test="${ empty boardPage.content }">
				<tr>
					<td  align="center">등록된 게시물이 없습니다^^*</td>
				</tr>
			</c:when>
	<c:otherwise>
   <c:forEach items="${ boardPage.content}" var="list"> 
	   <div class="card mb-8" style="max-width: 80%; margin: auto; float: none;">
		  	<div class="row g-0">
			    <div class="col-md-4" style="max-width: 300px;">
			    	<div style="width:200px; height: 200px; overflow: hidden">
			      		<img src="/img/shor.jpg" class="img-fluid img-thumbnail rounded-start" alt="...">
			      	</div>
	   		 	</div>
		    	<div class="col-md-8">
			      	<div class="card-body">
			        	<h5 class="card-title"><a href="/desboard/detail/${list.DABno }">${list.title} </a></h5>
			        	<p class="card-text">${list.content }</p>
			        	<p class="card-text" ><a class="text-muted" href="/message/messageForm/${list.user.userid }" >${list.user.userid }</a></p>
<%-- 			        	<p class="card-text" ><a class="text-muted" href="#" target="_blank">${list.user.no }</a></p> --%>
			        	
			        	<c:if test="${userno == list.user.no}">
			        	<p class="card-text">
			        		<a href="/desboard/${list.DABno}/updateform" class="btn btn-light">수정</a>
			        		<a href="/desboard/${list.DABno}/delete" class="btn btn-danger" id="delete">삭제</a>
			        	
			        	</p>
			        	</c:if>
		      		</div>
		  		</div>
		  	</div>
		</div>
		<br />
	</c:forEach>
	</c:otherwise>
	</c:choose>
	</div>
	<div style="align-self: center; margin: auto; align-content: center; width: 80%">
        <c:if test="${not empty boardPage.content}">
            <ul class="pagination" style="align-self: center;">
                <c:choose>
                    <c:when test="${boardPage.number > 0}">
                        <li><a href="?page=0">First</a></li>
                        <li><a href="?page=${boardPage.number - 1}">Previous</a></li>
                    </c:when>
                    <c:otherwise>
                        <li class="disabled"><span>First</span></li>
                        <li class="disabled"><span>Previous</span></li>
                    </c:otherwise>
                </c:choose>

                <c:forEach begin="0" end="${boardPage.totalPages - 1}" varStatus="i">
                    <c:choose>
                        <c:when test="${boardPage.number == i.index}">
                            <li class="active"><span>${i.index + 1}</span></li>
                        </c:when>
                        <c:otherwise>
                            <li><a href="?page=${i.index}">${i.index + 1}</a></li>
                        </c:otherwise>
                    </c:choose>
                </c:forEach>

                <c:choose>
                    <c:when test="${boardPage.number < boardPage.totalPages - 1}">
                        <li><a href="?page=${boardPage.number + 1}">Next</a></li>
                        <li><a href="?page=${boardPage.totalPages - 1}">Last</a></li>
                    </c:when>
                    <c:otherwise>
                        <li class="disabled"><span>Next</span></li>
                        <li class="disabled"><span>Last</span></li>
                    </c:otherwise>
                </c:choose>
            </ul>
        </c:if>
    </div>
</body>
</html>