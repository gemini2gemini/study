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


    
