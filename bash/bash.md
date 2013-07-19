# bash関連　使い方メモ

lsコマンドの実行結果に色を付ける
(~/.bashrc　に以下の2行を追加)

    alias ls='ls -G'          //lsの実行結果に色を付ける
    export CLICOLOR=1
    export LSCOLORS=DxGxcxdxCxegedabagacad      //青色を薄い青に調整

ターミナル起動時に.bashrcを自動で読み込む
(.bash_profile　に以下の3行を追加)

    if [ -f ~/.bashrc ] ; then
    . ~/.bashrc
    fi

cdコマンドを実行するとlsを自動実行
(~/.bashrc　に以下を追加)

    function autols() {
      \cd $1;
      ls;
    }
    alias cd=autols