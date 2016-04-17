# Sublime Text2の使い方


### Multi-Cursor

1. Cmd + マウスドラッグ　（ドラッグ選択）
2. Cmd + d / Cmd + U　（個別選択・個別選択解除）
3. Cmd + Ctrl + G  （一気に選択）


### コマンドパレット

1. Cmd + Shift + P


### Goto Anything(ファイルを検索して、そのファイルに飛べる)

1. Cmd + p 
parse:32 ファイル名:ファイル名の行数
funct@hoge ファイル名:関数名


### レイアウト変更/タブの移動

1. Cmd + option + #(1..5) //左右分割
2. Cmd + option + shift + #(2..3) //上下分割
3. ctr + shift + #(レイアウト数)　//タブの移動
4. ctr + #(レイアウト数)　 //フォーカスの移動

### Git Bash のsublコマンドで sublime Text2 を起動する

1. .gitconfig に、 ``git config --global core.editor "'/c/program files/sublime text 2/sublime_text.exe' -w"``  
   で、Git Bashで起動する標準editorを指定する。 シンボリックリンクの場合、エラーが起きるので、ファイルを直接指定
2. subl で起動するように、 aliasを .bashrc　に記述  
   ``alias subl="'/c/program files/sublime text 2/sublime_text.exe'"``
3. Git Bash で、 ``subl``コマンドを打つと sublime textが起動する。  
   カレントディレクトリで、 ``subl hoge.html``　と指定すると、そのファイルが起動する。