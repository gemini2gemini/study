
function sortWords(max){
    'use strict';
    var words = $('words').value;
    words = words.split(' ');
    var sorted = words.map(function(value){
    	return value.toLowerCase();
    }).sort();
    setText('output', sorted.join(', '));
    return false;
}

function init() {
	'use strict';
	$('theForm').onsubmit = sortWords;
}

window.onload = init;