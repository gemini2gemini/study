# gruntの導入方法

## install

node.jsをinstallする

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

