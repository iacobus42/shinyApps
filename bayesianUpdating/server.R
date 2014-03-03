shinyServer(function(input, output) {
  library(ggplot2)
  getBetaParam <- function(n, p) {
    set.seed(42)
    atbats <- round(runif(n, 0, 10))
    hits <- rbinom(n, atbats, p)
    alpha <- numeric(n + 1)
    beta <- numeric(n + 1)
    alpha[1] <- 0.5
    beta[1] <- 0.5
    for (game in 1:n) {
      alpha[game + 1] <- alpha[game] + hits[game]
      beta[game + 1] <- beta[game] + (atbats[game] - hits[game])
    }
    return(c(alpha[n + 1], beta[n + 1]))
  }

  output$main_plot <- renderPlot({
    alphaBeta <- getBetaParam(input$n, input$p)
    tp <- input$p
    results <- data.frame(p = seq(0, 1, 0.01))
    results$density <- dbeta(results$p, alphaBeta[1], alphaBeta[2])
    p <- ggplot() + 
            geom_line(data = results, aes(x = p, y = density)) + 
            scale_x_continuous("True Value of p") + 
            scale_y_continuous("Density") + 
            geom_vline(x = tp, lty = 2)

    print(p)
	})
})