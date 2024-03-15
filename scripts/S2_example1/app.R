# Server logic
server <- function(input, output) {
  
  output$regressionPlot <- renderPlot({
    ggplot(data, aes(x=screen_time, y=sleep_duration)) +
      geom_point(alpha = 0.5) + # Slightly transparent points to handle overplotting
      geom_abline(slope = input$slope, intercept = input$intercept, col="blue", size = 1) + # User-defined line
      geom_abline(slope = best_fit_slope, intercept = best_fit_intercept, col="red", size = 1) + # Best fit line
      labs(x="Average Daily Hours of Screen Time", y="Sleep Duration in Hours", title="Screen Time vs. Sleep Duration")
  })
  
  output$regressionEq <- renderText({
    eq <- paste("Sleep Duration = ", input$intercept, " + ", input$slope, "* Screen Time")
    paste("**User-adjusted Equation**: ", eq)
  })
  
  output$bestFitEq <- renderText({
    eq <- paste("Sleep Duration = ", round(best_fit_intercept, 2), " + ", round(best_fit_slope, 2), "* Screen Time")
    paste("**Statistically Derived Best Fit (Least Squares) Equation**: ", eq)
  })
}

