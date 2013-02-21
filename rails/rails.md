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

### migrateファイルを使用してデータベースの更新

    rake db:migrate

### 有効なURLの確認方法
現在、有効なURLを一覧で確認できる

    rake routes



## ０からアプリを作る場合(ブログシステム)

1. プロジェクトを作る(rails new)
2. Postオブジェクトの作成(Model/DB/Controller/URL/View)
3. Commentオブジェクトの作成(Model/DB/Controller/URL/View)

### プロジェクトを作る
1. rails new blog --skip-bundle //バンドルインストールをスキップ
2. Gemfile修正　：javascriptRuntimeの導入  
therubyracerの利用　//therubyracerのコメント解除
3. dbの初期化       //rake db:create
4. serverの立ち上げ //rails server

### Postオブジェクトの作成

#### Modelを作って、DBに反映させる
1. Modelを作る　// rails g model Post title:string content:text  
（モデルの名称は、頭文字大文字で、単数形にする）
2. dbに反映  //rake db:migrate

#### Controllerを作って、

1. Controllerを作る   // rails g controller Posts  
(コントローラーの名称は、頭文字大文字で、複数形にする)
2. controllerとViewのためのフォルダが作成される

#### アプリにアクセスする際のルーティング(URL)を設定

1. config/routes.rbを編集する // resources :posts
2. rake routes　でURL一覧を確認





### その他

#### コンソール機能

* rails console
* rails db



