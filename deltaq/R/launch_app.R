#' Launch the deltaq Shiny app
#'
#' @export
#' @importFrom shiny runApp system.file
launch_app <- function() {
  app_dir <- system.file("shiny", package = "deltaq")
  shiny::runApp(app_dir, display.mode = "normal")
}

