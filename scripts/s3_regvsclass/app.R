library(shiny)
library(ggplot2)
library(caret)

# Define the UI
ui <- fluidPage(
  titlePanel("Understanding Cross-Validation"),
  sidebarLayout(
    sidebarPanel(
      sliderInput("sampleSize", "Sample Size:", min = 30, max = 200, value = 100, step = 10),
      sliderInput("noiseLevel", "Noise Level:", min = 1, max = 10, value = 5),
      sliderInput("polyDegree", "Polynomial Degree:", min = 1, max = 5, value = 2),
      actionButton("generate", "Generate Data & Fit Model", icon("play"))
    ),
    mainPanel(
      plotOutput("dataPlot"),
      verbatimTextOutput("cvResults")
    )
  )
)

# Define the server logic
server <- function(input, output) {
  
  # Reactive expression for generating data
  data_reactive <- reactive({
    set.seed(123)  # Ensuring reproducibility
    x <- runif(input$sampleSize, 0, 10)
    y <- 4 + 2 * x - 0.3 * x^2 + rnorm(input$sampleSize, mean = 0, sd = input$noiseLevel)
    data.frame(x, y)
  })
  
  observeEvent(input$generate, {
    data <- data_reactive()  # Fetch the reactive data
    
    # Fit the model based on the selected polynomial degree
    fit_formula <- as.formula(paste("y ~ poly(x, ", input$polyDegree, ", raw=TRUE)"))
    fit_model <- lm(fit_formula, data = data)
    
    # Plot the data and the fitted model
    output$dataPlot <- renderPlot({
      ggplot(data, aes(x, y)) +
        geom_point() +
        geom_smooth(method = "lm", formula = fit_formula, se = FALSE, color = "red") +
        labs(title = "Data and Fitted Polynomial Model", x = "Predictor (x)", y = "Response (y)")
    })
    
    # Perform and display 5-fold cross-validation results
    output$cvResults <- renderPrint({
      cv_fit <- train(fit_formula, data = data, method = "lm", trControl = trainControl(method = "cv", number = 5))
      return(cv_fit$results)
    })
  })
}

# Run the application
shinyApp(ui, server)
