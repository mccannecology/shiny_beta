library(shiny)
library(ggplot2)
# library(eeptools)

shinyUI(pageWithSidebar(
  
  # Title
  headerPanel("Beta Distribution"),
  
  sidebarPanel(
    numericInput("obs", 
                 label = "Number of observations:", 
                 min = 0, 
                 value = 1000),
    
    numericInput("shape1",
                "Shape parameter 1 (a):",
                min=0,
                max=1000,
                value=1,
                step=0.01),
    
    numericInput("shape2",
                "Shape parameter 2 (b):",
                min=0,
                max=1000,
                value=1,
                step=0.01),
    
    selectInput("binwidth",
                "Binwidth:",
                choices=c(0.01,0.1)),
    
    hr(),
    helpText("Generates a random sample from the beta distribution."),
    helpText("Shape parameters accurate to two decimal places"),
    helpText("Ouput values Range: 0-1.")
  ),
  
  # GGPLOT
  
  mainPanel(
    plotOutput("distPlot"),
    verbatimTextOutput("mean"),
    verbatimTextOutput("stdev")
  )
  
  
  
))