library(shiny)
library(datasets)

# Define server logic required to summarize and view the selected
# dataset
shinyServer(function(input, output) {
  
  # Return the requested dataset
  datasetInput <- reactive({
    switch(input$dataset,
           "rock" = rock,
		   "iris" = iris)
  })
  
  # Generate a summary of the dataset
  #output$summary <- renderPrint({
  #  dataset <- datasetInput()
  #  summary(dataset)
  #})
  
  # Show the first "n" observations
  output$view <- renderTable({
    head(datasetInput(), n = input$obs)
  })
  
  # Show Pairs Plot
  output$pairsPlot <- renderPlot({
	#pairs(iris[1:30,1:4])
	x <- datasetInput()
	pairs(x[1:input$obs,1:4])
  })
})
