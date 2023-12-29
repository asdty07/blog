<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@include file="layout/header.jsp"%>

<div class="container">
	<div class="card" style="width: 400px">
		<img class="card-img-top" src="img_avatar1.png" alt="Card image">
		<div class="card-body">
			<h4 class="card-title" id="u_name">이름</h4>
			<p class="card-text" id="userDescription">자기소개글</p>
			<%-- 			<a href="user/profile?userId=${uDto.u_id}" class="btn btn-primary">상세 보기</a> --%>
<!-- 			<form action="user/profile" method="post"> -->
<%-- 				<input type="hidden" name="userId" value="${uDto.u_id}"> --%>
<!-- 				<button type="submit" class="btn btn-primary">상세 보기</button> -->
<!-- 			</form> -->
			<a href="/user/profile" class="btn btn-primary" id="profileBtn">상세 보기</a>
		</div>
	</div>
</div>

<script type="text/javascript">
	let m = '${msg}'

	if (m != '') {
		alert(m)
	}

	const uName = '${uDto.u_name}'
	// 	const uId = '${uDto.u_id}'
	// const uPw = '${uDto.u_pw}'
	const uDto = '${uDto}'
	console.log(uName)
	// 	console.log(uId)
	// console.log(uPw)
	console.log(uDto)

	$('#u_name').text(uName)
	// $('#userDescription')

	const l_link = $('#login')
	const j_link = $('#join')
	const o_link = $('#logout')

	if (uDto !== '') {
		l_link.hide();
		j_link.hide();
		o_link.show(); // 로그아웃이 로그인과 회원가입 대신에 보이도록 변경
	} else {
		l_link.show();
		j_link.show();
		o_link.hide(); // 로그아웃이 로그인과 회원가입 대신에 숨겨지도록 변경
		$('#u_name').text('이름')
	}
</script>

<%@include file="layout/footer.jsp"%>