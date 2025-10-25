#' Launch the deltaq Shiny app
#' @export
launch_app <- function() {
  app_dir <- system.file("shiny", package = "deltaq")
  shiny::runApp(app_dir, display.mode = "normal")
}
