library(shiny)

shinyServer(function(input,output){
  
  dist <- reactive({
    rbeta(input$obs,input$shape1,input$shape2)
  })
  
  
  output$distPlot<-renderPlot({
    
    p <- qplot(dist()) + geom_bar(fill="grey",colour="black",binwidth=0.1)
    p <- p + xlim(0,1)
    p <- p + ylab("Frequency")
    p <- p + xlab("Value")
    p <- p + theme_classic(base_size=18)
    p
    
  },
  width=400,
  height=400
  
  )
  
  # Generate a summary of the data
  # Mean 
  output$mean <- renderPrint({
    print("Mean:")
    mean(dist())
  })
  
  # Standard deviation 
  output$stdev <- renderPrint({
    print("Standard Deviation:")
    sd(dist())
  })
  
  
})