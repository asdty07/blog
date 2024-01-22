<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@include file="../layout/header.jsp"%>
<link rel="stylesheet" href="css/board/boardWrite.css">
<link
	href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>
<script
	src=" https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.18/lang/summernote-ko-KR.min.js"></script>

<h2>게시판 글쓰기</h2>

<main>
	<form class="write" action="/board/boardInsert" method="post" onsubmit="prepareAndSubmit()">
		<label for="title">제목</label> <input type="text" name="b_title"
			placeholder="제목을 입력해주세요." required>
		<hr>
		<div class="form-group">
			<label for="content">내용</label>
			<textarea class="form-control summernote" rows="5" id="content"
				name="b_content"></textarea>
		</div>
		<input type="hidden" name="b_date" id="b_date" value="">
		<div class="button">
			<input type="submit" value="write"> &nbsp; <a href="#">취소</a>
		</div>
	</form>
</main>

<script type="text/javascript">
	$('.summernote').summernote({
		tabsize : 2,
		height : 300
	});

	function prepareAndSubmit() {
		var currentDate = new Date();
		var formattedDate = currentDate.toISOString().slice(0, 10);
		document.getElementById("b_date").value = formattedDate;
		return true; // 폼이 제출될 수 있도록 true 반환
	}
</script>

<%@include file="../layout/footer.jsp"%>
