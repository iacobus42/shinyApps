shinyUI(pageWithSidebar(
	headerPanel(""),
	sidebarPanel(
	sliderInput(inputId = "pH0",
				label = "How likely is it that the null is true before doing the analysis:",
				min = 0.001,
				max = 0.999,
				value = 0.500,
				step = 0.001),
	sliderInput(inputId = "power",
				label = "Typical Study Power:",
				min = 0.001,
				max = 0.999,
				value = 0.80,
				step = 0.001)),
	mainPanel(
	  plotOutput(outputId = "main_plot"))))
