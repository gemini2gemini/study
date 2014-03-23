"use strict";
var drop = function(number1, number2){
        return number1 - number2;
};

/*
//jshintの場合、use strictのエラー回避のために、関数スコープでの宣言が必要
//但し、このように記述すると jasmineで can't find variableなどと変数が見つからないなどの問題が発生する
//(function () {
//"use strict";
//var drop = function(number1, number2){
//return number1 - number2;
//};
//}());
*/