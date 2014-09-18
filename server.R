library(datasets)
library(Hmisc)
library(GGally)
library(shiny)
data(mtcars)

# Convert variables to factor variables
mtcars2 <- mtcars
mtcars2$cyl <- as.factor(mtcars2$cyl)

mtcars2$vs <- as.factor(mtcars2$vs)
levels(mtcars2$vs) <- c("v","s")

mtcars2$am <- as.factor(mtcars2$am)
levels(mtcars2$am) <- c("auto","manual")

mtcars2$gear <- as.factor(mtcars2$gear)
mtcars2$carb <- as.factor(mtcars2$carb)

mtcars2$vehicle <- rownames(mtcars2)
rownames(mtcars2) <- NULL

shinyServer(function(input, output) { 
    output$segmentedData <- renderDataTable({
        predictorVariables <- colnames(mtcars2)

        predictorVariables <- 
            predictorVariables[predictorVariables %in% 
                               input$predictorVariables]
        
        mtcars2[,c("vehicle", "mpg", predictorVariables)]
    })
    
    output$edaPlot <- renderPlot({
        ggpairs(data=mtcars2,
                columns=c(1,which(colnames(mtcars2) %in% 
                                      input$predictorVariables)),
                colour=mtcars2$am)
    })
})