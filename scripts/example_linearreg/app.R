library(shiny)
library(plotly)

# Define UI
ui <- fluidPage(
  titlePanel("Interactive Plot: Simple Linear Regression"),
  sidebarLayout(
    sidebarPanel(
      # Preset wider ranges for the slope and intercept sliders
      sliderInput("slope", "Slope", min = -1000, max = 1000, value = 750, step = 10),
      sliderInput("intercept", "Intercept", min = 0, max = 50000, value = 25000, step = 100)
    ),
    mainPanel(
      plotlyOutput("plot"),
      verbatimTextOutput("stats")
    )
  )
)

# Define server logic
server <- function(input, output, session) {
  # Simulated data
  set.seed(42)
  n <- 200
  hours_worked <- runif(n, 20, 60)
  annual_income <- 25000 + hours_worked * 750 + rnorm(n, 0, 5000)
  data <- data.frame(hours_worked, annual_income)
  
  fit <- lm(annual_income ~ hours_worked, data) # Best fit
  
  output$plot <- renderPlotly({
    user_line <- input$intercept + input$slope * c(min(data$hours_worked), max(data$hours_worked))
    
    plot_ly(data, x = ~hours_worked, y = ~annual_income, type = 'scatter', mode = 'markers', 
            marker = list(size = 5, color = 'black')) %>%
      add_lines(x = c(min(data$hours_worked), max(data$hours_worked)), 
                y = predict(fit, newdata = data.frame(hours_worked = c(min(data$hours_worked), max(data$hours_worked)))),
                name = "Best Fit Line", line = list(color = 'red')) %>%
      add_lines(x = c(min(data$hours_worked), max(data$hours_worked)), 
                y = user_line, name = "User Line", line = list(color = 'blue', dash = 'dash')) %>%
      layout(
        title = "Hours Worked and Annual Income",
        xaxis = list(title = "Hours Worked"),  # X-axis title
        yaxis = list(title = "Annual Income ($)")  # Y-axis title
      )
  })
  
  
  output$stats <- renderPrint({
    # Calculate correlation coefficient
    cor_coef <- cor(data$hours_worked, data$annual_income)
    cat("Correlation Coefficient:", round(cor_coef, 2), "\n\n")
    
    # Additional statistics for the best fit line
    cat("Best Fit Line (Red):\n")
    cat("Equation: Annual Income  =", round(coef(fit)[1], 2), "+", round(coef(fit)[2], 2), "(Hours Worked)\n")
    cat("R-squared:", round(summary(fit)$r.squared, 2), "\n")
    cat("Residual Standard Error (RSE):", round(summary(fit)$sigma, 2), "\n\n")
    
    # Additional statistics for the user-defined line
    user_predicted <- input$intercept + input$slope * data$hours_worked
    user_residuals <- data$annual_income - user_predicted
    user_rss <- sum(user_residuals^2)
    user_rse <- sqrt(user_rss / (nrow(data) - 2))
    user_tss <- sum((data$annual_income - mean(data$annual_income))^2)
    user_r_squared <- 1 - user_rss / user_tss
    
    cat("User-Defined Line (Blue dashed):\n")
    cat("Equation: Annual Income =", input$intercept, "+", input$slope, "(Hours Worked)\n")
    cat("R-squared:", round(user_r_squared, 2), "\n")
    cat("Residual Standard Error (RSE):", round(user_rse, 2), "\n")
  })
}


# Run the application
shinyApp(ui = ui, server = server)
