#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(ggplot2)

# Define UI for application that draws a histogram
ui <- fluidPage(
   
   # Application title
   titlePanel('Weight Loss Daily'),
   
   # Sidebar with a slider input for number of bins 
   sidebarLayout(
      sidebarPanel(
         selectInput("yvalues", 
                     "y-axis",  
                     choices=c(
                       "Percent Body Weight Loss Daily" = "Weight"
                     ))),
      
      
      # Show a plot of the generated distribution
      mainPanel(
         plotOutput("WeightPlot")
      ))
   )

# Define server logic required to draw a histogram
server <- function(input, output) {
   
   output$WeightPlot <- renderPlot({
      # generate bins based on input$bins from ui.R
     if (input$yvalues == "Weight"){
       y=Weights$Weight
       ylabs= "Percent Body Weight Loss Daily"
     }})

   


#Make ggplot object
      ggplot(Weights,aes(Factor(Preg),y))+
        geom_boxplot()+
        stat_boxplot(geom="errorbar")+
        ylab(ylabs)+
        xlab("Reproductive Status")
  }


# Run the application 
shinyApp(ui = ui, server = server)

