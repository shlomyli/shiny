## Shiny example - WDI
## Shlomi Lifshits (2014)
## shlomi.lifshits@yahoo.com

library(shiny)

shinyUI(
  fluidPage(
    titlePanel("Rate of change in number of internet users across the world"),
    withMathJax(),
    sidebarLayout(
      sidebarPanel(
        selectInput("country", label="Country:",choices=countries,selected="IL"),
        helpText("Selected:"),
        htmlOutput("country.img"),  
        br(),
        br(),
        br(),
        br(),
        br(),
        br(),
        br(),
        br(),
        br(),
        br(),
        br(),
        br(),
        br(),
        br(),
        br(),
        br(),
        helpText("Created by Shlomi Lifshits (2014)"),
        helpText(HTML("Powered by <a href = \"http://www.rstudio.com/shiny/\">Shiny</a>."))
      ),
      mainPanel(        
        fluidRow(
          column(3,
                 verbatimTextOutput("text")
          ),
          column(3,
                 img(src=WDI.LOGO.URL,height=52, width=52),
                 a("http://data.worldbank.org/indicator")
          )
        ),
        htmlOutput("view"),
        p("Furmula \\(\\frac{x}{y} \\cdot 100\\), where x is the total number of users and y is the total population size.")
      )
    )
  )
)
