<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
  body {
    padding: 1.5em;
    background: #f5f5f5;
  }

  table {
    border: 1px #a39485 solid;
    font-size: 0.9em;
    box-shadow: 0 2px 5px rgba(0, 0, 0, 0.25);
    width: 100%;
    border-collapse: collapse;
    border-radius: 5px;
    overflow: hidden;
  }

  td {
    padding: 1em 0.5em;
    vertical-align: middle;
    border-bottom: 1px solid rgba(0, 0, 0, 0.1);
    background: #fff;
  }

  a {
    color: #73685d;
  }

  @media all and (max-width: 768px) {
    table, th, td, tr {
      display: block;
    }

    td {
      text-align: right;
    }

    table {
      position: relative;
      padding-bottom: 0;
      border: none;
      box-shadow: 0 0 10px rgba(0, 0, 0, 0.2);
    }
  }
</style>
</head>
<body>
<jsp:include page="/WEB-INF/views/Navbar.jsp"/>
<jsp:include page="/WEB-INF/views/Navbar2.jsp"/>
	<h1>게시물 상세 조회</h1>
	<table>
		<tr>
			<td>게시물 번호:</td>
			<td>${post.no}</td>
		</tr>
		<tr>
			<td>제목:</td>
			<td>${post.title}</td>
		</tr>
		<tr>
			<td>내용:</td>
			<td>${post.content}</td>
		</tr>
		<tr>
			<td>작성자:</td>
			<td>${post.members.userid}</td>
		</tr>
		<tr>
			<td>작성일:</td>
			<td><fmt:formatDate value="${post.createdate}" pattern="yyyy-MM-dd HH:mm:ss" /></td>
		</tr>
	</table>
	<a href="/freeboard/boardlist/${post.no}/updateForm">게시물 수정</a>
	<a href="/freeboard/boardlist/${post.no}/deleteForm">게시물 삭제</a>
</body>
</html>