function $(id) {
    'use strict';
    if(typeof id != undefined) {
        return document.getElementById(id);
    }
}

function setText(elementId, message) {
    'use strict';
    if((typeof elementId == 'string') && (typeof message == 'string')) {
        var output = $(elementId);
        if(output.textContent !== undefined) {
            output.textContent = message;
        } else {
            output.innerText = message;
        }
    }
}
function addEvent(obj, type, fn) {
    if(obj && obj.addEventListener) {
        obj.addEventListener(type, fn, false);
    } else if (obj && obj.attachEvent) {
        obj.attachEvent('on' + type, fn);
    }
}