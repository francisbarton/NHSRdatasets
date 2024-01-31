#' International COVID-19 reported infection and death data
#'
#' Reported COVID-19 infections, and deaths, collected and collated by the
#' European Centre for Disease Prevention and Control (ECDC, provided by day
#' and country.
#' Data were collated and published up to 14th December 2020, and have been
#' tidied so they are easily usable with the 'tidyverse'.
#'
#' Data sourced from \href{https://www.ecdc.europa.eu/en/publications-data/download-todays-data-geographic-distribution-covid-19-cases-worldwide}{European Centre for Disease Prevention and Control},
#' which is available under the open licence, compatible with the CC-BY-4.0
#' license. Further details available at the 
#' \href{https://www.ecdc.europa.eu/en/copyright}{ECDC website}.
#'
#' @docType data
#'
#' @keywords datasets covid covid19 coronavirus deaths epidemiology ecdc
#'
#' @format A tibble with 61900 rows and 7 columns
#' \describe{
#' \item{date_reported}{date. The date cases were reported.}
#' \item{continent}{chr. The geographical continent in which the reporting
#'  country or territory is located.}
#' \item{country_territory}{chr. The country or territory reporting the data.}
#' \item{country_territory_code}{chr. The three-letter country/territory code.}
#' \item{population}{numeric. The reported 2019 population of the country
#'  or territory, taken from Eurostat (for Europe) or the World Bank (for the
#'  rest of the world).}
#' \item{cases}{numeric. The reported number of Covid-19 cases.}
#' \item{deaths}{numeric. The reported number of Covid-19 deaths.}
#' }
#'
#' @source \href{https://www.ecdc.europa.eu/en/publications-data/download-todays-data-geographic-distribution-covid-19-cases-worldwide}{European Centre for Disease Prevention and Control}
#'
#' @usage data(covid19)
#'
#' @examples
#' data(covid19)
#' 
#' countries <- c("France", "Germany", "Italy", "Spain", "United Kingdom")
#'
#' # Create a plot of the performance for selected countries over time
#'  covid19 |>
#'    dplyr::filter(if_any("country_territory", \(x) x %in% countries)) |>
#'    ggplot2::ggplot(
#'    ggplot2::aes(
#'      x = date_reported,
#'      y = cases
#'    )) +
#'    ggplot2::geom_line(ggplot2::aes(colour = country_territory)) +
#'    ggplot2::scale_colour_discrete("Country") +
#'    ggplot2::scale_y_continuous(labels = scales::comma) +
#'    ggplot2::labs(
#'      title = "Covid-19 cases for selected countries",
#'      x = "Date",
#'      y = "Cases",
#'      alt = "Covid-19 cases (2020) in France, Germany, Italy, Spain & the UK"
#'    ) +
#'    ggplot2::theme_minimal()
"covid19"
