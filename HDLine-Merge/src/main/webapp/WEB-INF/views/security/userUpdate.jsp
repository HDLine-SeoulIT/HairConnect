<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html class="h-100" xmlns:th="http://www.thymeleaf.org" xmlns:sec="http://www.thymeleaf.org/extras/spring-security">>
<head th:replace="layout/header :: head ('회원수정')">
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body class="text-center d-flex flex-column h-100">
	<jsp:include page="/WEB-INF/views/Navbar.jsp"></jsp:include>
	<jsp:include page="/WEB-INF/views/Navbar2.jsp"></jsp:include>
	<header th:replace="layout/header :: header"></header>

<main class="form-signin">
    <div class="container border rounded flex-md-row mb-4 shadow-sm h-md-250">
        <form id="needs-validation" novalidate>
            <h1 class="h3 m-3 fw-normal">회원가입</h1>
            <input type="hidden" id="id" th:value="${#authentication.principal.id}">
            <div class="form-floating m-3">
                <input type="text" th:value="${#authentication.principal.username}" class="form-control" id="username" placeholder="아이디를 입력하세요." required
                       minlength="4" size="20" readonly>
                <label for="username">아이디</label>
                <div class="valid-feedback">
                    good!
                </div>
                <div class="invalid-feedback">
                    아이디는 4자 이상 입력해야 합니다.
                </div>
            </div>

            <div class="form-floating m-3">
                <input type="password" class="form-control" id="password" placeholder="패스워드를 입력하세요." required
                       minlength="8" size="20">
                <label for="password">패스워드</label>
                <div class="valid-feedback">
                    very good!
                </div>
                <div class="invalid-feedback">
                    패스워드는 8자 이상 입력해야 합니다.
                </div>
            </div>
            <div class="form-floating m-3">
                <input type="email" th:value="${#authentication.principal.email}" class="form-control" id="email" placeholder="이메일을 입력하세요." required readonly>
                <label for="email">이메일</label>
                <div class="valid-feedback">
                    nice!
                </div>
                <div class="invalid-feedback">
                    이메일 형식으로 입력해야 합니다.
                </div>
            </div>
            <div class="form-floating m-3">
                <input type="text" th:value="${#authentication.principal.nickname}" class="form-control" id="nickname" placeholder="닉네임을 입력하세요." required
                       minlength="4" size="20">
                <label for="nickname">닉네임</label>
                <div class="valid-feedback">
                    very nice!
                </div>
                <div class="invalid-feedback">
                    닉네임은 4자 이상 입력해야 합니다.
                </div>
            </div>
        </form>
        <button class="w-100 btn btn-lg btn-success" id="btn-update">회원수정</button>
    </div>
</main>

<footer th:replace="layout/footer :: footer"></footer>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
        crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"
        integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
<script th:src="@{/js/validation-update.js}"></script>
<script th:src="@{/js/user.js}"></script>
</body>
</html>