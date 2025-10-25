library(readxl)

path <- "data-raw/covid.xlsx"

# CHANGE sheet to the one that has >3 columns, e.g., "Raw"
breach <- readxl::read_excel(
  path = path,
  sheet = "Raw",
  .name_repair = "minimal"
)

# Save the dataset used by data(breach)
usethis::use_data(breach, overwrite = TRUE)
