const l_link = $('#login')
const j_link = $('#join')
const o_link = $('#logout')

if (uDto !== '' && uDto !== 'null') {
	l_link.hide();
	j_link.hide();
	o_link.show();
} else {
	l_link.show();
	j_link.show();
	o_link.hide();
}



// 페이지 로드 시 실행
document.addEventListener('DOMContentLoaded', function() {
	// 저장된 아이디 가져오기
	const storedUserId = localStorage.getItem('rememberId');

	// 저장된 아이디가 있다면 폼에 설정
	if (storedUserId) {
		document.getElementById('userPw').value = storedUserId;
		document.getElementById('remember').checked = true;
	}
});

// 폼 제출 시 실행
document.querySelector('form').addEventListener('submit', function() {
	// "Remember Me" 체크된 경우 아이디 저장
	if (document.getElementById('remember').checked) {
		const userId = document.getElementById('userPw').value;
		localStorage.setItem('rememberId', userId);
	} else {
		// 체크 안된 경우 저장된 아이디 삭제
		localStorage.removeItem('rememberId');
	}
});

