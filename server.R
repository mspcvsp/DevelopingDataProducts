# This is the server logic for a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#
required.packages <- c("GGally",
                       "shiny")

new.packages <- required.packages[!(required.packages %in% 
                                        installed.packages()[,"Package"])]

if(length(new.packages)) {
    install.packages(new.packages)
} 

# Load required packages
library(GGally)
library(shiny)

shinyServer(function(input, output) {

  output$distPlot <- renderPlot({

    # generate bins based on input$bins from ui.R
    x    <- faithful[, 2]
    bins <- seq(min(x), max(x), length.out = input$bins + 1)

    # draw the histogram with the specified number of bins
    hist(x, breaks = bins, col = 'darkgray', border = 'white')

  })

})
