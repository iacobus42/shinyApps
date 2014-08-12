shinyServer(function(input, output) {
  getExpectedValue <- function(low, med, high, 
                               maxNumLow, maxNumMed, maxNumHigh) {
      totalCharacters = maxNumLow + maxNumMed + maxNumHigh
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
      maxLow <- input$maxLow
      maxMed <- input$maxMed
      maxHigh <- input$maxHigh
      ev <- getExpectedValue(low, med, high, 
                             maxLow, maxMed, maxHigh)
      paste("The expected value of a random draw is ", round(ev, 2), sep = "")
	})
})
