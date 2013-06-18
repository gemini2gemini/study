# rubyの標準ライブラリに関して記載

    標準ライブラリの使い方
    require 'ライブラリ名'

    require 'net/http'


    require 'uri'


    require 'open-uri'


    require 'pathname'


    require 'yaml'  //yamlを使用するために必要な読み込み
    ■ 使い方(特定のYAMLファイルを読み込む方法)
    1.yamlファイルを、YAML.load_fileで読み込む
    2.読み込んだファイルの変数名を元に、yamlファイル内のデータを使用する

    変数名 = YAML.load_file("ファイルのパス(絶対パス)")
    hoge = 変数名["hoge"]
    例）yaml_var = YAML.load_file("#{Rails.root}/●●/●●/yamlfile.yaml")
    hoge = yaml_var["hoge"]


    require "strscan"　//「マッチした続きからマッチする」作業にのみ特化したライブラリ
    ■ 使い方
    1.require "strscan"　を宣言する
    2.StringScanner.new(文字列)　で、文字列を変数に格納する
    3.メソッドで処理を行う
      + scan(re) //現在位置で正規表現とマッチを行い、マッチした部分を返して、スキャンポインタをその後ろに進める
      + skip(re) //現在位置で正規表現とマッチを行い、スキャンポインタをその後ろに進める
      + peek(re) //現在位置で正規表現とマッチを行い、マッチした部分を返すが、スキャンポインタは進めない
      + match?(re) //現在位置で正規表現とマッチを行い、マッチしたらtrueを返す。スキャンポインタは進めない
      + unscan //スキャンポインタを直前のマッチを行う位置に戻す
      + pos //現在のスキャンポインタが指している位置のインデックスを返す
      + eos? //現在のスキャンポインタが文字列末尾にあれば　trueを返す
      + matched? //直前のマッチが成功していたら trueを返す

    scanner = StringScanner.new("abc def ghi")
    result =[]
    until scanner.eos?
      result.push scanner.scan(/\w+|\W+/)
    end
    p result　=> ["abc","","def","","ghi"]



