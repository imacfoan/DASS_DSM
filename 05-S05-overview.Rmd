---
editor_options: 
  markdown: 
    wrap: 72
---

# (PART\*) Section 5 {.unnumbered}

# Overview {.unnumbered}

::: {style="color: #333; font-size: 24px; font-style: italic; text-align: justify;"}
Section 5: Data Science in Practice
:::

This section is comprised of two practicals and two demonstrations.

The two practicals were adapted from demonstrations created by Dr.
Tatjana Kecojevic, Lecturer in Social Statistics.

Demonstration 1 was developed by Dr. George Wood, Lecturer in Social
Statistics whilst Demonstration 2 was adapted from exercises from the
core textbook for this course (James et. al 2019).

James, G., Witten, D., Hastie, T. and Tibshirani, R. (2021). *An
Introduction to Statistical Learning with Applications in R*. 2nd ed.New
York: Springer. <https://www.statlearning.com/>.

::: ilos
**Learning Outcomes:**

-   create suitable visualisations to describe univariate and bivariate
    data;

-   build simple and multiple linear regression models with quantitative
    and qualitative predictors and interpret the results;

-   assess model fit and evaluate the importance of individual
    predictors;

-   make decisions about the structure of the 'final' model;

-   build logistic regression models and interpret the results;

-   calculate false positive and false negative rates;

-   build and interpret regression and classification trees;

-   apply ensemble methods (bagging, random forests, and boosting) and
    interpret output.
:::

**In this section, you will practice using the functions below. It is
highly recommended that you explore these functions further using the
Help tab in your RStudio console.**

|      Function      |                        Description                        |      Package      |
|:---------------:|:--------------------------:|:--------------------------:|
|      `head()`      |          obtain the first parts of a data object          |       utils       |
|     `attach()`     |               attach data to R search path                |       base        |
|    `glimpse()`     |               obtain a glimpse of the data                | tidyverse (dplyr) |
|    `summary()`     |                  produce summary results                  |       base        |
|    `boxplot()`     |                     produce box plots                     |     graphics      |
|      `plot()`      |                     plot data objects                     |       base        |
|       `lm()`       |                     fit linear model                      |       stats       |
|       `qf()`       |             generation for the F distribution             |       stats       |
|       `qt()`       |             generation for the t distribution             |       stats       |
|   `attributes()`   |                  acces object attributes                  |       base        |
|    `unclass()`     |                   remove clas attribute                   |       base        |
|    `options()`     |                  global options settings                  |       base        |
|   `contrasts()`    |               set/view contrasts of factors               |       stats       |
|     `select()`     |                     keep/drop columns                     | tidyverse (dplyr) |
|    `group_by()`    |        group data according to specific variables         | tidyverse (dplyr) |
|   `summarise()`    |           summarise each group down to one row            | tidyverse (dplyr) |
|    `ggpairs()`     |              ggplot2 generalised pairs plot               |      GGally       |
|     `mutate()`     |             create, modify, delete columns\`              | tidyverse (dplyr) |
|    `read.csv()`    |      read file in table format and create data frame      |       utils       |
|    `read_csv()`    |              read delimited file into tibble              | tidyverse (readr) |
|     `ggplot()`     |                     create new ggplot                     |      ggplot2      |
|     `rename()`     |                      rename columns                       | tidyverse (dplyr) |
|     `filter()`     |             keep rows that match a condition              | tidyverse (dplyr) |
|      `glue()`      |               format and interpolate string               |       glue        |
|   `bind_rows()`    |             bind multiple data frames by row              | tidyverse (dplyr) |
|     `table()`      |                  build contingency table                  |       base        |
|      `glm()`       |               fit generalised linear model                |       stats       |
|      `exp()`       |               compute exponential function                |       base        |
|      `coef()`      |                extract model coefficients                 |       stats       |
|     `count()`      |                    count observations                     | tidyverse (dplyr) |
|     `ifelse()`     |               conditional element selection               |       base        |
|     `sample()`     | take a sample of a given size with or without replacement |       base        |
|    `set.seed()`    |             (pseudo) random number generation             |       base        |
|      `tree()`      |           fit classification or regression tree           |       tree        |
|      `text()`      |                     add text to plot                      |     graphics      |
|    `predict()`     |      obtain predictions from model fitting functions      |       stats       |
|    `cv.tree()`     |       cross-validation for choosing tree complexity       |       tree        |
|      `par()`       |                 set graphical parameters                  |     graphics      |
| `prune.misclass()` |          cost-complexity pruning of tree object           |       tree        |
|  `randomForest()`  |      classification or regression with random forest      |   randomForest    |
|   `varImpPlot()`   |                 variable importance plot                  |   randomForest    |
|   `importance()`   |            extract variable importance measure            |   randomForest    |
|      `mean()`      |                calculated arithmetic mean                 |       base        |
|      `gbm()`       |         fit generalised boosted regression models         |        gbm        |
