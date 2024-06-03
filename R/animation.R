library(here)
library(magick)

imgs <- image_read(list.files(here("plot"), full.names = TRUE))

animation <- image_animate(image_scale(imgs, "600x600"), fps = 4, dispose = "previous")

image_write(animation, "gif/out.gif")
