function limitText() {
	'use strict';
    var comments = U.$('comments');
    var count = comments.value.length;
    U.$('count').value = count;
    if(count > 100) {
    	comments.value = comments.value.slice(0, 100);
    }
}

window.onload = function() {
    'use strict';
    U.addEvent(U.$('comments'), 'keyup', limitText);
    U.addEvent(U.$('comments'), 'change', limitText);
};