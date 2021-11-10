
<!-- README.md is generated from README.Rmd. Please edit that file -->

# room-squares-animation

<!-- badges: start -->
<!-- badges: end -->

The goal of room-squares-animation is to animate sequences of partial
Room squares.

The script `frames/frames.R` reads a data frame of partial Room squares
and outputs one PNG image per partial Room square in the folder
`frames/images`

The script `animate.sh` combines all images in `frames/images` into one
GIF using the `convert` program from Imagemagick.

In princple, the script `animation.R` should do the same but it seems
that the `magick` R package uses more resources than are available to my
laptop to do so.

![](out.gif)
