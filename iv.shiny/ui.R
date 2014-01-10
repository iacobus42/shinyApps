shinyUI(pageWithSidebar(
    headerPanel(""),
    sidebarPanel(
    sliderInput(inputId = "n",
                label = "What is the n for this study?",
                min = 100,
                max = 10000,
                value = 1000,
                step = 10),
    sliderInput(inputId = "strength",
                label = "How strong is the instrument?",
                min = 0.1,
                max = 10,
                value = 1,
                step = 0.1)),
    mainPanel(
      plotOutput(outputId = "main_plot"))))
