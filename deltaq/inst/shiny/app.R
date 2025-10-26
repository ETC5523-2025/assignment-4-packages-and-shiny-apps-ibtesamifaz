# inst/shiny/app.R

library(shiny)
library(dplyr)
library(tidyr)
library(ggplot2)

# --- 1) use packaged data (no read.csv) ----
breach <- deltaq::breach

# --- 2) pivot to long form: state + breach_rate ----
breach_long <- breach %>%
  mutate(REPORT_DATE = as.Date(REPORT_DATE)) %>%
  select(-ends_with("_BREACH")) %>%
  pivot_longer(
    cols = -REPORT_DATE,
    names_to = "state",
    values_to = "breach_rate"
  ) %>%
  arrange(state, REPORT_DATE)

min_date  <- min(breach_long$REPORT_DATE, na.rm = TRUE)
max_date  <- max(breach_long$REPORT_DATE, na.rm = TRUE)
state_opts <- sort(unique(breach_long$state))

# --- 3) UI ----
ui <- fluidPage(

  # custom styling
  tags$style(HTML("
    body { background:#f7f9fc; }
    .card { background:white; border-radius:14px; padding:18px 22px;
            box-shadow:0 8px 24px rgba(0,0,0,0.06); border:1px solid #e7ecf2; }
    .title { font-weight:700; font-size:26px; letter-spacing:0.2px; }
    .subtle { color:#5f6b7a; }
    .control-row { display:flex; gap:14px; flex-wrap:wrap; }
    .footer-note { font-size:13px; color:#5f6b7a; }
  ")),

  div(class = "card",
      div(class = "title", "DeltaQ: Breach Data Explorer"),
      p(class = "subtle",
        "Explore daily breach rates for Australian jurisdictions. ",
        "Use the controls to filter by one or more states and date range.")
  ),

  br(),

  div(class = "card",
      h4("Inputs"),
      div(class = "control-row",
          div(style="min-width:320px;",
              # Multi-selection enabled
              selectInput("states", "State(s)/Jurisdictions:",
                          choices = state_opts,
                          selected = c("NSW","VIC"),
                          multiple = TRUE)),
          div(style="min-width:360px;",
              dateRangeInput("dates", "Date range (inclusive):",
                             start = min_date, end = max_date,
                             min = min_date, max = max_date))
      ),
      tags$hr(),
      tags$ul(
        class = "subtle",
        tags$li(tags$b("State(s)/Jurisdictions:"),
                " You can select multiple to compare them on one plot."),
        tags$li(tags$b("Date range:"), " Restricts data to chosen dates."),
        tags$li(tags$b("Breach rate:"),
                " Daily rate value for each selected state from the dataset.")
      )
  ),

  br(),

  div(class = "card",
      h4("Breach rate over time"),
      plotOutput("breachPlot"),
      tags$hr(),
      htmlOutput("guideText", class = "footer-note")
  )
)

# --- 4) Server ----
server <- function(input, output, session) {

  # reactive filtered data
  dat_sel <- reactive({
    breach_long %>%
      filter(
        state %in% input$states,
        REPORT_DATE >= input$dates[1],
        REPORT_DATE <= input$dates[2]
      )
  })

  # --- Plot: multiple lines with colour legend ---
  output$breachPlot <- renderPlot({
    df <- dat_sel()
    req(nrow(df) > 0)

    ggplot(df, aes(REPORT_DATE, breach_rate, colour = state)) +
      geom_line(linewidth = 1, na.rm = TRUE) +
      geom_point(size = 1.4, na.rm = TRUE) +
      labs(
        x = "Date",
        y = "Breach rate",
        title = paste("Breach rates —", paste(input$states, collapse = ", ")),
        colour = "State"
      ) +
      theme_minimal(base_size = 12) +
      theme(
        legend.position = "bottom",
        panel.grid.minor = element_blank(),
        plot.title = element_text(face = "bold")
      )
  })

  # --- Interpretation helper updates dynamically ---
  output$guideText <- renderUI({
    df <- dat_sel()
    req(nrow(df) > 0)

    summary_df <- df %>%
      group_by(state) %>%
      summarise(
        start = first(na.omit(breach_rate)),
        end = last(na.omit(breach_rate)),
        min_r = min(breach_rate, na.rm = TRUE),
        max_r = max(breach_rate, na.rm = TRUE)
      )

    HTML(paste0(
      "<b>How to interpret:</b> Each coloured line shows the breach rate trend for one state. ",
      "Higher lines indicate higher breach rates. ",
      "You can compare slopes to see which states increased or decreased. <br><br>",
      paste0(
        apply(summary_df, 1, function(row) {
          delta <- as.numeric(row['end']) - as.numeric(row['start'])
          trend <- if (abs(delta) < 1e-8) "remained stable"
          else if (delta > 0) "increased"
          else "decreased"
          sprintf("<b>%s</b>: ranged %.1f–%.1f, and %s over the selected period.",
                  row['state'], as.numeric(row['min_r']),
                  as.numeric(row['max_r']), trend)
        }),
        collapse = "<br>"
      )
    ))
  })
}

shinyApp(ui, server)
