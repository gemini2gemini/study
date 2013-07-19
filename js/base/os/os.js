function updateMenu() {
    'use strict';

    // メニューへの参照を取得
    var os = document.getElementById('os');
    var os2 = document.getElementById('os2');

    // オプションを保持する変数
    var options = null;

    // ２つめのメニューを空にする
    while (os2.firstChild) {
        os2.removeChild(os2.firstChild);
    }

    // オプションを決定
    if (os.value == 'Windows') {
        options = ['7 Home Basic', '7 Home Premium', '7 Professional', '7 Ultimate', 'Vista', 'XP'];
    } else if (os.value == 'Mac OS X') {
        options = ['10.7 Lion', '10.6 Snow Leopard', '10.5 Leopard', '10.4 Tiger'];
    }

    // メニューを更新
    if (options) {
        os2.disabled = false;

        // オプションをメニューに追加
        for (var i = 0, count = options.length; i < count; i++) {
            var opt = document.createElement('option');
            opt.text = opt.value = options[i];
            os2.appendChild(opt);
        }

    } else { // 選択されていない場合
        os2.disabled = true;
    }

} // updateMenu()関数の終わり

// ウィンドウのロード時の機能性を確立する
window.onload = function() {
    'use strict';

    // 選択メニューを取得
    var os = document.getElementById('os');

    // 既存のオプションをなくす
    while (os.firstChild) {
        os.removeChild(os.firstChild);
    }

    // 新しいオプションを追加
    var options = ['選択', 'Windows', 'Mac OS X'];
    for (var i = 0, count = options.length; i < count; i++) {
        var opt = document.createElement('option');
        opt.text = opt.value = options[i];
        os.appendChild(opt);
    }

    // イベントハンドラを追加
    os.onchange = updateMenu;

    // 選択メニューをもう１つ追加
    var os2 = document.createElement('select');
    os2.id = 'os2';
    os2.disabled = true;
    os.parentNode.appendChild(os2);

};



