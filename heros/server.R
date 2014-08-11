shinyServer(function(input, output) {
  getExpectedValue <- function(low, med, high) {
      totalCharacters = 37
      maxNumLow = 7
      maxNumMed = 25
      maxNumHigh = 5
      priceLow = 200
      priceMed = 400
      priceHigh = 600
      expectedValue = (maxNumLow - low)/totalCharacters * priceLow + 
                      (maxNumMed - med)/totalCharacters * priceMed + 
                      (maxNumHigh - high)/totalCharacters * priceHigh
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
