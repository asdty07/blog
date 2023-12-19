<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@include file = "../layout/header.jsp" %>

<div class="container">
<h2>회원가입</h2>
<form action="/join" method="post">
  <div class="form-group">
    <label for="email">UserName :</label>
    <input type="text" class="form-control" placeholder="Enter UserName" id="UserName">
  </div>
  
    <div class="form-group">
    <label for="email">Email :</label>
    <input type="email" class="form-control" placeholder="Enter email" id="email">
  </div>
  
  <div class="form-group">
    <label for="pwd">Password :</label>
    <input type="password" class="form-control" placeholder="Enter password" id="pwd">
  </div>

  <button type="submit" class="btn btn-primary">회원가입 완료</button>
</form>
</div>


<%@include file = "../layout/footer.jsp" %>