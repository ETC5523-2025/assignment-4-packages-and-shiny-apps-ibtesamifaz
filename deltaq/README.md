
# deltaq

<!-- badges: start -->

[![pkgdown
site](https://img.shields.io/badge/docs-pkgdown-blue.svg)](https://etc5523-2025.github.io/assignment-4-packages-and-shiny-apps-ibtesamifaz)
<!-- badges: end -->

The **deltaq** package provides data and interactive tools for exploring
the dynamics of COVID-19 outbreaks in Australia during the Delta variant
period. It is based on the work by *Zachreson et al.* (2022), which
modelled the efficacy of vaccines and quarantine systems under the Delta
variant using simulation techniques.

The package includes:

📊 **Dataset** — Simulated quarantine breaches, overseas cases, and
arrivals across Australian states between 27 October 2020 and 31 July
2021.  
💡 **Shiny app** — An interactive tool that allows users to explore
outbreak data, visualize state differences, and simulate quarantine
scenarios.  
📚 **Documentation** — Full reproducible examples and reference pages
available at  
👉 [**deltaq documentation
site**](https://etc5523-2025.github.io/assignment-4-packages-and-shiny-apps-ibtesamifaz)

This package aims to make Zachreson et al.’s data and findings more
accessible for teaching, research, and interactive communication.

## Installation

To install the development version from GitHub:

**Option 1 (using remotes):**

``` r
remotes::install_github(
  "ETC5523-2025/assignment-4-packages-and-shiny-apps-ibtesamifaz",
  subdir = "deltaq",
  dependencies = TRUE,
  build_vignettes = FALSE  # speed + avoids pandoc issues
)
```

## Example

``` r
library(deltaq)
head(deltaq_data)
summary(deltaq_data)
```

### You can also launch the interactive Shiny app included in the package:

``` r
deltaq::run_app()
```

## About the data

he dataset provided within deltaq is a cleaned and formatted version of
simulation outputs from Zachreson et al. (2022), Model-informed risk
assessment for COVID-19 quarantine systems under the Delta variant.

It contains daily records of:

- Simulated quarantine breaches

- Overseas-acquired cases

- Traveller arrivals

State identifiers and date range (27 Oct 2020 – 31 Jul 2021)

These data were used to evaluate how well quarantine systems performed
against imported Delta infections.

## Citation

If you use this package or dataset, please cite:

Zachreson, C., et al. (2022). Model-informed risk assessment for
COVID-19 quarantine systems under the Delta variant.
