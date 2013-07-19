
window.onload = function() {
    'use strict';

	var ajax = getXMLHttpRequestObject();
	ajax.onreadystatechange = function() {

		if (ajax.readyState == 4) {

		    if ( (ajax.status >= 200 && ajax.status < 300)
		    || (ajax.status == 304) ) {

				// テキストバージョン
				//document.getElementById('output').innerHTML = ajax.responseText;

				// JSONバージョン
				var data = JSON.parse(ajax.responseText);
				var str = '';
				str += '1章: ' + data[1].title + '<br>';
				str += '2章: ' + data[2].title + '<br>';
				str += '3章: ' + data[3].title + '<br>';
				document.getElementById('output').innerHTML = str;

		    } else {
				document.getElementById('output').innerHTML = ajax.statusText;
		    }
		}
	};

    document.getElementById('btn').onclick = function() {
	    //ajax.open('GET', '../asset/test.txt', true);
	    ajax.open('GET', '../asset/test.json', true);
		ajax.send(null);
	};

};