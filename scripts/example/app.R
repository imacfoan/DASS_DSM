# Load necessary libraries
library(shiny)
library(ggplot2)

# Function to generate data with approximate correlation
generate_data <- function(n, mu_x, sd_x, mu_y, sd_y, rho) {
  # Generate x
  x <- rnorm(n, mu_x, sd_x)
  # Generate error term
  err <- rnorm(n, 0, sd_y * sqrt(1 - rho^2))
  # Compute y based on specified correlation
  y <- mu_y + rho * (sd_y / sd_x) * (x - mu_x) + err
  data.frame(screen_time = x, sleep_duration = y)
}

# Generate sample data
set.seed(123) # Ensure reproducibility
data <- generate_data(
  n = 1000,
  mu_x = 6, # Mean daily hours of screen time
  sd_x = 2, # Standard deviation of screen time
  mu_y = 8, # Mean sleep duration in hours
  sd_y = 1, # Standard deviation of sleep duration
  rho = -0.6 # Target correlation
)

# Calculate the best fit line using linear regression
best_fit <- lm(sleep_duration ~ screen_time, data = data)
best_fit_slope <- coef(best_fit)[["screen_time"]]
best_fit_intercept <- coef(best_fit)[["(Intercept)"]]

# UI definition
ui <- fluidPage(
  titlePanel(" "),
  sidebarLayout(
    sidebarPanel(
      helpText("Adjust the slope and intercept. Compare your equation with the statistically derived best fit."),
      sliderInput("intercept", "Intercept:", min = 6, max = 10, value = best_fit_intercept),
      sliderInput("slope", "Slope:", min = -2, max = 0, value = best_fit_slope, step = 0.1),
      h4("User-defined Regression Line:"),
      textOutput("regressionEq"),
      h4("Line of Best Fit:"),
      textOutput("bestFitEq")
    ),
    mainPanel(
      plotOutput("regressionPlot")
    )
  )
)

# Server logic remains the same as the previous version


# Server logic
server <- function(input, output) {
  
  output$regressionPlot <- renderPlot({
    ggplot(data, aes(x=screen_time, y=sleep_duration)) +
      geom_point(alpha = 0.5) + # Slightly transparent points to handle overplotting
      geom_abline(slope = input$slope, intercept = input$intercept, col="blue", size = 1) + # User-defined line
      geom_abline(slope = best_fit_slope, intercept = best_fit_intercept, col="red", size = 1) + # Best fit line
      labs(x="Average Daily Screen Time (hrs)", y="Sleep Duration (hrs)", title="Screen Time vs. Sleep Duration")
  })
  
  output$regressionEq <- renderText({
    n <- nrow(data)
    user_defined_residuals <- data$sleep_duration - (input$intercept + input$slope * data$screen_time)
    user_defined_rse <- sqrt(sum(user_defined_residuals^2) / (n - 2))
    user_defined_ss <- sum((data$sleep_duration - (input$intercept + input$slope * data$screen_time))^2)
    total_ss <- sum((data$sleep_duration - mean(data$sleep_duration))^2)
    user_defined_r_squared <- 1 - user_defined_ss / total_ss
    
    eq <- paste("Sleep = ", input$intercept, " + ", "(", (input$slope), ")", "* Screen Time")
    r_squared_text <- paste("R^2: ", round(user_defined_r_squared, 2))
    rse_text <- paste("RSE: ", round(user_defined_rse, 2))
    paste(eq, "\n", r_squared_text, "\n", rse_text)
  })
  
  output$bestFitEq <- renderText({
    best_fit_r_squared <- summary(best_fit)$r.squared
    best_fit_rse <- summary(best_fit)$sigma
    
    eq <- paste("Sleep = ", round(best_fit_intercept, 2), " + ", "(", round(best_fit_slope, 2),")", "* Screen Time")
    r_squared_text <- paste("R^2: ", round(best_fit_r_squared, 2))
    rse_text <- paste("RSE: ", round(best_fit_rse, 2))
    paste(eq, "\n", r_squared_text, "\n", rse_text)
  })
}


# Run the application
shinyApp(ui = ui, server = server)
