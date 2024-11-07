# Load the required libraries
library(shiny)
library(ggplot2)  # For the mpg dataset

# Define UI
ui <- fluidPage(
  
  # Application title
  titlePanel("Shiny App with MPG Dataset"),
  
  # Navbar with different tabs
  navbarPage("Navbar",
             
             # Tab 1 (Main content)
             tabPanel("Car Data", 
                      sidebarLayout(
                        sidebarPanel(
                          # Dropdown to select car manufacturer
                          selectInput("manufacturer", "Select a manufacturer:",
                                      choices = unique(mpg$manufacturer))
                        ),
                        mainPanel(
                          # Show a plot of the selected manufacturer's data
                          plotOutput("mpgPlot")
                        )
                      )
             ),
             
             # Tab 2 (About)
             tabPanel("About",
                      h3("This is a Shiny app to explore the MPG dataset."),
                      p("You can select a manufacturer from the dropdown on the left to see a plot of fuel efficiency (mpg) by car class.")
             )
  )
)

# Define server logic
server <- function(input, output) {
  
  # Filter the dataset based on the selected manufacturer
  filtered_data <- reactive({
    mpg[mpg$manufacturer == input$manufacturer, ]
  })
  
  # Render a plot based on the filtered data
  output$mpgPlot <- renderPlot({
    data <- filtered_data()
    
    # Create a boxplot of mpg by car class
    ggplot(data, aes(x = class, y = hwy)) +
      geom_boxplot() +
      labs(title = paste("Fuel Efficiency (mpg) for", input$manufacturer),
           x = "Car Class",
           y = "Highway MPG") +
      theme_minimal()
  })
}

# Run the application
shinyApp(ui = ui, server = server)
