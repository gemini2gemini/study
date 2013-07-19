function calculate() {
	'use strict';
	var cost;
	var type = $('type');
	var years = $('years');
	if(years && years.value) {
		years = parseInt(years.value, 10);
		if(type && type.value && (years > 0)) {
			switch(type.value) {
			case 'basic':
				cost = '10.00';
				break;
			case 'premium':
				cost = '15.00';
				break;
			case 'gold':
				cost = '20.00';
				break;
			case 'platinum':
				cost = '25.00';
				break;
			}
			cost *= years;
			if (years > 1) {
				cost *= .80;
			}
			$('cost').value = '$' + cost.toFixed(2);
		}
		else {
			$('cost').value = '有効な値を入力してください';
		}
	}
	return false;
}

function init() {
	'use strict';
	var theForm = $('theForm');
	theForm.onsubmit = calculate;
}
window.onload = init;