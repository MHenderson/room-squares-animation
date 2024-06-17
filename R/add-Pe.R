add_Pe <- function(R, n) {
  X <- tidyr::expand_grid(row = 1:(n - 1), col = 1:(n - 1))
  
  R_with_empties <- dplyr::left_join(X, R, by = join_by(row, col))
  
  just_empty_cells <- R_with_empties |>
    dplyr::filter(is.na(first), is.na(second))
  
  n_pairs_avail <- function(row, col) choose(14 - length(see2(R, row, col)), 2)
  
  empty_cells_with_Pe <- just_empty_cells |>
    dplyr::mutate(n_Pe = purrr::map2_dbl(row, col, n_pairs_avail))
  
  R_with_Pe <- dplyr::bind_rows(R |> dplyr::mutate(n_Pe = NA), empty_cells_with_Pe) |>
    dplyr::arrange(row, col)
  
  return(R_with_Pe)
}
          