plot_partial_room_square <- function(R) {
  ggplot(R, aes(col, row)) +
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
}
