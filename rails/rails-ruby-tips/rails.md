# railbookというアプリケーションの作り方

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


ルートのリスト表示

    rake routes
    routes.rbを解析し、現在の有効なルートをリスト表示

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
    render action: アクション名

    文字列を直接表示
    render :text => "文字列"
    render text: "文字列"

    指定されたテキストを表示し、コンテンツタイプをapplication/xmlに設定
    render :json => モデルor文字列
    render json: モデルor文字列

    部分テンプレートを呼び出して表示
    render :partial => "form"
    render "form"
    :partial => の部分は冗長なだけなので省略が可能

    テンプレートを呼び出して表示
    render :template => "コントローラ名/アクション名"
    render :template => "user/show"
    render "user/show"
    :template => の部分は冗長なだけなので省略が可能



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


resourcesメソッド

    resources :リソース名の複数形
    config/routes.rbに resourcesメソッドを記述すると、リソース名を設定できる
    例）　resources :name（複数形)


respond_toメソッド

    クライアントからの要求に応じてフォーマットの変更し、
    異なるテンプレートを呼び出す仕組み

    respond_to do |format|
      formant.出力形式
    end

    respond_to do |format|
      format.html
      format.xml { render xml: @instance }
      format.json { render json: @instance }
    end


link_toメソッド

    リンクを生成するメソッド
    link_to(文字列, パス [, オプション, HTMLオプション])

    <%= link_to "編集", edit_book_path(book) %>
    <%= link_to 'Destroy', book, method: :delete, data: { confirm: 'Are you sure?' } %>

    オブジェクトによるパス表記
    bookは、eachメソッドでテンプレート変数 @booksから取り出された個別の要素：Bookオブジェクトになるため、
    link_toメソッドのリンク先ににモデルオブジェクトが渡された場合、Railsはオブジェクトを一意に表す値　book.id　を取得する。
    book    = book.id  →　/books/:id

    特殊なパス表記(ビューヘルパーによる)
    books_path          →  /books
    book_path(id)       →  /books/:id
    new_book_path       →  /books/new
    edit_book_path(id)  →  /books/:id/edit

    ゆえに、
    例）edit_book_path(book) →　/books/book.id/edit
    となる。

findメソッド

    データベースからデータを検索
    与えられたid値などから値に対応するレコードを検索し、その結果をモデルオブジェクトに返す

    モデル名.find(:id)

    例）
    @book =Book.find(params[:id])


paramsメソッド

    URLから送られてきた値やフォームで入力した値をparams[:パラメータ名]で取得する

    ・リンクによるパラメータの受け渡し
    ・フォームによるパタメータの受け渡し
    ・日本語も自動的にデコード

    params[:パラメータ名]

    例）
    <% link_to "show", book, id: 1 %>
    def show
      id = params[:id] # id = 1
    end


newメソッド

    モデルオブジェクトを生成
    モデル名.new
    モデル名.new([ハッシュ値])

    例）
    Book.new
    Book.new(params[:book])

    params[:book]は、フォームからの入力値（ポストデータ）を取得するという意味。
    この表記で、book[...]で名前付けされたすべての入力値（ハッシュ）を取得している。
    このハッシュを、コンストラクタに渡すことで、それぞれのプロパティに対応する値がセットされたBookオブジェクトが生成される

saveメソッド

    生成したオブジェクトをデータベースに保存
    saveメソッドの実行時に、モデルのバリデートの確認も行っていて、saveができたらtrue,失敗したらfalseを返す

    例）
    @book = Book.new(params[:book])
    @book.save

redirect_toメソッド

    指定されたページへリダイレクトを行う
    redirect_to(リダイレクト先のURL [, :status => ステイタスコード, オプション])

    例）
    redirect_to @book, notice: 'successfully created.'

    @bookは、現在のBookオブジェクトのIDを示すため、登録ID値が5の場合、「/books/5」の画面にリダイレクトされる

    notice:　"文字列"
    noticeオプションは、リダイレクト先に伝えるべきメッセージを表示する。
    リダイレクト先に、 <%= notice %>という記述があると、その部分にメッセージを埋め込む

    alert: "文字列"
    alertオプションは、リダイレクト先に　alertのエラーメッセージを表示する。


update_attributesメソッド

    引数に渡された値でオブジェクトの対応するプロパティを書き換え、その結果をデーターベースに保存する
    update_attributesメソッドは、saveメソッドと同じく、更新のtrue/falseで返す
    利用するには、あらかじめfindメソッドなどで更新対象のオブジェクトを取得しておく必要がある
    メソッドの実行時に、モデルのバリデートの確認も行っている

    @object.update_attributes(attrs)

    例）
    @book = Book.find(params[:id])
    @book.update_attributes(params[:book])  → return true/false


destroyメソッド

    データベースからデータを削除する
    @object.destroy

    例）
    @book = Book.find(params[:id])
    @book.destroy




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

ビューヘルパー

    テンプレートファイルを記述する際に役立つメソッドの総称
    フォーム要素の生成をはじめ、文字列や数値の整形、エンコード処理などビューでよく利用する操作をよりシンプルなコードで記述ができる

部分テンプレート

    おおもとのテンプレート（メインテンプレート）から呼び出される断片的なテンプレート
    部分テンプレートを呼び出しているのは、renderメソッドの役割
    部分テンプレートには、「_名前.html.erb」のように、名前の先頭に「_」が付与される。但し、呼び出すときには、「_」や拡張子の部分は、不要

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


シンボル

    :(コロン)から始まる英数字の文字列をシンボルと呼ぶ
    シンボルは変数名やメソッド名などを表すデータ。

    :name => "Japan", :address => "tokyo"

    シンボルをキーとするハッシュは、Ruby1.9からは、以下のようにも書ける
    name: "Japan", address: "tokyo"

ヘルパーメソッドの ●●_url, ●●_pathの違い

    ●●_url　 :絶対パスを表示
    ●●_path  :相対パスを表示

    [action]_[resource]_path
    [action]_[resource]_url
    というルールでメソッドが生成される





