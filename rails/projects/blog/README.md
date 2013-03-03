## ０からアプリを作る場合(ブログシステム)

このアプリの作り方は、[dotinstall](dotinstall.com)を参考に作成


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
(Model/DB/Controller/URL/Controller内のMethodとView)

* rails g model Post title:string content:text
* rake db:migrate
* rails g controller Posts
* config/routes.rb を編集
* rake routes
* PostsController
    - index 一覧 -> app/views/posts/index.html.erb 　/ を割り当てる
    - create → フォームから送信されたデータを処理　　　　viewはなし
    - new → 新規作成フォーム　app/views/posts/new.html.erb　　　/posts/new
    - edit → 　編集画面  app/views/posts/edit.html.erb  /posts/(id)/edit
    - show → Postの詳細を表示するページ　app/views/posts/show.html.erb 　　posts/(id)
    - update　→　編集画面からの送信を処理
    - destory　→　削除






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
4. なお、publicフォルダに、index.html（上記の場合）があると、優先されるので、  リネームすると良い


##### 記事の詳細を表示する

posts_controller.rb にshowを行うメソッドを追加する

    @post = Post.find(params[:id])
    Postオブジェクトの中から、parameterがidのものを見つけてくる

その後、viewの中に、show.html.erbを作成する。

##### 新しい記事の追加

posts_controller.rb にnewを行うメソッドを追加する

    @post = Post.new
    新しいPostを作成して、変数に投げ込む

その後、viewの中に、new.html.erbを作成する。
new.html.erbの中に、　フォームを作成

    form_for(@post) を作成

##### 送信先のメソッドを作成

    def create
      @post = Post.new(params[:post])
      if @post.save
        redirect_to posts_path
      else
        render action: 'new'
      end
    end
    
    オブジェクトの作成を行うが、フォームに入力された内容は、
    params[:post]で取得することができる。
    保存がうまくいったら、posts_pathにリダイレクトさせる
    うまくいかなかったら、'new'というメソッドを実行し、newのviewを書き出し直す。


##### バリデーションの追加

viewの入力項目に対するバリデーションルールを設定する場合は、  
モデルに記載する。（ここでは、models/post.rb)

    validates :title, :presence => true
    validates : :content, :presence => true,
                          :length => {:minimum => 5}


validateは、 @postが saveされる時に呼ばれるので、  
validateルールに反した場合、render action: 'new'が呼ばれる

##### バリデーションエラーの表示

バリデーションエラーは、@postのerrors にかえってくる。  
なので、

    <% if @post.errors.any? %>
    <ul>
    <% @post.errors.full_messages.each do |msg| %>
    <li><%= msg %></li>
    <% end %>
    </ul>
    <% end %>


##### フラッシュメッセージの表示

リダイレクト時に表示させるフラッシュメッセージの実装方法
redirect_toの後ろにメッセージを追記する  
下記にいれた notice: は変数となる

    posts_controller.rb　の newの部分に、
    redirect_to posts_path, notice: '作成されました'
    を追記

また、メッセージを表示する部分（今回は、index.html.erb)にも

    <div id="notice"><%= notice %></div>

と追加


また、日本語を使う場合（今回は、posts_controller.rb)、ページの先頭に

    # coding: utf-8

を入れておかないと文字化けする

##### 表示順をコントロールする

indexで表示する際に、表示順をコントロールする  
findメソッドで取得した際に、作成日時を降順にすれば、新規作成リストの一番上に表示される

    Post.all(:order => "created_at DESC")

SQLのメソッドに近いオプション


##### 情報の更新(edit,update)

posts_controller.rbにeditとupdateのメソッドを作成

    def edit
        @post = Post.find(params[:id])
    end

viewに、edit.html.erbを新規作成する必要がある
edit.html.erb には、

    render 'form'
    を記載し、同じ階層にある部品テンプレートを取得して使えるようにする
    viewに、 _form.html.erb で作成し、'new'に作成していたフォームの部分を記載する
    その後、'new','edit'の両方に、
    <%= render 'form' %>
    を記載すれば、_form.html.erb を使い回す事ができる

