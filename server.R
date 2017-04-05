#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)
library(caret)
library(randomForest)

df <- read.csv("https://vincentarelbundock.github.io/Rdatasets/csv/datasets/Titanic.csv", na.strings = "NA")
df[is.na(df)] <- 30.39
unn_cols <- c("X", "Name", "SexCode")
df <- df[, !(names(df)) %in% unn_cols]  
df <-as.data.frame(sapply(df, sub, pattern='\\*', replacement="crew"))
df$Age <- as.double(as.character(df$Age))
df$Sex <- as.numeric(df$Sex)
df$PClass <- as.numeric(df$PClass)
modelRF <- randomForest(Survived~., data=df)



shinyServer(function(input, output) {
        
        output$textOutput <- renderText({
                set.seed(2017-17-03)
                if(input$InputClass=="1st"){
                        PClass = 1
                }else if(input$InputClass=="2nd"){
                        PClass = 2
                } else if (input$InputClass=="3rd"){
                        PClass =3
                } else PClass = 4
                Age <- input$InputAge
                Sex <- ifelse(input$InputSex=="female", 1, 0)
                testdata <- data.frame(PClass, Age, Sex)
                if (as.character(predict(modelRF, testdata))== "1"){
                        "Survived!!!  :)"
                }else{
                        "Died!!!  :("
                }
              
                
        })
        
})
