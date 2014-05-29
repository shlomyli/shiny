## Shiny example - Excel
## Shlomi Lifshits (2014)
## shlomi.lifshits@yahoo.com

library(shiny)
library(shinyAce)
library(googleVis)

shinyServer(function(input, output,session) {
  
  data<-reactive({
    write(input$ace,file="www/csv.txt")
    read.csv("www/csv.txt",header=T,sep="\t")
  })
  
  output$myTable <- renderGvis({
    myOptions <- list(page="disable",width=550)
    gvisTable(data(),options=myOptions)         
  })
  
  output$selectClassName <- renderUI({
    df<-data()
    if (dim(df)[1]>0)
    {
      col.headers <- names(df)
      classNum<-0:length(col.headers)
      names(classNum)<-c("No selection",col.headers)
      selectInput("className", label = h3("Choose class name"), 
                  choices = classNum, 
                  selected = 0)
    }
  })
  
  output$pairsPlot<-renderPlot({
    columnNumber<-as.numeric(input$className)
    df<-isolate(data())
    if (dim(df)[1]>0 && columnNumber>0)
    {
      df[,columnNumber]<-factor(df[,columnNumber])
      colors<-c("red","green","blue")[as.numeric(df[,columnNumber])]
      pairs(df[,-columnNumber],pch=21,bg=colors)
    }
  })
}
)
