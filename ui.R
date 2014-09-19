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
                          "Weight (lb/1000)" = "wt",
                          "Transmission Type (Automatic/Manual)" = "am")

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
                     div(class="header", checked=NA,
                         p(paste("This tab displays the vehicle, its fuel ",
                                 "efficiency, and the predictor variables",
                                 "selected by a user. The following ",
                                 "R commands display additional information",
                                 "about this data set:")),
                           tags$ol(
                               tags$li("library(datasets)"), 
                               tags$li("data(mtcars)"), 
                               tags$li("?mtcars")
                           )),
                     dataTableOutput('segmentedData')),
            tabPanel("EDA",
                     h2("Exploratory Data Analysis"),
                     plotOutput("edaPlot")),
            tabPanel("lm() Output Summary",
                     h2("Multiple Linear Regression Model Fit"),
                     verbatimTextOutput("lmSummary")),
            tabPanel("lm() Output Diagnostics",
                     h2("Multiple Linear Regression Model Diagnostics"),
                     plotOutput("lmModelDiagnostics"))
        )
    )
))