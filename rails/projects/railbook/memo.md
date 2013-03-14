# railbook

## アプリケーション作成の勉強

### railsコマンド
    
アプリケーションの新規作成  

    rails new appName
  

HTTPサーバーの起動  

    rails server
    rails s

コントローラークラスの生成

    rails generate controller name
    rails g controller name



### メソッド

指定したRHTMLを返す

    render option

    他のアクションのテンプレート表示
    render :action => アクション名

    文字列を直接表示
    render :text => "文字列"

    指定されたテキストを表示し、コンテンツタイプをapplication/xmlに設定
    render :json => モデルor文字列


### Tips

マジックコメントの指定(マルチバイト文字対策)  
以下の一行を、スクリプトファイルの先頭に記載する

    # coding: utf-8

