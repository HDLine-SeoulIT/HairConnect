<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>   
<%@ taglib uri = "http://www.springframework.org/security/tags" prefix="sec" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
  body {
    font-family: Arial, sans-serif;
    background-color: #f5f5f5;
  }

  h1 {
    text-align: center;
  }

  form {
    background-color: #fff;
    width: 600px;
    margin: 0 auto;
    padding: 20px;
    border: 1px solid #ddd;
    border-radius: 5px;
    box-shadow: 0 2px 4px rgba(0, 0, 0, 0.2);
  }

  label {
    display: block;
    margin-top: 10px;
  }

  input[type="text"],
  input[type="password"],
  textarea {
    width: 90%;
    padding: 10px;
    margin-top: 5px;
    border: 1px solid #ccc;
    border-radius: 5px;
  }

  button[type="submit"] {
    background-color: #03A9F4;
    color: #fff;
    font-weight: bold;
    border: none;
    padding: 10px 20px;
    margin-top: 10px;
    cursor: pointer;
    border-radius: 5px;
    box-shadow: 0 2px 4px rgba(0, 0, 0, 0.2);
  }
</style>
</head>
<body>
<jsp:include page="/WEB-INF/views/Navbar.jsp"/>
<jsp:include page="/WEB-INF/views/Navbar2.jsp"/>
    <h1>게시물 수정</h1>
    <form action="/freeboard/boardlist/update/${post.no}" method="post">
        <sec:authentication property='principal.no' var="userno"/>
        <input type="text" name="title" value="${post.title}" placeholder="제목"><br>
        <textarea name="content" placeholder="내용">${post.content}</textarea><br>
        <button type="submit">수정</button>
    </form>
</body>
</html>