# Shiny workshop examples
The folder contains two examples from my Shiny [workshop](https://sites.google.com/site/shlomilifshits/home/workshops/taking-a-shine-to-shiny).

* "WD" extract data from the World Bank and plot the number of internet users using Google Charts.
* "Excel" import an Excel table using copy/paste, apply PCA and plot the result.


install.packages("shiny")
install.packages("devtools")
install.packages("WDI")
install.packages("googleVis")

library(shiny)
library(devtools)
library(WDI)
library(googleVis)

runGitHub(repo="shiny",username="shlomyli",subdir="WDI")

