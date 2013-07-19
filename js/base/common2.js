var U = {

    $: function(id) {
        'use strict';
        if(typeof id != undefined) {
            return document.getElementById(id);
        }
    },
    setText: function(elementId, message) {
        'use strict';
        if((typeof elementId == 'string') && (typeof message == 'string')) {
            var output = this.$(elementId);
            if(output.textContent !== undefined) {
                output.textContent = message;
            } else {
                output.innerText = message;
            }
        }
    },
    addEvent: function(obj, type, fn) {
        if(obj && obj.addEventListener) { //for modern and IE9 upper
            obj.addEventListener(type, fn, false);
        } else if (obj && obj.attachEvent) { //for IE8 below
            obj.attachEvent('on' + type, fn);
        }
    },
    removeEvent: function(obj, type, fn) {
        if(obj && obj.removeEventListener) {
            obj.removeEventListener(type, fn, false);
        } else if (obj && obj.detachEvent) {
            obj.detachEvent('on' + type, fn);
        }
    }
};