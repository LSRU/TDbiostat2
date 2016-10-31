# This script retrieves the dataset from http://people.sc.fsu.edu/~jburkardt/datasets/regression/regression.html
# which was made available under the terms of the GNU LGPL license.

# The x09 file is well documented but a unhandy dataset:
# The file contains a header with some comments (starting with #)
# Columns are described
# Data are encoded as a fixed width file

# readr provides read_fwf which can be used together with 
# readr::fwf_empty() to detect the columns
# But even if fwf_empty() is supposed to accept the comment and skip arguments
# I'm not able to get both arguments work together...
# We will only use the skip argument...

library(tidyverse)
x09_file <- "http://people.sc.fsu.edu/~jburkardt/datasets/regression/x09.txt"

blood_fat <- read_fwf(x09_file, skip = 36, n_max = 25,
                col_positions = fwf_empty(x09_file, skip = 36,
                                          col_names = c("id", "one",
                                                        "weight", "age", "fat")))
blood_fat <- blood_fat %>%
  select(-one)

devtools::use_data(blood_fat, overwrite = TRUE)
