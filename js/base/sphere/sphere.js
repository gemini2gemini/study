function calculate() {
	'use strict';
	var total;
	var radius = $('radius').value;
	var volume = $('volume').value;
	if (radius && (radius > 0)) {
		//radius = Math.abs(radius);
		volume = (4/3) * Math.PI * Math.pow(radius, 3);
		volume = volume.toFixed(4);
		$('total').value = volume;
    }
	return false;
}

function init() {
	'use strict';
	var theForm = $('theForm');
	theForm.onsubmit = calculate;
}

window.onload = init;