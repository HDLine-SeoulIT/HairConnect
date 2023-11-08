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
    font-family: Arial, sans-serif;
    background-color: #f5f5f5;
  }

  h1 {
    text-align: center;
  }

  form {
    background-color: #fff;
    width: 300px;
    margin: 0 auto;
    padding: 20px;
    border: 1px solid #ddd;
    border-radius: 5px;
    box-shadow: 0 2px 4px rgba(0, 0, 0, 0.2);
  }

  p {
    margin: 10px 0;
  }

  button[type="submit"] {
    background-color: #E91E63;
    color: #fff;
    font-weight: bold;
    border: none;
    padding: 10px 20px;
    cursor: pointer;
    border-radius: 5px;
    box-shadow: 0 2px 4px rgba(0, 0, 0, 0.2);
    width: 100%;
  }

  /* 추가한 스타일 */
  p {
    text-align: center; /* 텍스트 가운데 정렬 */
    background-color: #f5f5f5; /* 배경색 지정 */
    padding: 10px; /* 내부 여백 추가 */
    border-radius: 5px; /* 테두리 둥글게 만듦 */
  }

  i {
    font-size: 24px; /* 아이콘 크기 설정 */
    margin-right: 10px; /* 아이콘과 텍스트 사이 여백 추가 */
  }
</style>
</head>
<body>
<jsp:include page="/WEB-INF/views/Navbar.jsp"/>
<jsp:include page="/WEB-INF/views/Navbar2.jsp"/>
    <h1>게시물 삭제 확인</h1>
    <p>게시물을 삭제하시겠습니까?</p>
    <p>게시물 작성자: ${post.members.userid}</p>
    <p>제목: ${post.title}</p>
    <p>작성일: <fmt:formatDate value="${post.createdate}" pattern="yyyy-MM-dd HH:mm:ss" /></p>
    <form action="<c:url value='/freeboard/boardlist/delete/' />${post.no}" method="post">
        <button type="submit">삭제</button>
    </form>
  <a href="<c:url value='/freeboard/boardlist/' />${post.no}">취소</a>
</body>
</html>