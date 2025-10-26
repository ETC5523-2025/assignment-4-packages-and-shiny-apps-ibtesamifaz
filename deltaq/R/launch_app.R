#' Launch the DeltaQ Shiny App
#'
#' This function launches the interactive DeltaQ application that allows users
#' to explore daily breach rates across Australian jurisdictions over time.
#'
#' The app enables users to:
#' \itemize{
#'   \item Select one or more states or territories for comparison
#'   \item Choose a date range to filter the period of interest
#'   \item View breach rate trends with different colours for each state
#'   \item Read a dynamic interpretation of the plotted results
#' }
#'
#' The underlying dataset \code{breach} is included within the \pkg{deltaq} package.
#'
#' @return Runs a Shiny application in the user's default web browser.
#' @examples
#' \dontrun{
#'   deltaq::launch_app()
#' }
#' @export
launch_app <- function() {
  app_dir <- system.file("shiny", package = "deltaq")
  if (app_dir == "" || !dir.exists(app_dir)) {
    stop("Shiny app not found. Ensure 'inst/shiny/app.R' exists.")
  }
  shiny::runApp(app_dir, display.mode = "normal")
}
