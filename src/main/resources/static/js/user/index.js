const l_link = $('#login')
const j_link = $('#join')
const o_link = $('#logout')
const profile = $('#profile')

if (uDto !== '' && uDto !== 'null') {
	l_link.hide();
	j_link.hide();
	o_link.show(); // 로그아웃이 로그인과 회원가입 대신에 보이도록 변경
	profile.show()
} else {
	l_link.show();
	j_link.show();
	o_link.hide(); // 로그아웃이 로그인과 회원가입 대신에 숨겨지도록 변경
	profile.hide();
}
