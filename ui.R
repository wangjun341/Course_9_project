library(shiny)
shinyUI(pageWithSidebar(
    headerPanel("Predict Ozone"),
    sidebarPanel(
        h3("Choose one variable for plot"),
        helpText("Note: select the factor you want to check,",
                 "the factor will be shown in the form of histagram."),
        radioButtons("plot","Histogram",
                     c("Ozone"="Ozone",
                       "Solar radiation"="Solar.R",
                       "Wind"="Wind",
                       "Temperature"="Temp"
                           )),
        hr(),
        h3("Predict the Ozone"),
        helpText("Note: select the factor you want to include in the linear",
                 "regression model, the results of modeling are shown in the right."),
        checkboxGroupInput("x","Independent variable",
                           c("Solar radiation"="Solar.R",
                             "Wind"="Wind",
                             "Temperature"="Temp"
                             ),
                           selected=c("Solar.R","Wind","Temp")
            
            )
           ),
    mainPanel(
        plotOutput("histplot"),
        verbatimTextOutput("prediction")
        )
))