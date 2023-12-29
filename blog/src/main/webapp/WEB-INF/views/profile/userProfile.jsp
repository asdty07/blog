<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%@include file="../layout/header.jsp"%>

<div class="container">
	<h2>User Profile</h2>

    <div class="card">
        <div class="card-body">
            <h4 class="card-title" id="u_name">이름 : ${uDto != null ? uDto.u_name : '이름'}</h4>
            <p class="card-text">프로필 내용을 여기에 추가하세요.</p>
            <!-- 프로필 내용을 동적으로 추가할 수 있습니다. -->
            <a href="#" class="btn btn-primary">프로필 수정</a>
        </div>
    </div>
</div>

<script type="text/javascript">

	const l_link = $('#login')
	const j_link = $('#join')
	const o_link = $('#logout')

	if ('${uDto.u_id}' !== '' || '${uDto.u_id}' !== 'null') {
		l_link.hide();
		j_link.hide();
		o_link.show(); // 로그아웃이 로그인과 회원가입 대신에 보이도록 변경
	} else {
		l_link.show();
		j_link.show();
		o_link.hide(); // 로그아웃이 로그인과 회원가입 대신에 숨겨지도록 변경
	}
</script>

<%@include file="../layout/footer.jsp"%>