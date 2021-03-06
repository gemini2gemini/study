# rubyの標準メソッドの使い方や書き方のこつなど

### 変数

    lvar // ローカル変数
    @ivar // インスタンス変数
    @@cvar // クラス変数
    $gvar // グローバル変数
    Const // 定数

### 多重代入

    // 変数にまとめて代入を行う（多重代入）
    a,b,c = 1,2,3

    // 配列やオブジェクトが格納された変数に、*をつけることで、代入時に値が展開されて渡される（変数展開）
    s = [3,4]
    a,b,c,d = 1,2, *s
    p c  // => 3
    p d  // => 4

    // 変数に、* をつけることで、複数の値をまとめて配列として受け取れる #変数名が変わる訳ではない
    *a,b = 1,2,3
    p a // => [1,2]
    p b // => 3

### ヒアドキュメント

    長いテキストなどを纏めて記載するのみ便利。ヒアドキュメント内で変数展開を行うこともできる
    ■ 使い方
    1. <<-文字記号　文字記号　で囲む。
    <<の後ろに、-があると、インデントをしても良い。無い場合は、インデントをするとエラーになる
    2. 文字記号は、文章中にない文字にする
    3. ヒアドキュメント内でも変数展開が可能。変数は、#{}で囲む

    変数名 = <<-EOS
      ここに文章を入れる。
      変数を展開するときは、#{変数名}　で使用ができる。
      EOSの部分はどんな単語でも良いが、ヒアドキュメント内に同じ文言があると
      ヒアドキュメントがうまく動作しないため、入らないであろう文言にする
      短く、ないであろう文言が望ましいか・・・
    EOS

### gub,gsub!

    文字列の中で正規表現のパターンにマッチした部分をすべて指定の文字列に置換
    ■ gsub
    str.gsub(pattern, replacement)
    戻り値は、置換された文字列。置換するものが無い場合も置換予定の文字列が返る

    ■ gsub!
    str!(pattern, replacement)
    戻り値は、置換された文字列。置換するものが無い場合は、nilが返る


