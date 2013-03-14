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


### Tips

マジックコメントの指定(マルチバイト文字対策)  
以下の一行を、スクリプトファイルの先頭に記載する

    # coding: utf-8

