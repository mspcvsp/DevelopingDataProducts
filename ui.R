library(shiny)  

checkBoxChoices <- list("Number of cylinders" = "cyl", 
                        "Displacement (cu.in.)" = "disp",
                        "Gross horsepower" = "hp",
                        "Rear axle ratio" = "drat",
                        "Weight (lb/1000)" = "wt",
                        "1/4 mile time" = "qsec",
                        "V/S (inline engine" = "vs",
                        "Transmission Type (Automatic/Manual)" = "am",
                        "Number of forward gears" = "gear",
                        "Number of carburetors" = "carb")

initialSelections <- list("Gross horsepower" = "hp",
                          "Weight (lb/1000)" = "wt")

shinyUI(pageWithSidebar( 
    
    headerPanel("Multiple Linear Regression Model for mtcars Data Set"), 
    
    sidebarPanel(
        checkboxGroupInput(predictorVariables <- "predictorVariables",
                           label <- "mtcars data set MPG predictor variables",
                           choices <- checkBoxChoices,
                           selections <- initialSelections),
        submitButton(text = "Apply Changes", icon = NULL)
    ),
    
    mainPanel( 
        tabsetPanel(
            tabPanel("EDA", plotOutput("edaPlot"))
        )
    )
))