library(magick)
library(tictoc)

tic()
sizes <- seq(0, 75, 1)

imgs <- image_read(paste0("frames/frame", sizes, ".png"))

animation <- image_animate(image_scale(imgs, "600x600"), fps = 4, dispose = "previous")

image_write(animation, "animation.gif")
toc()
