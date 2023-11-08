<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>수정 결과</title>
  <script type="text/javascript">
        alert("${message}");
        window.location = "/admin/memberlist"; // memberlist 페이지로 이동
    </script>
</head>
<body>
	<h1>${message}</h1>
</body>
</html>