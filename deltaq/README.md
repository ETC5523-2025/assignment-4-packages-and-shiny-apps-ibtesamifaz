
# deltaq

<!-- badges: start -->
<!-- badges: end -->

The deltaq package provides data and interactive tools for exploring the
dynamics of COVID-19 outbreaks in Australia during the Delta variant
period. It is based on the work by Zachreson et al. (2022), which
modelled the efficacy of vaccines and quarantine systems under the Delta
variant using simulation techniques.

The package includes:

📊 A dataset containing simulated quarantine breaches, overseas cases,
and arrivals across Australian states between 27 October 2020 and 22
April 2021.

💡 A Shiny app (included in the package) that allows users to
interactively explore outbreak data, visualize state differences, and
simulate quarantine scenarios.

📚 Full documentation and reproducible examples for data exploration and
visualization.

This package aims to make Zachreson et al.’s data and findings more
accessible for teaching, research, and interactive communication.

## Installation

To install the development version from GitHub:

Option 1: using remotes install.packages(“remotes”)

remotes::install_github(
“ETC5523-2025/assignment-4-packages-and-shiny-apps-ibtesamifaz”, subdir
= “deltaq”, build_vignettes = TRUE )

Option 2: using pak install.packages(“pak”)

pak::pak(“ETC5523-2025/assignment-4-packages-and-shiny-apps-ibtesamifaz”)

## Example

Load the package and explore the data:

library(deltaq) head(deltaq_data) summary(deltaq_data)

You can also launch the interactive Shiny app included in the package:

deltaq::run_app()

## About the data

The dataset provided within deltaq is a cleaned and formatted version of
simulation outputs from Zachreson et al. (2022), Model-informed risk
assessment for COVID-19 quarantine systems under the Delta variant. It
contains daily records of:

Simulated quarantine breaches

Overseas-acquired cases

Traveller arrivals

State identifiers and date range (27 Oct 2020 – 22 Apr 2021)

These data were used to evaluate how well quarantine systems performed
against imported Delta infections.

## Citation

If you use this package or dataset, please cite:

> Zachreson, C., et al. (2022). *Model-informed risk assessment for
> COVID-19 quarantine systems under the Delta variant.*  
> \[Research study on vaccine efficacy and outbreak simulation.\]
