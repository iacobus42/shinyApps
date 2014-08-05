shinyServer(function(input, output) {
  getExpectedValue <- function(low, med, high) {
      expectedValue = (6 - low)/22 * 200 + 
                      (13 - med)/22 * 400 + 
                      (3 - high)/22 * 600
      return(expectedValue)
  }
  output$eV <- renderText({
      low <- input$nLow
      med <- input$nMed
      high <- input$nHigh
      ev <- getExpectedValue(low, med, high)
      paste("The expected value of a random draw is ", round(ev, 2), sep = "")
	})
})