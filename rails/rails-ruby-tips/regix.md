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

    ■ scanメソッド内でグルーピングを行う
    scanメソッドは、正規表現内に()があると動作が変わるため、グルーピングをしたい場合は、
    「()」ではなく「(?:)」を使う

    p "abc aBC abc".scan(/a(bc|BC)/) => [["bc"],["BC"],["bc"]]
    p "abc aBC abc".scan(/a(?:bc|BC)/) => ["abc","aBC","abc"]

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

    ■ マッチした部分の前後の文字列を取り出す

    m = /永遠の/.match("ここが永遠の国のはず")
    p m.pre_match => "ここが"
    p m.post_match => "の国のはず"
    p $` => "ここが"  //$とバッククオート
    p $' => "の国のはず" //$とクオート

    ■ 空白にマッチ
    「\s」は、以下の空白類文字にマッチする
    「 」(半角空白文字)、「\t」(タブ文字)、「\n」(改行文字)、「\r」(復帰文字)、「\f」(改頁文字)

    全角の空白は、「　」と全角空白を入れてマッチさせる
    /[\s　]/　で、全半角の空白及び、それに類する空白にマッチする

    ■ 文字列が空行か調べる
    /^$/　= 始まりと終わりに何もない（狭義の空行）
    /\A\s*\z/ = 空白が入っている行（広義の空行）

    ■ 空白類文字を区切りにして分ける
    空白類文字を単語の区切りとして分割する場合は、split(nil)を使用する
    p "   hoge\thoge\n2334".split(nil) => ["hoge","hoge","2334"]

    str.split(nil) == str.strip.split(/\s+/)

    ■ 正規表現で文字列を分割(split)
    "2010,20,10,12".split(/,/)  => ["2010","20","10","12"]

    ■ 正規表現にマッチした部分を置換する
    "hogeHOGEhoge".sub(/hoge/, "moge") =>"mogeHOGEhoge" //マッチした最初の文字だけ置換
    "hogeHOGEhoge".gsub(/hoge/, "moge") =>"mogeHOGEmoge" //マッチした全ての文字を置換

    ■ 特定の文字（正規表現ではない）にマッチした部分を置換する
    "-vr.mo.1.2".tr(".", "_") => "-vr_mo_1_2"

    ■ 特定の文字を取り除く
    "fffffff002233".delete("f") => "002233"

    ■ 連続する文字を一文字に纏める
    "ffff00002222".squeeze("f") => "f00002222"

    ■ 末尾の一文字を除去
    "aaaz".chop => "aaa"

    ■ 末尾の改行(\n,\r\n, \r)だけ除去
    "aaa\r\n".chomp => "aaa"
    但し、改行は除去するが、半角空白文字やタブは残したいという要望はほとんどないため、
    sub(/\s+\z/, "") などを使う方が望ましい

    ■ 文字列先頭・末尾の空白文字を取り除く
    "\nabcd\n".strip => "abcd" //先頭・末尾から空白除去
    "\nabcd\n".lstrip => "abcd\n" //先頭から空白除去
    "\nabcd\n".rstrip => "\nabcd" //末尾から空白除去

    ■文章中の改行を、削除する
    str.gsub(/(\r\n|\r|\n)+/, '')

    ■文章中の空白を、削除する
    str.gsub(/(\s|　)+/, '')

    ■文章中にあるHTMLのタグを削除する
    str.gsub(/<\/?[^>]*>/, '')

    ■画像名が一致するかどうか？（画像名のpattern)
    /[\-_\.\!\~\'\(\)a-zA-Z0-9\;@&=\$\,\%\#]+\.[jpg|jpeg|gif|png|bmp]+/i

