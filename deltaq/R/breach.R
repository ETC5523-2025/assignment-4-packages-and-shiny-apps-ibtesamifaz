#' Breach Data (Sheet 9 of covid.xlsx)
#'
#' Daily quarantine breach data used in the DeltaQ Shiny app.
#'
#' This dataset contains daily observations of quarantine breaches and related metrics
#' for Australia and each state or territory. It was extracted from sheet 9 of
#' \code{data-raw/covid.xlsx}.
#'
#' @format A tibble with one row per date and the following columns:
#' \describe{
#'   \item{REPORT_DATE}{Date of observation (class: \code{Date})}
#'   \item{AUS, NSW, VIC, QLD, SA, WA, TAS, NT, ACT}{Daily breach rates for each jurisdiction}
#'   \item{AUS_BREACH, NSW_BREACH, VIC_BREACH, ...}{Binary indicator (1 = breach event occurred, 0 = none)}
#' }
#'
#' @source Extracted from local Excel file \code{data-raw/covid.xlsx}.
#'
#' @examples
#' data(breach)
#' head(breach)
"breach"
