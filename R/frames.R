library(here)
library(dplyr)
library(ggplot2)
library(purrr)
library(readr)
library(tictoc)
library(tidyr)

source(here("R", "grid_lines.R"))
source(here("R", "plot_partial_room_square.R"))

# load all partial Room squares in a single data frame.
log_df <- read_rds("~/workspace/maximal-room-squares/log/log_df.rds")

# assuming that the partial room squares have rows indexed 1, ..., n - 1.
n <- max(log_df$row) + 1

# plot frame and write to disk
write_frame <- function(i, X) {
  
  # filter the current partial Room square
  # and add a variable giving the number of
  # available pairs in every cell
  X1 <- X %>%
    filter(t == i) %>%
    pivot_wider() %>%
    mutate(n_Pe = map_dbl(Pe, length))
  
  # plot the current partal Room square
  plot_partial_room_square(X1)

  # save the plot to disk
  ggsave(file = paste0("frames/images/frame", sprintf("%02d", i), ".png"), width = 4, height = 4, bg = "white")
  
}

tic()
map(seq(min(log_df$t), max(log_df$t), 1), write_frame, log_df)
toc()
