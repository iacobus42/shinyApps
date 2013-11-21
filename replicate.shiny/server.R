shinyServer(function(input, output) {
  library(ggplot2)
  penalize <- function(pH0, p, power) {
      1 - (pH0 * p) / (pH0 * p + (1 - pH0) * power)
  }
  probHA <- reactive({
       penalize(input$pH0, seq(0.001, 0.999, 0.001), input$power)
  })
  output$main_plot <- renderPlot({
    results <- data.frame(x = seq(0.001, 0.999, 0.001),
                          pHA = probHA())
	  p <- ggplot(results, aes(x = x, y = pHA)) + 
      geom_line() + scale_x_continuous("p value") + 
      scale_y_continuous("Pr(H_A is true)", limits = c(0, 1)) + 
      geom_vline(xintercept = 0.05, lty = 2)
      print(p)
	})
})