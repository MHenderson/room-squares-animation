library(dplyr)
library(here)
library(purrr)
library(readr)

log_folder <- "~/workspace/maximal-room-squares/log"

# read in every partial room square from one run of greedy4
prs_df <- map_dfr(list.files(log_folder, full.names = TRUE), read_rds)

write_rds(prs_df, here("data", "prs_df.rds"))
