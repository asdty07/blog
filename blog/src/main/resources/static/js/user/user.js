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
