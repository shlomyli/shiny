## Shiny example - Excel
## Shlomi Lifshits (2014)
## shlomi.lifshits@yahoo.com

library(shiny)

shinyUI(
  fluidPage(
    titlePanel("Pairwise scatter plot"),
    fluidRow(
      column(4,
             h3("Import data from Excel:"),
             aceEditor("ace",mode="plain_text",height = "150px", 
                       value="Paste youe Excel data here.", theme="monokai"),
             htmlOutput("myTable")
      ),
      column(4,
             uiOutput("selectClassName"),
             plotOutput("pairsPlot")
      )
    )
  )
)

