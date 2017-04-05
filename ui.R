#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage(
        
        # Application title
        titlePanel("Predict if a person in Titanic would have survived!"),
        
        # Sidebar with 2 drop downs for taking in the x and y variables 
        sidebarLayout(
                sidebarPanel(
                        selectInput("InputClass", "Choose a class", choices = c("1st", "2nd", "3rd", "crew")),
                        selectInput("InputSex", "Choose a sex", choices = c("male", "female")),
                        numericInput("InputAge", "Choose an age", value=50, min=0.1, max=100, step=.01 ),
                        submitButton("Predict")
                        
                ),
                
                # Show a plot of the generated distribution
                mainPanel(
                        h4("Using the titanic dataset, I have used the random forests model to predict if a person of a particular age, gender and class would have survived or not if she/he was in the ship then"), 
                        h3("This person would have: "),
                        textOutput("textOutput")
                        
                        
                )
        )
))
