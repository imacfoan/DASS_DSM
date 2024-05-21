---
editor_options: 
  markdown: 
    wrap: 72
---

# (PART\*) Section 4 {.unnumbered}

# Overview {.unnumbered}

::: {style="color: #333; font-size: 24px; font-style: italic; text-align: justify;"}
Section 4: Resampling Methods
:::

This section is comprised two demonstrations adapted from the core
textbook for this course:

James, G., Witten, D., Hastie, T. and Tibshirani, R. (2021). *An Introduction to Statistical Learning with Applications in R*. 2nd ed.New York: Springer. <https://www.statlearning.com/>

::: ilos
**Learning Outcomes:**

-   appreciate the importance of resampling methods in gauging model
    accuracy and performance;\
-   appreciate the differences between cross-validation and
    bootstrapping;\
-   apply cross-validation and bootstrapping in R and interpret the
    output.
:::

**In this section, you will practice using the functions below. It is highly recommended that you explore these functions further using the Help tab in your RStudio console.**

|  Function  |                               Description                                | Package |
|:----------------------:|:----------------------:|:----------------------:|
| `sample()` |            obtain a random sample with or without replacement            | base R  |
|   `lm()`   |                             fit linear model                             | base R  |
|  `mean()`  |                       compute the arithmetic mean                        | base R  |
|  `poly()`  |                            apply polynomials                             | base R  |
|  `glm()`   |                       fit generalised linear model                       | base R  |
| `cv.glm()` | calculate estimates for LOOCV (default) or K-fold CV (by specifying `K`) |  boot   |
|  `boot()`  |                       generate bootstrap estimates                       |  boot   |
