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
  output$buyLow <- renderText({
      low <- input$nLow
      med <- input$nMed
      high <- input$nHigh
      ev <- getExpectedValue(low, med, high)
      if (ev > 200) {
          "You should buy random draws over buying a low value hero"
      } else {
          "You should buy a low value hero directly"
      }
  })
  output$buyMed <- renderText({
      low <- input$nLow
      med <- input$nMed
      high <- input$nHigh
      ev <- getExpectedValue(low, med, high)
      if (ev > 400) {
          "You should buy random draws over buying a medium value hero"
      } else {
          "You should buy a medium value hero directly"
      }
  })
  output$buyHigh <- renderText({
      low <- input$nLow
      med <- input$nMed
      high <- input$nHigh
      ev <- getExpectedValue(low, med, high)
      if (ev > 600) {
          "You should buy random draws over buying a high value hero"
      } else {
          "You should buy a high value hero directly"
      }
  })
})