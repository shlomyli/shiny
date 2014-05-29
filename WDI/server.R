## Shiny example - WDI
## Shlomi Lifshits (2014)
## shlomi.lifshits@yahoo.com

library(shiny)
library(WDI)
library(knitr)
library(googleVis) 

source("global.R")

shinyServer(function(input, output,session) {
  
  df<-reactive({
    df<-WDI(country=input$country,WDI.INTERNET.INDICATOR.NAME)[,c("year",WDI.INTERNET.INDICATOR.NAME)]
  })
  
  num.internet.users<-reactive({
    new.df<-df()
    new.df[which.max(new.df$year)[1],WDI.INTERNET.INDICATOR.NAME]
  })
  
  output$text<-renderPrint({
    ifelse(is.na(num.internet.users()),"Information not available.",
           paste("Last report:",num.internet.users(),"%"))
  })
  
  output$country.img<-renderUI({
    lower.case<-tolower(substr(input$country,1,1))
    my.url<-paste("<img src=\"http://www.crwflags.com/fotw/images/",lower.case,"/",
                  tolower(input$country),".gif\"  width=\"100\" height=\"100\">",sep="")
    write(my.url,file="www/country_image.html")
    HTML(readLines( "www/country_image.html"))
  })
  
  output$view <- renderGvis({
    new.df<-df()
    names(new.df)<-c("year","users")
    new.df[,"year"]<-as.character(new.df[,"year"])
    gvisBarChart(new.df,xvar="year",yvar="users",
                 options=list(vAxes="[{title:'year of report'}]",hAxis="{title:'% internet users'}"))
  })
  
})
