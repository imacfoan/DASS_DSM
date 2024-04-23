library(shiny)
library(plotly)
library(ggplot2)
library(tidyverse)
ui <- navbarPage(
  "SOST70033 Section 2",
  tabPanel(
    "Home", 
    fluidPage(
      h1("Assumptions Violations"), 
      h3("Use the tabs to navigate through each section. Each tab allows you to explore some assumptions violations in more detail. 
        There are several features such as selecting/deselecting outliers and/or leverage points, 
        displaying residual plots, appling transformations to the response or predictor amongst others"),
    )
  ),
  tabPanel(
    "Non-linearity",
    sidebarLayout(
      sidebarPanel(
        # Existing selectInput for polynomial degree selection
        selectInput("polyDegree", "Choose Polynomial Degree:",
                    choices = c("None" = "no", "Quadratic" = "Quadratic", "Cubic" = "Cubic"),
                    selected = "no")
      ),
      mainPanel(
        plotlyOutput("nonLinearPlot"), 
        verbatimTextOutput("stats")
      )
    )
  ),
  tabPanel(
    "Influence of Outliers and Leverage Points",
    sidebarLayout(
      sidebarPanel(
        checkboxInput("includeOutlier", "Include Outlier", FALSE),
        checkboxInput("includeLeverage", "Include High Leverage Point", FALSE),
        checkboxInput("showResiduals", "Show Studentised Residuals", FALSE)
      ),
      mainPanel(
        plotlyOutput("plot"),
        verbatimTextOutput("statsOutliers")
      )
    )
  ),
  
  tabPanel(
    "Heteroskedasticity",
    sidebarLayout(
      sidebarPanel(
        selectInput("plotType", "Select Plot Type:",
                    choices = list("Original Scatterplot" = "scatterOriginal",
                                   "Residuals vs. Fitted (Before Log Transform)" = "residualsBefore",
                                   "Scatterplot After Log Transform" = "scatterLogTransform",
                                   "Residuals vs. Fitted (After Log Transform)" = "residualsAfter"),
                    selected = "scatterOriginal")
      ),
      mainPanel(
        plotlyOutput("heteroskedasticityPlot"),
        verbatimTextOutput("modelStats") 
      )
    )
  )
)



# Define server logic
server <- function(input, output, session) {
  output$nonLinearPlot <- renderPlotly({
    set.seed(123)
    n <- 100
    x <- runif(n, 1, 10)
    y <- 2 + 3 * x - 0.2 * x^2 + 0.05 * x^3 + rnorm(n, mean = 0, sd = 5)  # Including cubic term for demonstration
    
    df <- data.frame(x = x, y = y)
    
    # Choose the model based on selected polynomial degree
    fit <- switch(input$polyDegree,
                  "no" = lm(y ~ x, data = df),
                  "Quadratic" = lm(y ~ x + I(x^2), data = df),
                  "Cubic" = lm(y ~ x + I(x^2) + I(x^3), data = df)
    )
    
    df$fitted <- predict(fit)
    df$residuals <- residuals(fit)
    
    titleText <- ifelse(input$polyDegree == "no", "Before Transformation", paste("After", input$polyDegree, "Transformation"))
    
    p <- ggplot(df, aes(x = fitted, y = residuals)) +
      geom_point() +
      geom_smooth(se = FALSE, color = "red", method = "loess") +
      labs(x = "Fitted Values", y = "Residuals",
           title = titleText) +
      theme_minimal()
    
    ggplotly(p)
  })
  
  output$stats <- renderPrint({
    set.seed(123)
    n <- 100
    x <- runif(n, 1, 10)
    y <- 2 + 3 * x - 0.2 * x^2 + 0.05 * x^3 + rnorm(n, mean = 0, sd = 5)
    
    df <- data.frame(x = x, y = y)
    
    fit <- switch(input$polyDegree,
                  "no" = lm(y ~ x, data = df),
                  "Quadratic" = lm(y ~ x + I(x^2), data = df),
                  "Cubic" = lm(y ~ x + I(x^2) + I(x^3), data = df)
    )
    
    modelTypeText <- ifelse(input$polyDegree == "no", "Before Transformation:", paste("After", input$polyDegree, "Transformation:"))
    cat(modelTypeText, "\n")
    
    coefs <- coef(fit)
    equation <- switch(input$polyDegree,
                       "no" = sprintf("y = %.2f + %.2f(x)", coefs[1], coefs[2]),
                       "Quadratic" = sprintf("y = %.2f + %.2f(x) + %.2f(x^2)", coefs[1], coefs[2], coefs[3]),
                       "Cubic" = sprintf("y = %.2f + %.2f(x) + %.2f(x^2) + %.2f(x^3)", coefs[1], coefs[2], coefs[3], coefs[4])
    )
    cat("Model Equation:\n", equation, "\n")
    
    summaryStats <- summary(fit)
    cat(sprintf("R-squared: %.2f\n", summaryStats$r.squared))
    cat(sprintf("Residual Standard Error: %.2f\n", summaryStats$sigma))
  })

  output$plot <- renderPlotly({
    set.seed(42)
    n <- 100
    x <- runif(n, 1, 10)
    
    # Generate base data with a clear linear relationship plus noise
    base_y <- 5 * x + rnorm(n, mean = 0, sd = 20)
    df_base <- data.frame(x = x, y = base_y)
    fit_base <- lm(y ~ x, data = df_base)
    
    # Initialize the augmented data as a copy of the base data
    df_augmented <- df_base
    
    # Add outlier and leverage points to the augmented data
    if(input$includeOutlier) {
      outlier_x <- median(x) + 5
      outlier_y <- max(base_y) + 300
      df_augmented <- rbind(df_augmented, data.frame(x = outlier_x, y = outlier_y))
    }
    
    if(input$includeLeverage) {
      leverage_x <- max(x) * 1.5
      leverage_y <- median(base_y) + 40
      df_augmented <- rbind(df_augmented, data.frame(x = leverage_x, y = leverage_y))
    }
    
    fit_augmented <- lm(y ~ x, data = df_augmented)
    
    if(input$showResiduals) {
      df_augmented$studentized_res <- rstudent(fit_augmented)
      df_augmented$leverage <- hatvalues(fit_augmented)
      
      p <- ggplot(df_augmented, aes(x = leverage, y = studentized_res)) +
        geom_point() +
        geom_hline(yintercept = 0, linetype = "dashed", color = "blue") +
        labs(x = "Leverage", y = "Studentised Residuals", title = "Studentised Residuals vs. Leverage") +
        theme_minimal()
    } else {
      p <- ggplot(df_base, aes(x = x, y = y)) +
        geom_point() +
        geom_smooth(method = "lm", se = FALSE, color = "red") +
        geom_point(data = df_augmented, aes(x = x, y = y), color = "black") +
        geom_line(data = df_augmented, aes(x = x, y = predict(fit_augmented, newdata = df_augmented)), color = "blue", linetype = "dashed") +
        labs(x = "Predictor (X)", y = "Response (Y)", title = "Influence of Outliers and Leverage Points")
    }
    
    ggplotly(p)
  })
  
    output$statsOutliers <- renderPrint({
      if (!input$showResiduals) {
        set.seed(42)
        n <- 100
        x <- runif(n, 1, 10)
        y <- 2 * x + rnorm(n, 0, 2)
        
        if(input$includeOutlier) {
          y <- c(y, 30) # Outlier
          x <- c(x, 5)
        }
        if(input$includeLeverage) {
          y <- c(y, 50) # High leverage point
          x <- c(x, 25)
        }
        df <- data.frame(x = x, y = y)
        fit <- lm(y ~ x, data = df)
        
        message <- "Model without Outliers/Leverage Points:"
        if(input$includeOutlier && input$includeLeverage) {
          message <- "Model with Outlier and High Leverage Point:"
        } else if(input$includeOutlier) {
          message <- "Model with Outlier:"
        } else if(input$includeLeverage) {
          message <- "Model with High Leverage Point:"
        }
        
        cat(message, "\n")
        cat(sprintf("Equation: y = %.2f + %.2f(x)\n", coef(fit)[1], coef(fit)[2]))
        cat(sprintf("R-squared: %.2f\n", summary(fit)$r.squared))
        cat(sprintf("Residual Standard Error (RSE): %.2f\n", summary(fit)$sigma))
      } else {
        cat("Model statistics are displayed only for the scatter plots.")
      }
    })

    output$heteroskedasticityPlot <- renderPlotly({
      set.seed(42)
      n <- 1000  # Number of data points
      x <- runif(n, 1, 10)
      y <- exp(1 + 0.5 * x) * rnorm(n, mean = 1, sd = 0.5)
      
      # Apply log transformation conditionally and handle potential NAs
      df_original <- data.frame(x = x, y = y)
      df_transformed <- data.frame(x = x, y = log(y))
      
      # Ensure NA values are handled properly
      df_transformed <- na.omit(df_transformed)
      
      # Choose the appropriate data frame based on user selection
      df_use <- switch(input$plotType,
                       scatterOriginal = df_original,
                       residualsBefore = df_original,
                       scatterLogTransform = df_transformed,
                       residualsAfter = df_transformed)
      
      # Fit the model to the selected data frame
      fit <- lm(y ~ x, data = df_use)
      
      if(input$plotType %in% c("scatterOriginal", "scatterLogTransform")) {
        y_axis_label <- ifelse(input$plotType == "scatterLogTransform", "Log(y)", "Response (Y)")
        
        # Scatter plot
        p <- ggplot(df_use, aes(x = x, y = y)) +
          geom_point() +
          geom_smooth(method = "lm", se = FALSE, color = "red") +
          labs(x = "Predictor (X)", y = y_axis_label, 
               title = ifelse(input$plotType == "scatterOriginal", "Original Scatter Plot", "Scatter Plot After Log Transform")) +
          theme_minimal()
      } else {
        # Calculate regular residuals instead of standardized residuals
        df_use$fitted <- predict(fit)
        df_use$residuals <- residuals(fit)  # Use residuals instead of rstandard
        
        # Residuals plot
        p <- ggplot(df_use, aes(x = fitted, y = residuals)) +
          geom_point() +
          geom_hline(yintercept = 0, linetype = "dashed", color = "blue") +
          labs(x = "Fitted Values", y = "Residuals", 
               title = ifelse(input$plotType == "residualsBefore", "Residuals vs. Fitted Values (Before Log Transform)", "Residuals vs. Fitted Values (After Log Transform)")) +
          theme_minimal()
      }
      
      ggplotly(p)
    })
    
  
  output$modelStats <- renderPrint({
    set.seed(42)
    n <- 1000  # Number of data points
    x <- runif(n, 1, 10)
    y <- exp(1 + 0.5 * x) * rnorm(n, mean = 1, sd = 0.5)
    
    # Apply log transformation conditionally and handle potential NAs
    df_original <- data.frame(x = x, y = y)
    df_transformed <- data.frame(x = x, y = log(y))
    
    # Ensure NA values are handled properly
    df_transformed <- na.omit(df_transformed)
    
    # Choose the appropriate data frame based on user selection
    df_use <- switch(input$plotType,
                     scatterOriginal = df_original,
                     residualsBefore = df_original,
                     scatterLogTransform = df_transformed,
                     residualsAfter = df_transformed)
    
    # Fit the model to the selected data frame
    fit <- lm(y ~ x, data = df_use)
    
    if(input$plotType %in% c("scatterOriginal", "scatterLogTransform")) {
      # Display the model equation for the scatter plots
      coefs <- coef(fit)
      equation <- ifelse(input$plotType == "scatterLogTransform", 
                         sprintf("Model Equation: log(y) = %.2f + %.2f(x)", coefs[1], coefs[2]),
                         sprintf("Model Equation: y = %.2f + %.2f(x)", coefs[1], coefs[2]))
      cat(equation, "\n")
      
      # Also display R-squared and Residual Standard Error
      summaryStats <- summary(fit)
      cat(sprintf("R-squared: %.2f\n", summaryStats$r.squared))
      cat(sprintf("Residual Standard Error: %.2f\n", summaryStats$sigma))
    } else {
      # If the plot type is for residuals, inform that model statistics are shown only for scatter plots
      cat("Model statistics are displayed only for the scatter plots.")
    }
  })
}

# Run the application
shinyApp(ui, server)
