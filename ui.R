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
    
    headerPanel("Multiple Linear Regression Model Example"), 
    
    sidebarPanel(
        checkboxGroupInput(predictorVariables <- "predictorVariables",
                           label <- "mtcars data set MPG predictor variables",
                           choices <- checkBoxChoices,
                           selections <- initialSelections),
        submitButton(text = "Apply Changes", icon = NULL)
    ),
    
    mainPanel( 
        tabsetPanel(
            tabPanel("Segmented data",
                     # http://shiny.rstudio.com/articles/html-tags.html
                     div(class="header",
                         checked=NA,
                         a(href="http://www.inside-r.org/r-doc/datasets/mtcars",
                           "mtcars data set description")
                     ),
                     dataTableOutput('segmentedData')),
            tabPanel("EDA",
                     h2("Exploratory Data Analysis"),
                     plotOutput("edaPlot")),
            tabPanel("lm() Summary", verbatimTextOutput("lmSummary"))
        )
    )
))