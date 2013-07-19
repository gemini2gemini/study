function init() {
	'use strict';
    var today = new Date();
    var message = '今日の日付は' + today.toLocaleString();
    message += 'で、時刻は' + today.getHours() + ':' + today.getMinutes();
    setText('output', message);
}

window.onload = init;