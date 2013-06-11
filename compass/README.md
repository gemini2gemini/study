# Compass Core

## CSS3

### Background Clip

CSS3のbackground-clipを適用(CSS3では、border-boxがdefault)

    @include background-clip([$clip]);
    $clip:
    ・ padding-box //default
    ・ border-box
    ・ content-box

### Background Origin

CSS3のbackground-originを適用(CSS3では、padding-boxがdefault)

    @include background-origin([$origin]);
    $origin
    ・ content-box //default
    ・ padding-box
    ・ border-box



