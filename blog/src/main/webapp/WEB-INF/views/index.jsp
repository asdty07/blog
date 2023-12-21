<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@include file = "layout/header.jsp" %>

<div class="container">
<div class="card" style="width:400px">
  <img class="card-img-top" src="img_avatar1.png" alt="Card image">
  <div class="card-body">
    <h4 class="card-title" id="u_name">이름</h4>
    <p class="card-text" id="userDescription">자기소개글</p>
    <a href="#" class="btn btn-primary">상세 보기</a>
  </div>
</div>
</div>

<script type="text/javascript">
let m = '${msg}'

if(m != '') {
	alert(m)
}

const uName = '${uDto.u_name}'
// const uId = '${uDto.u_id}'
// const uPw = '${uDto.u_pw}'
const uDto = '${uDto}'
console.log(uName)
// console.log(uId)
// console.log(uPw)
console.log(uDto)

$('#u_name').text(uName)
// $('#userDescription')

const l_link = $('#login')
const j_link = $('#join')

if(uDto != null || uDto != '') {
	l_link.hide()
	j_link.hide()
} else {
	l_link.show()
	j_link.show()
}
</script>

<%@include file = "layout/footer.jsp" %>