
function showNumbers(){
	var numbers = '';
	var i = 0;
    for(; i < 6; i++) {
        numbers += parseInt((Math.random() * 100), 10) + ' ';
    }
    setText('output', numbers);
}

function init() {
	'use strict';
    showNumbers();
}

window.onload = init;