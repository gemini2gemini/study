function reportEvent(e) {
    'use strict';
    if(typeof e == 'undefined') e = window.event; //イベント参照変数の取得
    var target = e.target || e.srcElement; //イベントのプロパティ
    var msg = target.nodeName + ':' + e.type + '\n'; //イベントの出力
    U.$('output').value += msg;
    console.log(msg);
}

function setHandlers() {
    'use strict';
    var events = ['mouseover', 'mouseout', 'click', 'keypress', 'blur'];
    for (var i = 0, count = events.length; i < count; i++) {
        var checkbox = U.$(events[i]);
        if (checkbox.checked) {
            U.addEvent(document, events[i], reportEvent);
        } else {
            U.removeEvent(document, events[i], reportEvent);
        }
    }
    U.$('output').value = '';
    return false;
}

window.onload = function() {
    'use strict';
    U.$('theForm').onsubmit = setHandlers;
}
