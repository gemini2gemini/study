#　正規表現メモ(ruby,rails)

### 正規表現

    ■文字列先頭、文字列末尾、行頭、行末、文字列中の最後の行末
    \A  ・・・ 文字列先頭
    \z　・・・ 文字列末尾
    ^　　・・・ 行頭
    $　　・・・ 行末
    \Z　・・・ 文字列中の最後の行末
    例）
    p(/\Aa/ =~ "aiueo")　=> 0
    p(/o\z/ =~  "aiueo")　=> 4
    p "abc\ndef\n\nghi\n".slice(/..$/m)　=> bc
    p "abc\ndef\n\nghi\n".slice(/..\Z/m)　=> hi
    p "abc\ndef\n\nghi\n".slice(/..\z/m)　=> i\n

    ■ 単語境界線を意味する正規表現 \b
    p /\bhoge\b/ =~ "Moge hoge"　=> 5
    p /\bhoge\b/ =~ "Mogehoge"　=> nil

    ■ \nにマッチしない「.」を\nにもマッチさせる(m オプション)
    p (/./ =~ "\n") => nil
    p (/./m =~ "\n") => 0


    ■文章中(article)に、ある文字（str）があれば　その位置を返す(なければnil)
    %r!str! =~ article => 1とか2とか　先頭だと 0を返す（if文は0でもtrue)
    /str/ =~ article

    ■ パターンが最初に出現する位置情報
    str = "xxxabcxxabcxxabc"
    p str.index(/abc/) => 3

    ■ パターンが最後に出現する位置情報
    str = "xxxabcxxabcxxabc"
    p str.rindex(/abc/) => 13

    ■ 文字列中のすべての候補にマッチし、配列として返す
    str = "aixxaiuxxaiuxxaiueoxx"
    n = str.scan(/iu/)  => ["iu","iu","iu"]

    str.scan(/iu/) do |s|
      p s
    end

    ■ パターンを含む配列のみ選択処理
    str = ["ai","a","uau","e","ua"]
    str.grep(/a/) do |line|
      p line
    end

    ■ マッチした部分を抜き出す(slice) & マッチした部分より後ろの文字列を取得する($')
    str = "abc def ghi"
    p str.slice(/\w+/) => "abc"
    str2 = $'
    p str2　=> " def ghi"
    p str2.slice(/\w+/)　=> "def"

    ■文章中の改行を、削除する
    str.gsub(/(\r\n|\r|\n)+/, '')

    ■文章中の空白を、削除する
    str.gsub(/(\s|　)+/, '')

    ■文章中にあるHTMLのタグを削除する
    str.gsub(/<\/?[^>]*>/, '')

    ■画像名が一致するかどうか？（画像名のpattern)
    /[\-_\.\!\~\'\(\)a-zA-Z0-9\;@&=\$\,\%\#]+\.[jpg|jpeg|gif|png|bmp]+/i

