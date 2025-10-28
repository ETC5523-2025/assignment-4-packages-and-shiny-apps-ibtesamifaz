#' deltaq: Exploring Quarantine Breach Data
#'
#' The **deltaq** package provides access to simulated 7-day quarantine breach rate data
#' for Australia and its states and territories (October 2020 – July 2021),
#' based on the modelling by Zachreson et al. (2022).
#'
#' The goal of this package is to provide simulated breach rates that allow users
#' to explore how susceptible each state or territory — and Australia overall —
#' may be to viral incursions under varying quarantine system conditions.
#'
#' In addition to the data, the package includes an interactive Shiny dashboard
#' for exploring jurisdictional differences and temporal trends in quarantine breach risk.
#' A vignette is also available to demonstrate how to use both the dataset and the app
#' for analysis.
#'
#' @section Main functions:
#' * `launch_app()` – Launches the *DeltaQ: Breach Data Explorer* Shiny app.
#'
#' @section Datasets:
#' * `breach` – Simulated 7-day quarantine breach rate data across Australian jurisdictions.
#'
#' @references
#' Zachreson, C., et al. (2022). *COVID-19 in low-tolerance border quarantine systems:
#' Impact of the Delta variant of SARS-CoV-2.* Science Advances.
#' \url{https://www.science.org/doi/10.1126/sciadv.abm3624}
#'
#' @docType package
#' @name deltaq
"_PACKAGE"
