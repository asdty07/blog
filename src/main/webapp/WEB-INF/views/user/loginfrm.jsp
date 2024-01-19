<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@include file="../layout/header.jsp"%>

<div class="container">
	<h2>로그인</h2>
	<form action="/login" method="post">
		<div class="form-group">
			<label for="email">Email</label> <input type="email"
				class="form-control" id="userId" placeholder="Enter email"
				name="u_id">
		</div>
		<div class="form-group">
			<label for="pwd">Password</label> <input type="password"
				class="form-control" id="userPw" placeholder="Enter password"
				name="u_pw" value="${rememberId}">
		</div>
		<div class="form-group form-check">
			<label class="form-check-label"> <input
				class="form-check-input" type="checkbox" name="remember"
				id="remember" ${rememberId ? 'checked' : ''}> Remember me
			</label>
		</div>
		<button type="submit" class="btn btn-primary">로그인</button>
	</form>
</div>

<script>
	const uDto = '${uDto}';
</script>

<script type="text/javascript" src="js/user/user.js"></script>

<%@include file="../layout/footer.jsp"%>
