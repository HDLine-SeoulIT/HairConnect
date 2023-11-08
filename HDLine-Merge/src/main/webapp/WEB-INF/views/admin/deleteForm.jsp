<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
            padding: 5px 10px;
            cursor: pointer;
            border-radius: 5px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.2);
        }
    </style>
</head>
<body>
   <h1>회원 삭제</h1>
    <form action="/admin/members/delete/${member.no}" method="post">
        <input type="hidden" name="no" value="${member.no}" />
        <p>회원 아이디: ${member.userid}</p>
        <p>이름: ${member.username}</p>
        <p>이 회원을 삭제하시겠습니까?</p>
        <button type="submit">삭제</button>
    </form>
</body>
</html>