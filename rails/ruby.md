# rubyのTipsやバージョン管理など

## rvm コマンド


    rvm list known    //インストールできるRubyのリストを表示する
    rvm list          //rvmでインストールしたRubyのリスト一覧表示
    rvm install ruby-head  //最新版のrubyをインストール
    rvm install ●●●●  //指定のRubyをインストール 例:rvm install 1.9.3-p385
    rvm use ●●●●      //rvmでインストールしたRubyのversionを使用する
    rvm use ●●●● --default //rvmでインストールしたRubyのversionを通常のものとして設定する

    rvm gemset list  //使用しているgemsetのリスト表示
    rvm gemset create ●●●●  //好きなgemsetのリストを作成する　●●●●に好きなリスト名を入れる
    rvm gemset use ●●●●  //好きなgemsetを使用する
    rvm gemset empty  //インストールしたgem を取り除く
    rvm gemset delete ●●●●  //指定したgemset を削除する
    rvm gemset install  ●●●●  //gem install と同じ（gemのinstall)
    rvm gemset name  //現在使っているgemset name
    rvm gemset list_all //rubyのversionを跨いだgemset 一覧
    rvm gemset dir //現在使用しているgemsetのディレクトリパス

## gem コマンド

    gem list  //インストール済みのgemの一覧が表示される（使用しているrubyのバージョンごとに）
    gem install ●●●●  //gem パッケージのinstall 
    gem uninstall ●●●●  //gem パッケージのアンインストール
    gem update ●●●●  //gem パッケージの更新（パッケージ名を付けないとそのrubyに入っている全てのパッケージをupdate）
    gem cleanup ●●●●  //gem パッケージの削除（最新バージョンのみ残す）
    gem which ●●●●  //パッケージのインストール先を確認

## bundle installコマンド

    Gemfileに記述されている内容に基づいて、必要なgemパッケージを「bundle install」でインストールする。
    bundle install実施後、Gemfile.lockというファイルが生成される。
    他の環境で同じアプリケーションの開発を行なう場合は、プログラムファイルに加えてこの「Gemfile」ファイルを配布し、
    「bundle install」を実施することで、指定されたパッケージがインストールされる。

## gem の内容

    例） gem 'rails', 'x.x.x'
    x.x.x                        バージョンを固定
    >= x.x.x                  x.x.x以上のバージョンが必要
    >= x.x.x, < y.y.y     x.x.x以上、y.y.y以下のバージョンが必要
    ~> x.0                    x.1からx.9は良いが、メインのバージョンがあがるとは不可 例えば、3.2は良いが、4.0は不可など

    gem 'rails' // Ruby on Rails
    gem 'sass-rails' // Sass(scss)を利用可能に
    gem 'coffee-rails' // Coffee-scriptを利用可能に
    gem 'uglifier' // javascriptを圧縮
    gem 'jquery-rails' // jQueryを利用可能に
    gem 'haml-rails' // Hamlを利用可能に
    gem 'therubyracer' // JavascriptエンジンのV8をRubyから使用できるようにする
    gem 'libv8' // therubyracerの補助gem therubyracerでV８が使用できない場合に、各環境ごとのV8バイナリファイルを取得する
    gem 'execjs' // RubyスクリプトからJavaScriptコードを実行
    gem 'nokogiri' // XMLを簡単にparse（解析）できるように
    gem 'sqlite3' // Railsでsqliteを利用可能に
    gem 'rspec-rails' // 【テスト用】Rails3系・4系のテストフレームワーク Rspecを利用可能に
    gem 'vcr' // 【テスト用】HTTPのリクエストとレスポンスをYAMLファイルに保存し、外部APIを利用するテストを高速化
    gem 'webmock' // 【テスト用】HTTPリクエスト用のモックアップを作成