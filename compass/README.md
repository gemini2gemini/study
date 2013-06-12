# Compass Core

## CSS3

### Background Clip

CSS3のbackground-clipを適用

    @include background-clip([$clip]);
    $clip:
    ・ padding-box //default
    ・ border-box
    ・ content-box

### Background Origin

CSS3のbackground-originを適用

    @include background-origin([$origin]);
    $origin
    ・ content-box //default
    ・ padding-box
    ・ border-box

### Background Size

CSS3のbackground-sizeを適用

    @include background-size([$size]);
    $size
    ・ auto
    ・ contain
    ・ cover
    ・ ●px ●px　//幅、高さ
    ・ ●% ●%　//幅、高さ

### Border Radius

CSS3のborder-radiusを適用

    @include border-raidus($radius, $vertical-radius);
    $radius, $vertical-radius
    ・ default = 5px
    ・ ●px  //4箇所全て
    ・ ●px ●px //左上 = 右下、右上 = 左下
    ・ ●px ●px ●px //左上、右上 = 左下、右下
    ・ ●px ●px ●px ●px //左上、右上、右下、左下
    ・ ●px, ●px //水平と垂直の数値を変える場合（水平を記入後、カンマ区切りで垂直を記入）