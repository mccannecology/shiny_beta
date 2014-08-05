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
                value=1),
    
    numericInput("shape2",
                "Shape parameter 2 (b):",
                min=0,
                max=1000,
                value=1),
    hr(),
    helpText("Generates a random sample from the beta distribution. Range: 0-1.")
  ),
  
  # GGPLOT
  
  mainPanel(
    plotOutput("distPlot"),
    verbatimTextOutput("mean"),
    verbatimTextOutput("stdev")
  )
  
  
  
))