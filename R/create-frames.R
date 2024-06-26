library(here)
library(dplyr)
library(ggplot2)
library(purrr)
library(tidyr)
library(wallis)

source(here("R", "add-Pe.R"))
source(here("R", "see2.R"))

R <- tribble(~row, ~col, ~first, ~second,
             1,  1,      1,       1,
             1,  2,      2,       3,
             1,  3,      4,       5,
             1,  4,      6,       7,
             1,  5,      8,       9,
             1,  6,     10,      11,
             1,  7,     12,      13,
             2,  1,      2,       4,
             2,  2,      0,       5,
             2,  3,      1,       3,
             2,  4,      8,      10,
             2,  5,      6,      11,
             2,  6,      7,       9,
             3,  1,      3,       5,
             3,  2,      1,       4,
             3,  3,      0,       2,
             3,  4,      9,      11,
             3,  5,      7,      10,
             3,  6,      6,       8,
             4,  1,      6,       9,
             4,  2,      7,       8,
             4,  3,     10,      12,
             4,  4,      0,       3,
             4,  5,      1,       2,
             4,  6,      4,      13,
             4,  7,      5,      11,
             5,  1,      7,      11,
             5,  2,      6,      10,
             5,  3,      8,      13,
             5,  4,      1,       5,
             5,  5,      0,       4,
             5,  6,      2,      12,
             5,  7,      3,       9,
             6,  1,      8,      12,
             6,  2,      9,      13,
             6,  7,      0,       6,
             6,  8,      1,       7,
             6,  9,      2,       5,
             6, 10,      3,       4,
             7,  1,     10,      13,
             7,  2,     11,      12,
             7,  7,      1,       8,
             7,  8,      0,       9,
             7,  9,      3,       6,
             7, 10,      2,       7,
             8,  4,      2,      13,
             8,  5,      3,      12,
             8,  7,      4,       7,
             8,  8,      5,       6,
             8,  9,      0,       8,
             8, 10,      1,       9,
             9,  4,      4,      12,
             9,  5,      5,      13,
             9,  7,      2,      10,
             9,  8,      3,       8,
             9,  9,      1,      11,
             9, 11,      0,       7,
             10,  8,      2,      11,
             10,  9,      4,       9,
             10, 10,      0,      10,
             10, 11,      1,       6,
             10, 12,      3,       7,
             10, 13,      5,       8,
             11,  8,      4,      10,
             11,  9,      7,      12,
             11, 10,      6,      13,
             11, 11,      2,       8,
             11, 12,      0,      11,
             12, 10,      5,      12,
             12, 11,      3,      10,
             12, 12,      1,      13,
             12, 13,      2,       6,
             13, 10,      8,      11,
             13, 11,      5,       9,
             13, 12,      4,       6
)


n <- 14

for(i in 1:nrow(R)) {
  
  # filter the current partial Room square
  # and add a variable giving the number of
  # available pairs in every cell
  RR <- head(R, i) |>
    add_Pe(n) |>
    mutate(fill = 0)
  
  plot_room_square(RR) +
    geom_tile(data = RR |> filter(is.na(first)), aes(fill = n_Pe))
  
  ggsave(
           file = file.path(here("plot"), paste0("frame", sprintf("%02d", i), ".png")),
          width = 4,
         height = 4,
             bg = "white",
     create.dir = TRUE
  )
  
} 
