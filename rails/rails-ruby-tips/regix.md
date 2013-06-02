#　正規表現メモ(ruby,rails)

### 正規表現
    
    ■文章中の改行を、削除する
    str.gsub(/(\r\n|\r|\n)+/, '')

    ■文章中の空白を、削除する
    str.gsub(/(\s|　)+/, '')

    ■文章中にあるHTMLのタグを削除する
    str.gsub(/<\/?[^>]*>/, '')

    ■文章中(article)に、ある文字（str）があれば　trueを返す
    %r!str! =~ article

    ■画像名が一致するかどうか？（画像名のpattern)
    /[\-_\.\!\~\'\(\)a-zA-Z0-9\;@&=\$\,\%\#]+\.[jpg|jpeg|gif|png|bmp]+/i

    