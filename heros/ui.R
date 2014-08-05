shinyUI(pageWithSidebar(
    headerPanel(""),
    sidebarPanel(
        sliderInput(inputId = "nLow",
                    label = "Number of low heroes:",
                    min = 0,
                   max = 6,
                   step = 1,
                    value = 0),
 
        sliderInput(inputId = "nMed",
                    label = "Number of medium heroes:",
                    min = 0,
                    max = 13,
                    step = 1,
                    value = 0),
        sliderInput(inputId = "nHigh",
                    label = "Number of high heroes:",
                    min = 0,
                    max = 3,
                    step = 1,
                    value = 0)),
    mainPanel(
        textOutput("eV"),
        textOutput("buyLow"),
        textOutput("buyMed"),
        textOutput("buyHigh"))))