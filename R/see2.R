see2 <- function(R, row, col) {
  first <- R[R$row == row | R$col == col, "first"]$first
  first_non_na <- first[!is.na(first)]
  second <- R[R$row == row | R$col == col, "second"]$second
  second_non_na <- second[!is.na(second)]
  sort(unique(c(first_non_na, second_non_na)))
}