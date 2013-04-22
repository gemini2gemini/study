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
    gem uninstall ●●●●  //gem パッケージのアンインストール
    gem update ●●●●  //gem パッケージの更新（パッケージ名を付けないとそのrubyに入っている全てのパッケージをupdate）
    gem cleanup ●●●●  //gem パッケージの削除（最新バージョンのみ残す）
    gem which ●●●●  //パッケージのインストール先を確認

## bundle installコマンド

    Gemfileに記述されている内容に基づいて、必要なgemパッケージを「bundle install」でインストールする。
    bundle install実施後、Gemfile.lockというファイルが生成される。
    他の環境で同じアプリケーションの開発を行なう場合は、プログラムファイルに加えてこの「Gemfile.lock」ファイルを配布し、
    「bundle install」を実施することで、指定されたパッケージがインストールされる。


