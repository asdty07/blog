<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>	
<%@include file="layout/header.jsp"%>

<sec:authorize access="isAuthenticated()">
	<div class="container">
		<div class="card" style="width: 400px" id="profile">
			<img class="card-img-top" src="img_avatar1.png" alt="Card image">
			<div class="card-body">
				<h4 class="card-title" id="u_name">이름</h4>
				<p class="card-text" id="userDescription">자기소개글</p>
				<a href="/user/profile" class="btn btn-primary" id="profileBtn">상세 보기</a>
			</div>
		</div>
	</div>
</sec:authorize>

<script type="text/javascript">
	let m = '${msg}'

	if (m != '') {
		alert(m)
	}
	
	const name = '${name}'
	
	if(name != '' || name != 'null') {
		$('#u_name').text(name)
	}
</script>

<script type="text/javascript" src="js/user/index.js"></script>

<%@include file="layout/footer.jsp"%>