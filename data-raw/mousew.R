# Using the statistics from the Jax site:

# https://www.jax.org/jax-mice-and-services/strain-data-sheet-pages/body-weight-chart-000664
# Creating a fake dataset based on the mean and sd values reported on the Jax page.

# On the Jax website we can obtain the mean and sd of mice weight
# At 12 wk of age:
# C57Bl/6 M: 27.7 +/- 1.7
# C57Bl/6 F: 20.7 +/- 1.4
# DBA/2J M: 26.13 +/- 2.04
# DBA/2J F: 21.16 +/- 1.80

library(tidyverse)

set.seed(2080)
mousew <- data_frame(
  strain = factor(c(rep("C57Bl/6J", 200), rep("DBA/2J", 200))),
  sex = factor(c(rep(c("M", "F"), 2, each = 100))),
  weight = c(rnorm(100, 27.7, 1.7), rnorm(100, 20.7, 1.4),
             rnorm(100, 26.13, 2.04), rnorm(100, 21.16, 1.80))
)

devtools::use_data(mousew, overwrite = TRUE)

mousew_summary <- mousew %>%
  group_by(strain, sex) %>%
  summarise(median_weight = median(weight), mean_weight = mean(weight), sd_weight = sd(weight))

devtools::use_data(mousew_summary, overwrite = TRUE)
