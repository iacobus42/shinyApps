shinyServer(function(input, output) {
  library(ggplot2)
  library(MASS)
  ivSim <- function(r, n = 100, effectZ = 1) {
    xc <- mvrnorm(n, c(20, 5), matrix(c(1, r, r, 1), 2, 2))
    z <- rnorm(n, 3, 1)
    x <- xc[, 1] + effectZ * z
    c <- xc[, 2]
    y <- x + c + rnorm(n, 0, 0.5)
    fullEst <- coef(lm(y ~ x + c))
    olsEst <- coef(lm(y ~ x))
    ivEst <- coef(lm(y ~ lm(x ~ z)$fitted.values))
    c(fullEst[2], olsEst[2], ivEst[2])
  }
  output$main_plot <- renderPlot({
    fits <- sapply(seq(0, 1, length = 100), ivSim, input$n, input$strength)
    results <- data.frame(coef = c(fits[1, ], fits[2, ], fits[3, ]),
                          Estimator = c(rep(c("Full Model", "OLS", "2SLS"), 
                            each = 100)), 
                          r = rep(seq(0, 1, length = 100), 3))
    p <- ggplot(results, aes(x = r, y = coef, color = Estimator)) + 
            geom_line() + geom_hline(yintercept = 1) + 
            scale_x_continuous("Correlation between x* and c") +
            scale_y_continuous("Estimate of the effect of x") 

    print(p)
	})
})