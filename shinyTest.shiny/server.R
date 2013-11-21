shinyServer(function(input, output) {
    library(ggplot2)
    getP <- function(n, d, sb, p = FALSE, sw = 1) {
        x1 <- rnorm(n, 0, sb)
        if (p == TRUE) {
            x2 <- x1 - rnorm(n, d, sw)           
        }
        else {
            x2 <- rnorm(n, d, sb)
        }
        sig <- t.test(x1, x2, paired = p)$p.value <= 0.05
        sig
    }
    repGetP <- function(n, nSim, d, sb, p, sw) {
        mean(replicate(nSim, getP(n, d, sb, p, sw)))
    }
    potN <- reactive({
        potN <- seq(10, input$maxN, 5)
    })
    paired <- reactive({
        sapply(potN(), repGetP, input$iter,
               as.numeric(input$d),
               as.numeric(input$sigma),
               TRUE,
               as.numeric(input$sigmaWith))
    })
    twoSample <- reactive({
        sapply(potN(), repGetP, input$iter,
               as.numeric(input$d),
               as.numeric(input$sigma),
               FALSE,
               as.numeric(input$sigmaWith))
    })
	output$main_plot <- renderPlot({
        results <- data.frame(x = rep(potN(), 2),
                              power = c(twoSample(), paired()),
                              dataType = c(rep("Independent", length(potN())),
                                           rep("Paired", length(potN()))))
	    p <- ggplot(results, aes(x = x, y = power, color = dataType)) + 
        geom_line() + scale_x_continuous("N") + 
        scale_y_continuous("Power", limits = c(0, 1))
        #lines(seq(10, 100, 5), paired(), col = "red")
        print(p)
	})
})