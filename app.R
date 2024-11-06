# Load necessary libraries

library(shiny)
library(dplyr)
library(ggplot2)

 

# Define UI for the app

ui <- fluidPage(

 

  # App title

  titlePanel("Iris Dataset Scatter Plot"),

 

  # Sidebar layout with inputs and plot output

  sidebarLayout(

    sidebarPanel(

      # Dropdown menus for x and y axes

      selectInput("xvar", "Select X-axis variable:",

                  choices = colnames(iris)[1:4], # Only numeric columns for axes

                  selected = "Sepal.Length"),

     

      selectInput("yvar", "Select Y-axis variable:",

                  choices = colnames(iris)[1:4], # Only numeric columns for axes

                  selected = "Sepal.Width")

    ),

   

    # Main panel to display the scatter plot

    mainPanel(

      plotOutput("scatterPlot")

    )

  )

)

 

# Define server logic for plotting

server <- function(input, output) {

 

  # Reactive expression to generate the plot based on input selections

  output$scatterPlot <- renderPlot({

    ggplot(iris, aes_string(x = input$xvar, y = input$yvar)) +

      geom_point(aes(color = Species), size = 3) +

      labs(title = paste("Scatter plot of", input$xvar, "vs", input$yvar),

           x = input$xvar,

           y = input$yvar) +

      theme_minimal()

  })

}

 

# Run the app

shinyApp(ui = ui, server = server)
