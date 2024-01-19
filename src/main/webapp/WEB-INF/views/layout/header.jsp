<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>

<!DOCTYPE html>
<html lang="en">
<head>
  <title>My Blog</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <base href="${pageContext.request.contextPath}/">
<!--   JSP 페이지에서 사용하는 EL(표현 언어) 문법으로, 현재 웹 애플리케이션의 컨텍스트 경로를 동적으로 가져오는 표현식 -->
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
  <script src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.slim.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>

<nav class="navbar navbar-expand-md bg-dark navbar-dark">
  <a class="navbar-brand" href="/">My blog Home</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#collapsibleNavbar">
    <span class="navbar-toggler-icon"></span>
  </button>
  <div class="collapse navbar-collapse" id="collapsibleNavbar">
    <ul class="navbar-nav">
    	<sec:authorize access="isAnonymous()">
	      <li class="nav-item">
	        <a class="nav-link" href="user/loginfrm" id="login">로그인</a>
	      </li>
      </sec:authorize>
      
      <sec:authorize access="isAnonymous()">
	      <li class="nav-item">
	        <a class="nav-link" href="user/joinfrm" id="join">회원가입</a>
	      </li>
      </sec:authorize>
      
      <sec:authorize access="isAuthenticated()">
	      <li class="nav-item">
	        <a class="nav-link" href="user/logout" id="logout">로그아웃</a>
	      </li>
      </sec:authorize>

      <li class="nav-item">
        <a class="nav-link" href="/user/board" id="board">게시판 작성</a>
      </li>
    </ul>
  </div>  
</nav>
<br>
</body>
</html>
