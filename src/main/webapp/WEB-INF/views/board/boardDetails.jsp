<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@include file="../layout/header.jsp"%>
<link rel="stylesheet" href="css/board/boardDetail.css">

<c:if test="${not empty bDto}">
	<div class="content-container">
		<p>글 번호: ${bDto.b_num}</p>
		<p>작성자: ${bDto.b_title}</p>
		<p>제목: ${bDto.b_name}</p>
		<p>내용: ${bDto.b_content}</p>
		<p>날짜: ${bDto.b_date}</p>
		<hr>
	</div>
</c:if>

<script type="text/javascript">
	let bDto = '${bDto}'

	console.log(bDto)
</script>

<%@include file="../layout/footer.jsp"%>