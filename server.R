library(datasets)
library(Hmisc)
library(GGally)
library(shiny)
data(mtcars)

shinyServer(function(input, output) { 
    output$edaPlot <- renderPlot({
        ggpairs(data=mtcars,
                columns=c(1,which(colnames(mtcars) %in% 
                                  input$predictorVariables)),
                colour=mtcars$am)
    })
})