# This is the user interface for the shiny app to determine diamond price based on factors such as carat, cut, color, and clarity a Shiny web application. You can

library(shiny)
library(ggplot2)

# load data
data("diamonds")

## Mustafa Ozturk 15.05.20

# Define UI for the application
shinyUI(fluidPage(titlePanel("Diamonds - Cost depends on Carat, Cut, Color, and Clarity"),
        
# Sidebar with a slider input for number of variables
sidebarLayout(sidebarPanel(h4("Choose Diamond Factors"),
        selectInput("cut", "Cut", (sort(unique(diamonds$cut), decreasing = T))),
        selectInput("color", "Color", (sort(unique(diamonds$color)))),
        selectInput("clarity", "Clarity", (sort(unique(diamonds$clarity), decreasing = T))),
        sliderInput("lm", "Carat",
                min = min(diamonds$carat), max = max(diamonds$carat),
                value = max(diamonds$carat) / 2, step = 0.1),
                h4("Predicted Price"), verbatimTextOutput("predict"), width = 4),
                
# Show a plot of the carat/price relationship
mainPanel("Price/Carat Relationship", plotOutput("distPlot"))
        )))