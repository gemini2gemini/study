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

## gem コマンド

    gem list  //インストール済みのgemの一覧が表示される（使用しているrubyのバージョンごとに）
    gem uninstall ●●●●  //gem パッケージのアンインストール
    gem update ●●●●  //gem パッケージの更新
    gem cleanup ●●●●  //gem パッケージの削除（最新バージョンのみ残す）
    gem which ●●●●  //パッケージのインストール先を確認

