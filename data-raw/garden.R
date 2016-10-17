
garden <- tibble::tibble(gardenA = c(3, 4, 4, 3, 2, 3, 1, 3, 5, 2),
                         gardenB = c(5, 5, 6, 7, 4, 4, 3, 5, 6, 5),
                         gardenC = c(3, 3, 2, 1, 10, 4, 3, 11, 3, 10))

devtools::use_data(garden, overwrite = TRUE)
