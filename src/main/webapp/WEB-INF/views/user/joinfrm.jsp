<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@include file = "../layout/header.jsp" %>

<div class="container">
<h2>회원가입</h2>
<form action="/join" method="post">
    <div class="form-group">
    <label for="email">Email :</label>
    <input type="email" class="form-control" placeholder="Enter email" id="email" name="u_id">
  </div>
  
  <div class="form-group">
    <label for="pwd">Password :</label>
    <input type="password" class="form-control" placeholder="Enter password" id="pwd" name="u_pw">
  </div>

  <div class="form-group">
    <label for="name">UserName :</label>
    <input type="text" class="form-control" placeholder="Enter UserName" id="UserName" name="u_name">
  </div>
  
  <button type="submit" class="btn btn-primary">회원가입 완료</button>
</form>
</div>

<script>
    const uDto = ${uDto};
</script>

<script type="text/javascript" src="js/user/user.js"></script>

<%@include file = "../layout/footer.jsp" %>