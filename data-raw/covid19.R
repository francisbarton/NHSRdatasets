covid19 <- "https://opendata.ecdc.europa.eu/covid19/casedistribution/csv" |>
  readr::read_csv(
    col_select = c(1, 11, 7, 9, 10, 5, 6),
    col_types = "ciiccdc",
    progress = FALSE
  ) |>
  dplyr::rename(
    date_reported = "dateRep",
    continent = "continentExp",
    country_territory = "countriesAndTerritories",
    country_territory_code = "countryterritoryCode",
    population = "popData2019"
  ) |>
  dplyr::mutate(across("date_reported", lubridate::dmy)) |>
  dplyr::mutate(across("country_territory", \(x) gsub("_", " ", x))) |>
  # Non-ASCII character in Curaçao triggers CRAN check NOTE
  dplyr::mutate(across("country_territory", \(x) sub("ç", "c", x))) |>
  dplyr::mutate(
    across(all_of(c("population", "cases", "deaths")), as.integer)
  ) |>
  dplyr::arrange(pick(c("continent", "country_territory", "date_reported")))

usethis::use_data(covid19, overwrite = TRUE)
