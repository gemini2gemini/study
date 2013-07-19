;
!function(){
    var tasks = [];
    function addTask(){
        'use strict'
        var task = U.$('task');
        var todo = U.$('todo');
        var message = '';
        var todo_message = '';
        if(task.value){
        	tasks.push(task.value);
        }
        message = 'to-doリストには ' + tasks.length + '個のやることがあります';
        U.setText('output', message);
        for(var i = 0; i < tasks.length; i++){
            todo_message += '<li>' + tasks[i] + '</li>';
        }
        todo.innerHTML = todo_message;
        return false;
    }

    function init() {
    	'use strict';
        U.$('theForm').onsubmit = addTask;
    }

    window.onload = init;
}();