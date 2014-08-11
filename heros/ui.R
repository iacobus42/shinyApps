shinyUI(pageWithSidebar(
    headerPanel(""),
    sidebarPanel(
        sliderInput(inputId = "nLow",
                    label = "Number of low heroes:",
                    min = 0,
                   max = 7,
                   step = 1,
                    value = 0),
 
        sliderInput(inputId = "nMed",
                    label = "Number of medium heroes:",
                    min = 0,
                    max = 25,
                    step = 1,
                    value = 0),
        sliderInput(inputId = "nHigh",
                    label = "Number of high heroes:",
                    min = 0,
                    max = 5,
                    step = 1,
                    value = 0)),
    mainPanel(
        textOutput("eV"))))
