# bash関連　使い方メモ

## terminalの色変更

~/.bashrc　に以下の2行を追加  
(lsコマンドの実行結果に色を付ける)

    alias ls='ls -G'          //lsの実行結果に色を付ける
    export CLICOLOR=1
    export LSCOLORS=DxGxcxdxCxegedabagacad      //青色を薄い青に調整

.bash_profile　に以下の3行を追加  
（ターミナル起動時に.bashrcを自動で読み込む指示）

    if [ -f ~/.bashrc ] ; then
    . ~/.bashrc
    fi
