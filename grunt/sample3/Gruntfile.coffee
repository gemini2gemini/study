'use strict'

module.exports = (grunt) ->
  pkg = grunt.file.readJSON 'package.json' # パッケージファイルの読み込み

  #------------------------------------------------------------
  # 処理の設定
  #------------------------------------------------------------
  grunt.initConfig
    dir: # ディレクトリ設定
      dev: "dev" # devフォルダ置き換え
      views: "views" # viewsフォルダ置き換え

    clean: # 不要なファイルを削除する
      deleteDist: # viewsフォルダ内を一度全て削除する
        src: ["<%= dir.views %>"]
      deleteSprites: # スプライト画像生成フォルダ（img/*）iconsやarrowsを全て削除する
        src: "<%= dir.views %>/img/*/"
      deleteStyleGuide: # styleguideが更新されないバグ解消のため、一度削除する
        src: "<%= styleguide.styledocco.dest %>"

    concat: # ファイル結合
      cssset: # css結合
        # 結合するファイルリスト
        src:"<%= dir.dev %>/css/**/*.css"
        dest: "<%= dir.views %>/css/style.css" # 結合後のファイル格納
        #<%= concat.cssset.dest %>上記destと同じ:同じファイルが続くので置き換える

      jsdefault: # jsのライブラリ等の結合
        # 結合するファイルリスト
        src: ["<%= dir.dev %>/js/lib/*.js","<%= dir.dev %>/js/script/*.js"]
        dest: "<%= dir.views %>/js/script.js" # 結合後のファイル格納
        #<%= concat.jsdefault.dest %>上記destと同じ:同じファイルが続くので置き換える

      license: # jsのライセンス表示のための結合 #リリース時のみこの処理を行う
        # 結合するファイルリスト
        src: ["<%= dir.dev %>/js/license/license.js","<%= concat.jsdefault.dest %>"]
        dest: "<%= concat.jsdefault.dest %>" # 結合後のファイル格納

    #------------------------------------------------------------
    # html関連の処理
    #------------------------------------------------------------

    htmllint:
      default: ["<%= dir.dev %>/**/*.html"]

    htmlmin:
      default:
        options:
          collapseWhitespace: true
        expand: true
        cwd: '<%= dir.dev %>'
        src: ['**/*.html']
        dest: '<%= dir.views %>'

    #------------------------------------------------------------
    # CSS関連の処理(順番整理・ベンダープレフィクス付与・圧縮・最適化)
    #------------------------------------------------------------

    # cssの重複個所を指摘してくれる(自動処理は行われない)
    csscss:
      default:
        src: "<%= concat.cssset.dest %>"

    csscomb: # CSSのプロパティの順番整理 gzip時の圧縮率が高くなる
      default:
        src: "<%= concat.cssset.dest %>"
        dest: "<%= concat.cssset.dest %>"

    autoprefixer: # ベンダープレフィックス付与設定
      options:
        browsers: [ "last 2 version","ie >= 8" ] # 対象ブラウザの設定
      default:
        src: "<%= concat.cssset.dest %>" # 読み込みファイル
        dest: "<%= concat.cssset.dest %>" # 書き出しファイル

    csslint: # CSSの文法チェック
      default:
        src: "<%= concat.cssset.dest %>"

    csso: # CSSの圧縮＆オプティマイズ
      default:
        src: "<%= concat.cssset.dest %>"
        dest: "<%= concat.cssset.dest %>"

    styleguide:
      styledocco:
        options:
          name: 'Project Name'
          framework:
            name: 'styledocco'
            options:
              preprocessor: 'sass'
          # template:
          #   include:
          #     ["something.js","something.css"]#任意のJS,CSSを読み込ませることが可能
        src: "<%= dir.dev %>/sass/**/*.sass"
        dest: "docs/styleguide/"


    #------------------------------------------------------------
    # js関連の処理(文法チェック・結合・圧縮)
    #------------------------------------------------------------
    jshint: # js文法チェック
      options:
        jshintrc: "<%= dir.dev %>/js/script/.jshintrc" # 定義ファイルの指定
      src:
        src: "<%= dir.dev %>/js/script/*.js" # チェックの対象ファイル

    jasmine:
      case:
        src: '<%= dir.dev %>/js/script/*.js'#複数に記述があっても問題なし
        options:
          specs: '<%= dir.dev %>/js/spec/*Spec.js'#caseも複数に分かれていても問題なし
          # helpers: '<%= dir.dev %>/js/spec/*Helper.js'

    uglify: # jsの結合と圧縮
      default:
        src: ["<%= concat.jsdefault.dest %>"]
        dest: "<%= concat.jsdefault.dest %>"

    yuidoc:
      create:
        name: 'プロジェクト名'
        description: "プロジェクトの概要"
        version: 'バージョン指定'
        options:
          paths: "<%= dir.dev %>/js/script/"
          outdir: "./docs/yuidocs/"

    #------------------------------------------------------------
    # コピー処理
    #------------------------------------------------------------
    copy: # ファイルのコピー
      img: #画像ファイルのコピー 通常のimg + compassで生成されるspritesの両方をコピー
        expand: true
        cwd: "<%= dir.dev %>/"
        src: "img/**"
        dest: "<%= dir.views %>/"
      htaccess:
        expand: true
        cwd: "<%= dir.dev %>/"
        src: ".htaccess"
        dest: "<%= dir.views %>/"

    #------------------------------------------------------------
    # 画像関連の処理
    #------------------------------------------------------------
    imagemin:
      default:
        expand: true
        cwd: "<%= dir.dev %>/**/"
        src: "*.{png,gif,jpeg,jpg}"
        dest: "<%= dir.dev %>"

    #------------------------------------------------------------
    # gzip
    #------------------------------------------------------------

    compress:
      css:
        options:
          mode: "gzip"
        expand: true
        src: "<%= dir.views %>/css/*.css"
        ext: ".css.gz"
      js:
        options:
          mode: "gzip"
        expand: true
        src: "<%= dir.views %>/js/*.js"
        ext: ".js.gz"
      html:
        options:
          mode: "gzip"
        expand: true
        src: "<%= dir.views %>/**/*.html"
        ext: ".html.gz"

    #------------------------------------------------------------
    # その他の処理
    #------------------------------------------------------------
    connect: # 簡易サーバー
      uses_defaults: {} # デフォルト（http://localhost:8000）を利用する

    open:
      default:
        path: "http://localhost:8000/views/"
        # path: "http://192.168.33.10/views/" //vagrant
        app: "Google Chrome"

    watch: # ファイル更新監視
      options: # ライブリロードを有効にする
        livereload: true
        spawn: false

      cssdev: # compass watchで変更されたcssの監視
        files: "<%= dir.dev %>/**/*.css" # 対象ファイル
        tasks: ["clean:deleteStyleGuide","styleguide", "concat:cssset", "csscss", "csslint", "copy:img" ] # 実行タスク（css開発用）

      jsdev: # jsの監視
        files: "<%= dir.dev %>/**/*.js" # 対象ファイル
        tasks: ["jshint", "jasmine", "concat:jsdefault"] # 実行タスク（js開発用）

      htmldev: # htmlの監視
        files: "<%= dir.dev %>/**/*.html" # 対象ファイル
        tasks: ["htmllint" ,"htmlmin"] # 実行タスク（html開発用）

  #------------------------------------------------------------
  # pluginの読み込み
  #------------------------------------------------------------
  # jit-gruntでTaskごとの最小読み込み：TaskのスピードUP

  #------------------------------------------------------------
  # taskの設定
  #------------------------------------------------------------

  grunt.registerTask "default", [], ->
    require("jit-grunt") grunt,
      htmllint: "grunt-html"
    grunt.loadNpmTasks "grunt-contrib-jasmine"#jit-gruntでjasmineのloadを期待するとloopエラーになるため、直接読み込み
    grunt.task.run "connect", "open", "watch"
    return
    #   #cssの監視・imgのコピー / concat:cssset,csscss,csslint,copy:img
    #   #jsの監視 / jsが修正されたら、lint:checkして、統合して distにcopy
    #   #htmlの監視 / htmlが修正されたら、htmllint,minifyして、distにcopy


  # 最初とリリース時
  grunt.registerTask "release", [], ->
    require("jit-grunt") grunt
    grunt.task.run "clean:deleteDist", "htmlmin", "compress:html", "concat:cssset", "csscss", "csscomb", "autoprefixer", "csso", "compress:css", "concat:jsdefault", "uglify", "concat:license", "compress:js", "imagemin", "copy:img", "copy:htaccess", "clean:deleteSprites"
    return
    # "clean:deleteDist"#views内のcss,js,imgを一度削除
    # "htmlmin"#grunt-contrib-htmlmin#htmlを圧縮
    # "concat:cssset"#cssファイルを結合
    # "csscss"#cssの重複指摘
    # "csscomb"#cssのプロパティ順番整理
    # "autoprefixer"#cssに設定に応じたprefixを付与
    # "csso"#cssの圧縮・最適化・構造変化
    # "concat:jsdefault"#jsのlibと自己記載jsの結合
    # "uglify"#jsの結合と圧縮
    # "concat:license"#上記jsにlicense部分結合
    # # "imagemin"#imgの圧縮
    # "copy:img"#ファイルをコピー(現状はimgのみコピー)
    # "clean:deleteSprites"#copy:imgでcopyされたspritesフォルダを削除(viewsでは不要なため)



  # lint-check //開発中に実行
  grunt.registerTask "check", [], ->
    require("jit-grunt") grunt,
      htmllint: "grunt-html"
    grunt.task.run "htmllint", "concat:cssset", "csscss", "csslint", "jshint"
    return
    #   "htmllint"# htmlのlint #grunt-html
    #   "concat:cssset"
    #   "csscss"#cssの重複指摘
    #   "csslint"# cssのlint #grunt-contrib-csslint
    #   # jsのlint #grunt-jshint

  # css prefix付与・順番整理・重複削除 //開発中に実施
  grunt.registerTask "css", [], ->
    require("jit-grunt") grunt
    grunt.task.run "concat:cssset", "csscss", "csscomb", "autoprefixer"
    return
    #   "concat:cssset"
    #   "csscss" #grunt-csscss
    #   "csscomb" #grunt-csscomb
    #   "autoprefixer" #grunt-autoprefixer

  # minify //既にcompileされたhtml,css,js,imgを処理
  grunt.registerTask "minify", [], ->
    require("jit-grunt") grunt
    grunt.task.run "htmlmin", "csso", "uglify"
    return
    #   "htmlmin"# htmlのminify
    #   "csso"#cssの圧縮・最適化
    #   "uglify"#jsの結合と圧縮
    #   # "imagemin"# imgのminify

  #Jasmine専用 #jshintとぶつかるため、単独で実施
  grunt.registerTask "jasmine", [], ->
    grunt.loadNpmTasks "grunt-contrib-jasmine"#jit-gruntでjasmineのloadを期待するとloopエラーになるため、直接読み込み
    grunt.task.run "jasmine"
    return

  # YUI Document生成用 #jshintとぶつかるため、単独で実施
  grunt.registerTask "yui", [], ->
    require("jit-grunt") grunt
    grunt.task.run "yuidoc"
    return

