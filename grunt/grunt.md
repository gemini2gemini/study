# grunt(グラント)の導入方法

## Node.jsを利用したタスク自動化ツール(gruntjs.com)

## install

node.jsをinstallする

## gruntコマンドをinstall
grunt-cliをinstallする

    sudo npm install -g grunt-cli


## 設定

任意のフォルダを作成する

    mkdir ●●●●

package.jsonの作成

    npm init
    (対話形式で回答していく)

gruntのinstall　及び　package.jsonへの追記

    npm install grunt --save-dev
    (node_modulesフォルダが生成される)
    ( --save-dev を付けることで、package.jsonに記述が追加される)


プラグインの追加 (grunt-contrib)
(インストールしたいプラグインをinstallする)

    npm install grunt-contrib --save-dev
    (すべてのプラグインを追加)

    npm install grunt-contrib-●●　--save-dev
    (プラグインを個別に追加)

※別のプロジェクトでも、毎回node_modulesを作成する必要があり、手間なので、
その場合は、その該当プロジェクトのフォルダに、package.jsonをコピーして、

    npm install

を行うと、package.jsonに記載されているプラグインや依存関係にあるファイルを全てinstallしてくれる。


## Gruntfile.jsの設定方法

準備 -- 定型文の記述

    module.exports = function(grunt) {
      grunt.initConfig({

      });

    };


## 手順

1. package.jsonを作成する(プロジェクトのメタ情報管理ファイル)
    + npm init でひな形を作成
    + 基本的に全てリターンでOK
2. 使用するフォルダにgrunt本体をinstall
    + npm install grunt --save-dev
    + --save-devをつけると、package.jsonの devDepenciesに設定記述が追記される
    + 上記の記述があると、他の人に package.jsonを渡しても npm install だけでdevDepenciesに記述されているモジュールをinstallすることができる
    + grunt本体をinstallすると node_modulesが作成される
3. Gruntfile.js　の作成
    + Gruntfile.js をルートに作成

4. プラグインの探し方
    + gruntjs.com/plugins  に存在する
    + contrib は、公式なplugin

5. grunt-contrib-sass を使う方法 + 準備
    + buildフォルダを作成(cssを入れる場所)
    + srcフォルダを作成(sassを入れる場所)
    + プラグインをinstall （プラグイン一覧にあるプラグインに記述されているコマンドを入力）
    + npm install grunt-contrib-sass --save-dev
    + install後、Gruntfileの修正
    + grunt.loadNpmTasks('grunt-contrib-sass');（プラグイン一覧にある記述を Gruntfileのpluginに記述する）
    + configに、sassの基本項目について記載する
    + tasksに、処理について記載する
6. gruntの実行
    + grunt で実行可能(taskごとに処理を分ける場合は、 grunt ●●とする defaultは省略可能)

7. src,destについて
    +入力ファイル(src)
    +出力ファイル(dest)
    + ファイルの指定方法は、公式サイトのdocument/configuring-tasksに記述あり
    + http://gruntjs.com/configuring-tasks

8. optionsの設定
    + pluginのoptionを有効にする場合は、 pluginのdocumentに従い記述する
    + sassの場合、例えば styleを nested,compact,compressed,expandedと指定できる
    + sass/less などで圧縮をするとコメントが消えるが、 /*!  */と　!を入れると圧縮してもコメントは消えない

9. grunt-contrib-csslintの活用(cssの妥当性を判別するプラグイン)
    +csslint　を install
    + npm install grunt-contrib-csslint --save-dev
    + plugin にcsslintを記述
    + grunt.loadNpmTasks('grunt-contrib-csslint');
    + tasksに　csslintを追記
    + configに、 csslint, target, srcを指定

10. grunt-contrib-cssminの活用(cssの圧縮を行うプラグイン)
    +cssmin　を install
    + npm install grunt-contrib-cssmin --save-dev
    + plugin にcssminを記述
    + grunt.loadNpmTasks('grunt-contrib-cssmin');
    + tasksに　cssminを追記
    + configに、 csslint, target, srcを指定
    + options で様々な活用
    + banner(option) ファイルの先頭にメッセージを挿入
    + grunt.template.today()  日付を挿入

11. grunt-contrib-watchの活用(ファイルの変更監視を行うプラグイン)
    +何らかの変更が加わったら gruntコマンドと同じ処理が走る
    + watch　を install
    + npm install grunt-contrib-watch --save-dev
    + plugin にwatchを記述
    + grunt.loadNpmTasks('grunt-contrib-watch');
    + configに、 watch, files, tasksを指定
    + configの中に、watchしたいtaskを記述する

12. grunt-contrib-connectの活用(簡易的なwebサーバーを立ち上げるプラグイン)
    + connect　を install
    + npm install grunt-contrib-connect --save-dev
    + plugin にconnectを記述
    + grunt.loadNpmTasks('grunt-contrib-connect');
    +　configに options含め、portやhostnameの情報をいれる
    + hostnameに localhostと入れれば　とりあえずlocal確認ができる
    + tasksは、 watchの前に入れる

13. livereload　機能を使う(watchプラグインのopiton)
    + options を追加
    + livereload: true
    + index.htmlに scriptを追加する必要がある
    + <script src="http://  :35729"  portは35729に指定する

