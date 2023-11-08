<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>

table {
    width: 700px;
    text-align: center;
    border: 1px solid #fff;
    font-family: 'Cairo', sans-serif;
    border-collapse: separate;
    border-spacing: 1px;
  	margin: auto;
}

caption {
    font-weight: bold;
}

table td {
    padding: 10px;
    background-color: #eee;
}

table th {
    background-color: #333;
    color: #fff;
    padding: 10px;
}

img {
    width: 90px;
    height: 90px;
}

.view,
.delete {
    border: none;
    padding: 5px 10px;
    color: #fff;
    font-weight: bold;
}

.view {
    background-color: #03A9F4;
}

.delete {
    background-color: #E91E63;
}

.tablefoot {
    padding: 0;
    border-bottom: 3px solid #009688;
}
.edit-button,
.delete-button {
    display: inline-block;
    width: 60px; /* 원하는 너비로 조정 */
    height: 30px; /* 버튼의 높이 설정 */
    text-align: center; /* 가운데 정렬을 추가 */
    line-height: 30px; /* 버튼 텍스트 세로 중앙 정렬 */
    color: #fff;
    font-weight: bold;
    cursor: pointer;
    margin-right: 10px; /* 버튼 간격 조절 */
    border: none; /* 기존 테두리 제거 */
    background-color: transparent; /* 배경 색상 투명 설정 */
    border-radius: 50px; /* 동그랗게 만들기 */
    box-shadow: 0 2px 4px rgba(0, 0, 0, 0.2); /* 그림자 효과 추가 */
}

.edit-button {
    background-color: #03A9F4;
}

.delete-button {
    background-color: #E91E63;
}
.pagination-container {
    text-align: center;
    margin: 20px auto; /* 페이지네이션을 수평 중앙에 배치합니다. */
}

.pagination {
    display: inline-block;
}

.current-page {
    background: #333;
    color: #fff;
    padding: 5px 10px;
    border-radius: 5px;
}
</style>
</head>
<body>
 <form method="get" action="/admin/memberlist/search">
        <input type="text" name="search" placeholder="검색어 입력">
        <button type="submit">검색</button>
    </form>
	<table>
        <caption>* 회원 목록 *</caption>
        <thead>
            <tr>
	            <th>Profile Image</th>
	            <th>ID</th>
	            <th>Name</th>
	            <th>Gender</th>
	            <th>Phone Number</th>
	            <th>Email</th>
	            <th>Address 1</th>
	            <th>Address 2</th>
	            <th>Classify</th>
	            <th>Introduction</th>
	            <th>Link URL</th>
	            <th>Region</th>
	            <th>Control</th>
            </tr>
         </thead>
         <tbody>
            <c:forEach items="${members}" var="member">
            <tr>
                <td>${member.profileimage}</td>
                <td>${member.userid}</td>
                <td>${member.username}</td>
                <td>${member.gender}</td>
                <td>${member.phonenumber}</td>
                <td>${member.email}</td>
                <td>${member.address1}</td>
                <td>${member.address2}</td>
                <td>${member.classify}</td>
                <td>${member.introduction}</td>
                <td>${member.linkurl}</td>
                <td>${member.region}</td>
				<td>
					<a class="edit-button" href="/admin/members/updateForm/${member.no}">Edit</a>
					<a class="delete-button" href="/admin/members/deleteForm/${member.no}">Delete</a>
				</td>
            </tr>
        </c:forEach>
        </tbody>
        <tfoot>
        	<tr>
        		<td colspan="13" class="tablefoot"></td>
        	</tr>
        </tfoot>
        </table>
        <!-- 페이징 처리 -->
<!-- 페이징 처리 -->
<div class="pagination-container">
    <c:if test="${totalPages > 1}">
        <div class="pagination">
            <c:choose>
                <c:when test="${currentPage > 0}">
                    <a href="/admin/memberlist?page=${currentPage - 1}">이전</a>
                </c:when>
                <c:otherwise>
                    <span>이전</span>
                </c:otherwise>
            </c:choose>
            <c:forEach begin="0" end="${totalPages - 1}" varStatus="page">
                <c:choose>
                    <c:when test="${page.index == currentPage}">
                        <span class="current-page">${page.index + 1}</span>
                    </c:when>
                    <c:otherwise>
                        <a href="/admin/memberlist?page=${page.index}">${page.index + 1}</a>
                    </c:otherwise>
                </c:choose>
            </c:forEach>

            <c:choose>
                <c:when test="${currentPage < totalPages - 1}">
                    <a href="/admin/memberlist?page=${currentPage + 1}">다음</a>
                </c:when>
                <c:otherwise>
                    <span>다음</span>
                </c:otherwise>
            </c:choose>
        </div>
    </c:if>
</div>
</body>
</html>