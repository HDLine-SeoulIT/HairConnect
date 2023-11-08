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
 <h1>회원 정보 수정</h1>
    <form method="post" action="/admin/members/edit/${member.no}">
        <label for="userid">아이디:</label>
        <input type="text" id="userid" name="userid" value="${member.userid}" readonly><br>
        
        <label for="password">암호:</label>
        <input type="password" id="password" name="password" value="${member.password}" required><br>

        <label for="name">이름:</label>
        <input type="text" id="username" name="username" value="${member.username}" required><br>
        
        <label for="gender">성별:</label>
        <input type="text" id="gender" name="gender" value="${member.gender}" required><br>

        <label for="phonenumber">전화번호:</label>
        <input type="text" id="phonenumber" name="phonenumber" value="${member.phonenumber}"><br>

        <label for="email">이메일:</label>
        <input type="text" id="email" name="email" value="${member.email}"><br>

        <label for="address1">주소1:</label>
        <input type="text" id="address1" name="address1" value="${member.address1}"><br>

        <label for="address2">상세주소:</label>
        <input type="text" id="address2" name="address2" value="${member.address2}"><br>

        <label for="classify">분류:</label>
        <input type="text" id="classify" name="classify" value="${member.classify}" required><br>

        <label for="profileimage">프로필 사진:</label>
        <input type="text" id="profileimage" name="profileimage" value="${member.profileimage}"><br>

        <label for="introduction">간단한 자기소개:</label>
        <textarea id="introduction" name="introduction">${member.introduction}</textarea><br>

        <label for="linkurl">링크 URL:</label>
        <input type="text" id="linkurl" name="linkurl" value="${member.linkurl}"><br>

        <label for="region">지역:</label>
        <input type="text" id="region" name="region" value="${member.region}" required><br>

        <button type="submit">회원 정보 수정</button>
    </form>
</body>
</html>