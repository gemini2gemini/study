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


#### PostController のindexメソッドに対応するviewの作成

1. App > Controller >posts_controller.rb
2. indexメソッドを作成。 Post.all を @postsに代入
3. views の postsフォルダ内に、 index.html.erb ファイルを作成
4. index.html.erbファイルに、表示用のhtmlを記載する  
(posts タイトルをリストで表示する用にする)
5. rails server で表示の確認

##### Viewで使える記法

* コントローラー内で定義された @変数はそのまま使える
* <% %>　の中では、Rubyの命令を使える
* <%= %> は、表示させる命令(Escape　される)
* <% #コメント %> コメントも書ける

##### リンクの貼り方

    <%= link_to 'home', '/' %>
    link_to （リンクを生成する命令）
    第一引数　リンクのタイトル
    第二引数　リンクURL  ●●_▲▲_path　でリンク生成 ●は、newとかeditとか、▲はcontrollerで定義した名称
    <%= link_to 'New', new_post_path  //    リンク先： /posts/new
    <%= link_to 'Edit', edit_post_path(post:id) %>   リンク先：　// /posts/id/edit
    <%= link_to 'home', posts_path %>   //   リンク先：　/posts

##### HTMLテンプレートの変更

作成した inde.html.erb　などのファイルは、  
views/layouts/application.html.erb の中の <%= yield %>　に埋め込まれる。


##### アプリケーション全体のCSS変更

/assets/stylesheets/aplication.css に記載すれば、  
アプリケーション全体にCSSを反映することができる。

##### 画像の入れ方

画像は、assets/images/ に入れる。  
画像のリンクの貼り方は、

    <%= image_tag 'logo.png', :size => '200x40' %>
    images_tag  // 画像のリンクを設置する命令 <img src=""　になる
    第一引数     // assets/images においてある画像名を指定
    オプション　　// :size =>  画像サイズを指定

リンクを画像に貼る場合は、

    <%= link_to images_tag('logo.png', :size => '200x40'), '/' %>
    のように、リンクの文字列を imageとして指定する


##### 記事一覧をrootにする

1. ルーティングの設定を行う
2. config/routes.rb から、routeの設定部分のコメントアウトを解除
3.  root :to => welcom#index を変更する (コントローラ名/メソッド名を書く) 
(ここでは、 root :to => posts#index)
4. なお、publicフォルダに、index.html（上記の場合）があると、優先されるので、  リネームする良い



### その他

#### コンソール機能

* rails console
* rails db