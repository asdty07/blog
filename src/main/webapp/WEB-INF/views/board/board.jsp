<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@include file="../layout/header.jsp"%>
<link rel="stylesheet" href="css/board/board.css">

<%-- <c:if test="${not empty boardList}"> --%>
<%--     <c:forEach var="boardDto" items="${boardList}"> --%>
<%--         <p>글 번호: ${boardDto.b_num}</p> --%>
<%--         <p>제목: ${boardDto.b_title}</p> --%>
<%--         <p>내용: ${boardDto.b_content}</p> --%>
<%--         <p>날짜: ${boardDto.b_date}</p> --%>
<!--         <hr> -->
<%--     </c:forEach> --%>
<%-- </c:if> --%>

<%-- <input type="hidden" value="${boardList}" id="boardList"> --%>

 <div class="page-title">
    <div class="container">
        <h3>게시판</h3>
    </div>
</div>

<div id="board-list">
	<div class="container">
		<table class="board-table">
			<thead>
				<tr>
					<th scope="col" class="th-num">번호</th>
					<th scope="col" class="th-title">제목</th>
					<th scope="col" class="th-date">등록일</th>
				</tr>
			</thead>
			<tbody id="board-list-body">
				<!-- Add an id to the tbody for easier selection -->
			</tbody>
		</table>
		
		<button class="boardWrite" id="boardWrite" onclick="boardWrite()">글 작성</button>
	</div>
</div>

<script type="text/javascript">
	let boardList = ${jsonBoardList};
</script>

<script src="js/board/board.js"></script>

<%@include file="../layout/footer.jsp"%>