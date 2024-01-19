<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@include file="../layout/header.jsp"%>

<div class="container">
	<h2>User Profile</h2>

    <div class="card">
        <div class="card-body">
            <h4 class="card-title" id="u_name">이름</h4>
            <p class="card-text">프로필 내용을 여기에 추가하세요.</p>
            <!-- 프로필 내용을 동적으로 추가할 수 있습니다. -->
            <a href="#" class="btn btn-primary">프로필 수정</a>
        </div>
    </div>
</div>

<script type="text/javascript">
	let name = '${userName}'
	
	if(name != '' || name != 'null') {
		$('#u_name').text(name)	
	}
	
</script>

<%@include file="../layout/footer.jsp"%>