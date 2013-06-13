# CSS3に関して

## Backgrounds and Borders

### background-clips

背景の適用範囲を指定

    ■ 背景が表示されるエリアを変更できる
    background-clip:border-box;　//背景をボーダーボックスまで適用（初期値）
    background-clip:padding-box;　//背景をパティングボックスまで適用
    background-clip:content-box;　//背景をコンテントボックスに適用
    ※ background-originやbackground-repeatなどとの組み合わせで、様々な表示ができる

### background-origin

背景の基準開始位置を指定

    ■ 背景の開始基準開始位置を指定できる
    background-origin:padding-box;　//背景をパディングボックスに対して相対的に適用する（初期値）
    background-origin:border-box;　//背景をボーダーボックスに対して相対的に適用する
    background-origin:content-box;　//背景をコンテントボックスに対して相対的に適用する
    ※ background-clip を指定していない場合は、background-origin の値が何であれ、border-box の範囲に画像が表示される

### background-size

背景画像のサイズを指定

    ■ 背景画像のサイズを指定できる
    background-size:auto;　//自動的に算出（初期値）
    background-size:contain;　//縦横比を保持、背景領域に収まる最大サイズになるように調整
    background-size:cover;　//縦横比を保持、背景領域を完全に覆う最大サイズになるように調整
    background-size:●px（幅） ●px（高さ）;　//長さ：背景画像の幅・高さ指定
    background-size://パーセンテージ：背景領域に対する背景画像の幅・高さのパーセンテージ指定

### border-radius

角丸を指定する

    ■ ボックスの４つの角の角丸を指定できる
    border-radius: ●px;　//４つの角全て同じサイズの角丸
    border-radius: ●●px / ●●px ▼▼px ■■px ▲▲px;//４つの角の水平方向が同じ数値。//右上省略(右上は、左上と同じ数値に)
    border-radius: ●●px ▼▼px;//左上と右下同じ数値。右上と左下同じ数値。//右下省略（右下は、左上と同じ数値に）
    border-radius: ●●px ▼▼px ■■px;//左下省略（左下は、右上と同じ数値に）
    border-radius: ●●px ▼▼px ■■px ▲▲px / ■■px ●●px ▲▲px ▼▼px;//４つの角全て水平方向・垂直方向のサイズが異なる角丸
    水平方向　左上・右上・右下・左下 / 垂直方向 左上・右上・右下・左下　で指定

















