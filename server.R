library(shiny);library(datasets);library(ggplot2)
df<-airquality
shinyServer(
    function(input,output){
        output$histplot<-renderPlot({
            hist(df[,input$plot],xlab=NULL,
                 main=paste("Histogram of",input$plot))
            
        })
        
        output$prediction<-renderPrint({
            prex<-reactive(input$x)
            formulax1<-reactive(paste("Ozone~",prex()))
            formulax2<-reactive(paste("Ozone~",prex()[1],
                                      "+",prex()[2]))
            if(length(prex())==0)
               ("Please input at least one variable")
            else {
                if(length(prex())==1) 
                    fit<-lm(as.formula(formulax1()),data=df)
                else {
                    if(length(prex())==2) {
                        
                        fit<-lm(as.formula(formulax2()),data=df)
                    }
                    else fit<-lm(Ozone~Solar.R+Wind+Temp,data=df)
                }
            summary(fit)$coef
            }
            
        })
        
    }
)