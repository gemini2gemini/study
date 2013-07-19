function process() {
	'use strict';
	var okay = true;
	var email = $('email');
	var comments = $('comments');
	if(!email || !email.value
	 || (email.value.length < 6)
	 || (email.value.indexOf('@') == -1)) {
		okay = false;
		console.log('有効なメールアドレスを入力して下さい');
	}
	if(!comments|| !comments.value || (comments.value.indexOf('<') != -1)) {
		okay = false;
		console.log('コメントはHTMLを使わずに入力してください');
	}
	return okay;
}

function init() {
	'use strict';
	var theForm = $('theForm');
	theForm.onsubmit = process;
}
window.onload = init;