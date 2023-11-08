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

  th {
    text-align: left;
    font-weight: bold;
    color: #fff;
    background: #73685d;
    padding: 1em 0.5em;
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

  .pagination {
    margin: 20px 0;
    text-align: center;
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
<body>
	<jsp:include page="/WEB-INF/views/Navbar.jsp"/>
	<jsp:include page="/WEB-INF/views/Navbar2.jsp"/>
  <h1>게시판 목록</h1>
  <table border="1">
    <thead>
      <tr>
        <th>게시물 번호</th>
        <th>제목</th>
        <th>작성자</th>
        <th>작성일</th>
      </tr>
    </thead>
    <tbody>
      <c:forEach items="${posts}" var="post">
        <tr>
          <td>${post.no}</td>
          <td><a href="${pageContext.request.contextPath}/freeboard/boardlist/${post.no}">${post.title}</a></td>
          <td>${post.members.userid}</td>
          <td><fmt:formatDate value="${post.createdate}" pattern="yyyy-MM-dd HH:mm:ss" /></td>
        </tr>
      </c:forEach>
    </tbody>
  </table>
  <a href="/freeboard/createForm">새 글 작성</a>
    <!-- 페이징 처리 -->
<c:if test="${totalPages > 1}">
    <div class="pagination">
        <c:choose>
            <c:when test="${currentPage > 0}">
                 <a href="${contextPath}/admin/freeboard/boardlist?page=${currentPage - 1}">이전</a>
            </c:when>
            <c:otherwise>
                <span>이전</span>
            </c:otherwise>
        </c:choose>
        <c:forEach begin="0" end="${totalPages - 1}" varStatus="page">
            <c:choose>
                <c:when test="${page.index == currentPage}">
                    <span>${page.index + 1}</span>
                </c:when>
                <c:otherwise>
                    <a href="${contextPath}/admin/freeboard/boardlist?page=${page.index}">${page.index + 1}</a>
                </c:otherwise>
            </c:choose>
        </c:forEach>

        <c:choose>
            <c:when test="${currentPage < totalPages - 1}">
                <a href="${contextPath}/admin/freeboard/boardlist?page=${currentPage + 1}">다음</a>
            </c:when>
            <c:otherwise>
                <span>다음</span>
            </c:otherwise>
        </c:choose>
    </div>
</c:if>
</body>
</html>