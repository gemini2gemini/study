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

