# railbook

## アプリケーション作成の勉強

### railsコマンド
    
アプリケーションの新規作成  

    rails new appName
  

HTTPサーバーの起動  

    rails server [options]
    rails s [options]
    
    options
    -e : 特定の環境(test,development,production)でサーバーを起動(デフォルトはdevelopment)
    -p : 使用するポート番号


コントローラークラスの生成

    rails generate controller name
    rails g controller name

モデルクラスの作成

    rails generate model name field:type
    rails g model name field:type
    name: モデル名 field:フィールド名 type:データ型

データベースクライアントの起動

    rails dbconsole
    rails db

    config/database.yml で定義した接続情報に従い、データベースクライアントの起動が可能となる

クラスとその関係ファイルの削除

    rails destroy model name
    rails destroy controller name
    作成したクラスとその関係ファイルをまとめて削除

Scaffoldの作成

    rails generate scaffold name field:type
    rails g scaffold name field:type

    アプリケーションの動作に必要なコントローラークラスからテンプレートファイル、モデルクラス、マイグレーションファイルまでまとめて生成



### rakeコマンド

マイグレーション

    rake db:migrate
    テーブルレイアウトを作成/変更するためのしくみ
    テーブルの保守の作業を半自動化でき、レイアウト変更が生じた場合も簡単に反映可能

フィクスチャ

    rake db:fixtures:load FIXTURE=fixture_name
    テストデータの読み込み、FIXTURE=読み込むファイル名を記載（拡張子不要）


データベースの削除

    rake db:drop


### SQLiteコマンド

テーブルの確認

    .tables
    データベース内のテーブル一覧を表示

テーブルスキーマの表示

    .schema table_name
    指定するテーブルのスキーマを表示

ツールの終了
    
    .quit
    .exit
    SQLiteクライアントを終了する

### メソッド

renderメソッド：　指定したRHTMLを返す

    render option

    他のアクションのテンプレート表示
    render :action => アクション名

    文字列を直接表示
    render :text => "文字列"

    指定されたテキストを表示し、コンテンツタイプをapplication/xmlに設定
    render :json => モデルor文字列

matchメソッド：　アクセス可能なURLを指定することで、HTMLリクエストを処理

    match(URLパターン [, オプション])
    
    match ":controller(/:action(/:id(.format)))"
    以下と一致
    http://localhost:3000/books
    http://localhost:3000/hello/index
    http://localhost:3000/blog/show/112
    http://localhost:3000/blog/show/112.xml


allメソッド：　テーブルからすべてのレコードを取得

    モデル名.all
    例）
    Book.all
    # SELECT "books".* FROM "books"




### 用語

テンプレート変数（インスタンス変数）

    テンプレートファイルに埋め込むべき値
    アクションメソッドとビューとでのデータ受け渡しに使われる
    railsのテンプレート変数を担うのは、インスタンス変数(@変数名)

    @name = "hoge,fuga,piyo"

レイアウトテンプレート(/views/layouts/application.html.erb)

    Railsではデフォルトで、application.html.erbの「<%= yield %>」に個別のテンプレートを埋め込んだ上で最終的な出力を生成する。
    application.html.erbのことを「レイアウトテンプレート」、あるいは「レイアウト」と呼ぶ。

O/R(Object/Relationnal)マッパー

    リレーショナルデータベースとオブジェクト指向言語との橋渡しを受け持つライブラリ
    例）Active Record
    Railsではリレーショナルデータベース（表形式のデータ）をあたかもオブジェクトであるかのように操作できるようになる

フィクスチャ

    テストデータをデータベースに流し込むしくみ
    フィクスチャとは、YAMLやCSV形式のテキストファイルをデータベースに流し込む




### 規則

テンプレートファイルの命名・作成場所
    
    /app/views/ フォルダ配下に、「コントローラー名/アクション名.html.erb」という名前で作成する  


### Tips

マジックコメントの指定(マルチバイト文字対策)  
以下の一行を、スクリプトファイルの先頭に記載する

    # coding: utf-8

コントローラで処理された内容を埋め込む先を指定する

    <%= yield %>

`html.erb`でのコメント構文

    1.標準的なコメントアウト構文
    <%# コメント %>
    <%#
    hogehoge
    mogemoge
    %>

    2.条件分岐構文を利用したコメントアウト
    <% if false %> .... <% end %>
    <% if false %>
    <% この部分は無視されます %>
    <%= ここも無視されます %>
    <% end %>

    3.ドキュメンテーションコメント用
    beginとendは必ず行頭におかないといけない
    <% =begin %> ..... <% =end %>

    <%
    =begin
    %>
    <% この部分は無視されます %>
    <%= ここも無視されます %>
    <%
    =end
    %>

    4.通常のHTMLコメントアウト
    ブラウザ側で処理されるので、クライアント側から見えてしまう

    <!-- <%= "ブラウザの画面上には表示されない" %> -->

