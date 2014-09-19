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
                     # http://shiny.rstudio.com/articles/html-tags.html
                     div(class="header",
                         checked=NA,
                         a(href="http://www.inside-r.org/r-doc/datasets/mtcars",
                           paste("This panel displays the selected predictor",
                                 "variables from the mtcars data set."))
                     ),
                     dataTableOutput('segmentedData')),
            tabPanel("EDA",
                     h2("Exploratory Data Analysis"),
                     div(class="header",
                         checked=NA,
                         a(href=paste0("http://tgmstat.wordpress.com/2013",
                                       "/11/13/plot-matrix-with-the-r-",
                                       "package-ggally/"),
                           paste("This plot is generated using the ggpairs()",
                                 "function from the GGally package."))
                     ),
                     plotOutput("edaPlot")),
            tabPanel("lm() Summary",
                     h2("Multiple Linear Regression Model Fit"),
                     div(class="header",
                         checked=NA,
                         a(href=paste0("http://faculty.mccombs.utexas.edu/carlos.",
                                       "carvalho/teaching/lecture3_Dallas.pdf"),
                           paste("Dr. Carlos Carvalho (The University of Texas",
                                 "McCombs School of Business) lecture:",
                                 "'Mutliple Linear Regession Model: Estimation",
                                 "Inference, & F-tests"))
                     ),
                     verbatimTextOutput("lmSummary"))
        )
    )
))