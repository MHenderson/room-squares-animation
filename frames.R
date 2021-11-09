library(here)
library(dplyr)
library(ggplot2)
library(purrr)
library(readr)
library(tictoc)
library(tidyr)

source(here("R", "grid_lines.R"))

prs_df <- read_rds(here("data", "prs_df.rds"))

n <- 14

f <- function(i) {
  
  l_order <- i
  
  X1 <- X %>%
    filter(t == i) %>%
    pivot_wider() %>%
    mutate(n_Pe = map_dbl(Pe, length))
  
  X1 %>%
    ggplot(aes(col, row)) +
    geom_tile(aes(fill = n_Pe)) +
    geom_segment(data = grid_lines(n-1, n-1), aes(x = x, y = y, xend = xend, yend = yend), size = .1) +
    geom_text(data = . %>% filter(!is.na(first)), aes(label = paste(first, second, sep = ",")), size = 2) +
    scale_y_reverse() +
    scale_fill_gradient(limits = c(0, choose(n, 2)), low = "white", high = "blue") +
    coord_fixed() + 
    theme_void() +
    theme(
      legend.position  = "bottom"
    ) +
    labs(
      #title = paste("Step:", X1 %>% pull(t) %>% first() %>% as.character()),
      fill = "available pairs"
    )

  ggsave(file = paste0("frames/frame", sprintf("%02d", i), ".png"), width = 4, height = 4, bg = "white")
  
}

steps <- seq(min(X$t), max(X$t), 1)

tic()
map(steps, f)
toc()
