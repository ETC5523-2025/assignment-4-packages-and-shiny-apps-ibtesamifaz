#' Breach Data
#'
#' Simulated 7-day quarantine breach rate data across Australian states and territories,
#' based on the modelling by Zachreson et al. (2022).
#'
#' This dataset includes raw simulated data showing the 7-day breach rates of COVID-19
#' (or other potential viruses) within Australian quarantine systems. It provides
#' state-level and national-level daily observations of breach probabilities under
#' different quarantine system configurations.
#'
#' The data was extracted from sheet 9 of \code{data-raw/covid.xlsx}, which is derived
#' from simulations presented in Zachreson et al. (2022). The original study is available
#' at \url{https://www.science.org/doi/10.1126/sciadv.abm3624}.
#'
#' This dataset can be used to analyse the susceptibility of any virus given the
#' quarantine systems implemented across different Australian jurisdictions.
#'
#' @format A tibble with one row per date and the following columns:
#' \describe{
#'   \item{REPORT_DATE}{Date of observation (class: \code{Date})}
#'   \item{AUS, NSW, VIC, QLD, SA, WA, TAS, NT, ACT}{Daily 7-day breach rates for each jurisdiction}
#'   \item{AUS_BREACH, NSW_BREACH, VIC_BREACH, QLD_BREACH, SA_BREACH, WA_BREACH, TAS_BREACH, NT_BREACH, ACT_BREACH}{Binary indicators (1 = breach event occurred, 0 = none)}
#' }
#'
#' @source Simulated data derived from Zachreson et al. (2022), *COVID-19 in low-tolerance
#' border quarantine systems: Impact of the Delta variant of SARS-CoV-2*. Science Advances.
#' Available at \url{https://www.science.org/doi/10.1126/sciadv.abm3624}.
#'
#' @examples
#' data(breach)
#' head(breach)
"breach"
