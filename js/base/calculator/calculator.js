function calculate() {
	'use strict';
	var total;
	var quantity = $('quantity').value;
	var price = $('price').value;
	var tax = $('tax').value;
	var discount = $('discount').value;
	total = quantity * price;
	tax /= 100;
	tax++;
	total *= tax;
	total -= discount;
	$('total').value = total.toFixed(2);
	return false;
}

function init() {
	'use strict';
	var theForm = $('theForm');
	theForm.onsubmit = calculate;
}

window.onload = init;