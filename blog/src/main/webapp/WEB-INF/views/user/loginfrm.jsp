<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@include file = "../layout/header.jsp" %>

<div class="container">
  <h2>로그인</h2>
  <form action="/login" method="post">
    <div class="form-group">
      <label for="email">Email</label>
      <input type="email" class="form-control" id="email" placeholder="Enter email" name="u_id">
    </div>
    
    <div class="form-group">
      <label for="pwd">Password</label>
      <input type="password" class="form-control" id="pwd" placeholder="Enter password" name="u_pw">
    </div>
    
    <div class="form-group form-check">
      <label class="form-check-label">
        <input class="form-check-input" type="checkbox" name="remember"> Remember me
      </label>
    </div>
    
    <button type="submit" class="btn btn-primary">로그인</button>
  </form>
</div>

<%@include file = "../layout/footer.jsp" %>
