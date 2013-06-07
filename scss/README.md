# SCSS/Compassの使い方

## SCSS基本

### 入れ子で構成

    div {
    	width: 200px;
    	p {
    		color: red;
    	}
    }
    =>
    div{width: 200px;}
    div p{color: red;}

### &(親要素を表す)

    a {
    	color : red;
    	&:hover {
    		font-weight: bold;
    	}
    }
    =>
    a {color: red;}
    a:hover {font-weight: bold;}

### 数値を変数に格納

    $baseFontSize: 16px;
    $baseSiteWidth: 800;

    #main {
    	width: $baseSiteWidth + px;
    	font-size: $baseFontSize;
    }
    =>
    #main {width: 800px; font-size:16px;}

### 数値の加算乗除

    #wrap {
    	width: #baseSiteWidth - 200 + px;
    }
    =>
    #wrap {width: 600px;}

### 文字列を変数に格納

    $imgDir: "../img/";
    #main {
    	background: url($imgDir + "bg.png");
    	background: url("#{$imgDir}bg.png"); //#{var} で変数展開も可能
    }
    =>
    #main {background:url("../img/bg.png");}

### 色を変数に格納(sass関数で、明るくしたり暗くすることも可能)

    $brandColor: red;
    #main {
    	color: $brandColor;
    }
    =>
    #main {color: red;}

    #main {
    	color:lighten($brandColor,40%);
    }
    =>
    #main {color: #ffcccc;}

### scss関数

    様々な便利な関数一覧
    http://sass-lang.com/docs/yardoc/Sass/Script/Functions.html

### 条件分岐(@if, @else)

    $debugMode: true;
    #main {
      @if $debugMode == true {
            color: red;
      	} @else {
      		color :green;
      	}
    }
    =>
    #main {color: red;}

### ループ(@for, @while)

    @for $i from 10 through 14 {
      .fs#{$i} { font-size: #{$i}px; }
    }

    $j:10
    @while $j <= 14{
    	.fs#{$j} { font-size: #{$j}px; }
        $j: $j + 1;
    }

    => .fs10{font-size:10px;}
       .fs11{font-size:11px;}
       ...fs14{font-size:14px;}

### リスト（似たようなデータをまとめて管理）

    $animals: cat,dog,tiger;
    @each $animal in $animals {
    	.#{$animal}-icon{ background: url("#{animal}.png");}
    }
    =>
    .cat-icon {background: url("animal.png"); }
    .dog-icon {background: url("animal.png"); }
    .tiger-icon {background: url("animal.png");}

### 関数

    $totalWidth: 940px;
    $columnCount: 10;

	@function getColumnWidth($width, $count) {
	    // $columnWidthを計算
	    $padding: 10px;
	    $columnWidth: floor(($width - ($padding * ($count - 1))) / $count);
	    @debug $columnWidth; //debug関数
	    @return $columnWidth;
	}

	.grid {
	    float: left;
	    width: getColumnWidth($totalWidth, $columnCount);
	}

### Mixin/include

    // mixin
    @mixin round($radius:4px) {
      border-radius: $radius;
    }

    .label {
      font-size: 12px;
      @include round(10px);
    }
    =>
    .label {
      font-size: 12px;
      border-radius: 10px;
    }

### extend

    // @extend (継承)

	// .errorMsg
	// .warningMsg

	.msg {
	    font-size: 12px;
	    font-weight: bold;
	    padding: 2px 4px;
	    color: white;
	}

	.errorMsg {
	    @extend .msg;
	    background: red;
	}

	.warningMsg {
	    @extend .msg;
	    background: orange;
	}

	=>
	.msg, .errorMsg, .warningMsg {
      font-size: 12px;
      font-weight: bold;
      padding: 2px 4px;
      color: white;
    }

    .errorMsg {
      background: red;
    }

    .warningMsg {
      background: orange;
    }



### ファイルを分割して管理（パーシャルの活用）

    _partial.scss　を活用（ _　から始まるファイル）
    使用方法
    @import "partial" //@importする際は、_ も拡張子も必要ない



