shinyUI(pageWithSidebar(
    headerPanel(""),
    sidebarPanel(
    sliderInput(inputId = "n",
                label = "Number of games observed?",
                min = 0,
                max = 100,
                value = 50,
                step = 1),
    sliderInput(inputId = "p",
                label = "True batting average?",
                min = 0.00,
                max = 1.00,
                value = 0.3,
                step = 0.05)),
    mainPanel(
      plotOutput(outputId = "main_plot"))))
