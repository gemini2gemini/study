# railsメモ

## railsの自分用のメモ


### railsで必要なもの

* Ruby
* Rails
* RubyGem
* SQLite

### MVCとは

Model: データに関するいろいろ

View: 見た目に関するいろいろ

Controller: MとVをとりもつもの
Modelからのデータの加工する
ビューの入力項目をModelに入れる

### プロジェクトの作成

新しいプロジェクトを作成する場合は、 newコマンドを使用する

    rails new appName

### ファイル構成の確認

* Gemfile: Gemの管理


### rails Serverでの確認

アプリのあるフォルダに移動して、rails serverを使用する

    rails server


### Scaffoldの利用
Webアプリの土台を作成してくれる scaffoldの使用方法

    rails generate scaffold User name:string email:string intro:text


### Scaffoldの中身

Model,View,Controllerの中に、アプリのファイル  
（例：users_controller.rb(controller), users.rb(model),userフォルダ(view))が作成される。

dbフォルダに、データーベースのファイルとmigrationファイルができる。  
migrationファイルは、データーベースを設定するファイル

### 