その後、 posts_controller.rbに updateメソッドを記載

    def update
      @post = Post.find(params[:id])
      if @post.update_attributes(params[:post])
        redirect_to posts_path, notice: '更新されました'
      else
        render action: 'edit'
      end
    end


##### 記事の削除(destroy)

特に、viewがあるわけではないので、メソッドを作る。  
post一覧に、削除のリンクを作成する。

    View(index.html.erb)に、Deleteのリンク作成
    <%= link_to 'Delete', post, :confirm => 'Sure', :method => :delete %>

    posts_controller.rbに、destroyメソッドを記載する
    def destroy
      @post = Post.find(params[:id])
      @post.destroy
      redirect_to posts_path, notice: '削除しました！'
    end

##### 記事の削除をAjax化する

    削除リンクをAjaxに対応させる(index.html.erb)
    :remote => true　を追加

    posts_controller.rbのdestroyメソッド内で、redirectをせずに、返り値をjsonで返すようにする
    render json: { post: @post }
    
    jQueryで検出して処理をする
    $('a[data-method="delete"]').on('ajax:success', function(e,data,status,xhr){
      $('#post_' + data.post.id).fadeOut("slow");
    });

    index.html.erb のli要素に、post.idを設定する
    <li id="post_<%= post.id %>">


### Commentオブジェクトの作成

* rails g model Comment commenter:string body:text post:references
* rake db:migrate
* rails g controller Comments
* config/routes.rbの修正
* modelを修正
    - コメントの表示
    - コメントの追加
    - コメントの削除


#### Commentモデルの作成

    rails g model Comment commenter:string body:text post:references
    post:references　と書く事で、postとひも付けるフィールドが自動的に作成される
    rake db:migrate


#### Commentsコントローラの作成

    rails g controller Comments

    config/routes.rbの修正
    resources :posts do
      resources :comments
    end

    modelの修正
    models/post.rb に、comment.rbとの対応関係を記載
    has_many :comments

#### コメントの表示
コメントは記事の下のあたりに入れる事にする
Postのshowにコメントを入れる

    <h2>Comments</h2>
    <ul>
    <% if @post.comments.any? %>
    <% @post.comments.each do |comment| %>
    <li><%= comment.body %>(by <%= comment.commenter %>)</li>
    <% end %>
    <% else %>
    <li>no comment yet</li>
    <% end %>
    </ul>


#### コメント投稿フォームの作成
show.html.erb の中に、投稿フォームを記載する
以下を追加する

    <h2>Add a Comment</h2>
    <%= form_for(@post, @comment) do |f| %>
    <div class="field">
      <%= f.label :commenter %>
      <%= f.text_field :commenter %>
    </div>
    <div class="field">
      <%= f.label :body %>
      <%= f.text_area :body, :rows => 5 %>
    </div>
    <div class="action">
      <%= f.submit %>
    </div>
    <% end %>

コントローラーの中に、オブジェクトを作る

    posts_controller.rbの中に以下記載
    def show
      @post = Post.find(params[:id])
      @comment = Post.find(params[:id]).comments.build
    end

#### コメントを追加するメソッドをコントローラーに追加する
comments_controller.rb に記載

    def create
      @post = Post.find(params[:post_id])
      @comment = Post.find(params[:post_id]).comments.create(params[:comment])
      redirect_to post_path(@post)
    end


#### バリデーションの設定（コメント部分に）

    コメントのモデルにバリデーションを記述
    validates :commenter, :presence => true
    validates :body, :presence => true,
                        :length => {:minimum => 5}

    comments_controller.rbに、コメント入力時の分岐を記述
    if @comment.save
      redirect_to post_path(@post)
    else
      render :template => "posts/show"
    end

    view/show.html.erb　に、エラーの場合のmsg出力部分を記述
    <% if @comment.errors.any? %>
    <ul>
    <% @comment.errors.full_messages.each do |msg| %>
    <li><%= msg %></li>
    <% end %>
    </ul>
    <% end %>




### その他

#### コンソール機能

* rails console
* rails db