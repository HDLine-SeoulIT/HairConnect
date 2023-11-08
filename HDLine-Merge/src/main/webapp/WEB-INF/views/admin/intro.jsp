<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자메뉴</title>
<style>
  body {
    margin: 0;
    height: 100%;
    background-image: linear-gradient(to top, #d9afd9 0%, #97d9e1 100%);
    background-repeat: no-repeat;
    background-size: cover;
    background-attachment: fixed;
  }

  .button_container {
    position: absolute;
    left: 0;
    right: 0;
    top: 30%;
  }

  .btn {
    border: none;
    display: block;
    text-align: center;
    cursor: pointer;
    text-transform: uppercase;
    outline: none;
    overflow: hidden;
    position: relative;
    color: #fff;
    font-weight: 700;
    font-size: 15px;
    background-color: #222;
    padding: 17px 20px; /* 버튼의 가로 길이를 조절할 수 있는 padding 값으로 수정 */
    margin: 0 auto;
    box-shadow: 0 5px 15px rgba(0,0,0,0.20);
  }

  .btn span {
    position: relative;
    z-index: 1;
  }

  .btn:after {
    content: "";
    position: absolute;
    left: 0;
    top: 0;
    height: 490%;
    width: 140%;
    background: #78c7d2;
    -webkit-transition: all .5s ease-in-out;
    transition: all .5s ease-in-out;
    -webkit-transform: translateX(-98%) translateY(-25%) rotate(45deg);
    transform: translateX(-98%) translateY(-25%) rotate(45deg);
  }

  .btn:hover:after {
    -webkit-transform: translateX(-9%) translateY(-25%) rotate(45deg);
    transform: translateX(-9%) translateY(-25%) rotate(45deg);
  }
</style>
</head>
<body>
  <h1>관리자 메뉴</h1>
  <div class="button_container">
<!--     <a href="/admin/create" class="btn"><span>생성</span></a> -->
    <a href="/admin/memberlist" class="btn"><span>회원목록</span></a>
    <a href="/admin/freeboard/boardlist" class="btn"><span>게시물 목록</span></a>
    <a href="/admin/apblist" class="btn"><span>모델 게시판 목록</span></a> <!-- APB 목록 페이지로 이동 -->    
  </div>
</body>
</html>