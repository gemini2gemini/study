function limitText() {
	'use strict';
	var limitedText;
	var originalText = $('comments').value;
	var lastSpace = originalText.lastIndexOf('', 100);
	limitedText = originalText.slice(0, lastSpace);
	$('count').value = originalText.length;
	$('result').value = limitedText;
	return false;
}

function init() {
	'use strict';
	var theForm = $('theForm');
	theForm.onsubmit = limitText;
}

window.onload = init;