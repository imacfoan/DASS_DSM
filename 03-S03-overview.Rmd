---
editor_options: 
  markdown: 
    wrap: 72
---

# (PART\*) Section 3 {.unnumbered}

# Overview {.unnumbered}

::: {style="color: #333; font-size: 24px; font-style: italic; text-align: justify;"}
Section 3: Classification
:::

This section is comprised of two demonstrations and one practical.

The two demonstrations are adapted from the core textbook for this
course:

James, G., Witten, D., Hastie, T. and Tibshirani, R. (2021). *An
Introduction to Statistical Learning with Applications in R*. 2nd ed.
New York: Springer. <https://www.statlearning.com/>

The practical is adapted from a demonstration developed by Dr. Tatjana
Kecojevic, Lecturer in Social Statistics.

::: ilos
**Learning Outcomes:**

-   appreciate the difference between *classic* modelling and supervised
    learning;

-   compute and plot a correlation matrix;

-   compute and interpret a confusion matrix and overall prediction
    accuracy;

-   apply a variety of classification methods and appreciate their
    advantages and limitations;

-   understand the differences between modelling count data using a
    linear versus a Poisson model;

-   interpret the results of a Poisson regression model.
:::

**In this section, you will practice using the functions below. It is
highly recommended that you explore these functions further using the
Help tab in your RStudio console.**

+-----------------+--------------------------------+-----------------+
| Function        | Description                    | Package         |
+:===============:+:==============================:+:===============:+
| `str()`         | display structure of object    | utils           |
+-----------------+--------------------------------+-----------------+
| `head()`        | return first part of a data    | utils           |
|                 | object                         |                 |
+-----------------+--------------------------------+-----------------+
| `attach()`      | attach database to R search    | base            |
|                 | path (access simplified to     |                 |
|                 | providing names without        |                 |
|                 | indexing)                      |                 |
+-----------------+--------------------------------+-----------------+
| `contrasts()`   | set/view contrasts of factor   | stats           |
+-----------------+--------------------------------+-----------------+
| `contr.sum()`   | return matrix of contrasts     | stats           |
+-----------------+--------------------------------+-----------------+
| `summary()`     | produce summary results of     | base            |
|                 | models                         |                 |
+-----------------+--------------------------------+-----------------+
| `lm()`          | fit linear models              | stats           |
+-----------------+--------------------------------+-----------------+
| `coef()`        | extract model coefficients     | stats           |
+-----------------+--------------------------------+-----------------+
| `plot()`        | plotting objects               | base            |
+-----------------+--------------------------------+-----------------+
| `axis()`        | add axis to current plot       | graphics        |
|                 | (accompanies `plot()`)         |                 |
+-----------------+--------------------------------+-----------------+
| `abline()`      | add one or more straight lines | graphics        |
|                 | to plot (accompanies `plot()`) |                 |
+-----------------+--------------------------------+-----------------+
| `cor()`         | compute correlation            | stats           |
+-----------------+--------------------------------+-----------------+
| `corrplot()`    | plot correlation matrix        | corrplot        |
|                 |                                |                 |
|                 | arguments such as `type` and   |                 |
|                 | `diag` control the structure   |                 |
|                 | of the plot                    |                 |
+-----------------+--------------------------------+-----------------+
| `glm()`         | fit a generalised linear model | stats           |
|                 |                                |                 |
|                 | arguments such as `family`     |                 |
|                 | control the distribution       |                 |
+-----------------+--------------------------------+-----------------+
| `predict()`     | generic function for           | stats           |
|                 | predictions from results of    |                 |
|                 | models                         |                 |
|                 |                                |                 |
|                 | arguments such as `type`       |                 |
|                 | specify the type of            |                 |
|                 | predictions required           |                 |
+-----------------+--------------------------------+-----------------+
| `diag()`        | extract/replace diagonal of a  | base            |
|                 | matrix                         |                 |
+-----------------+--------------------------------+-----------------+
| `sum()`         | compute the sum of values      | base            |
+-----------------+--------------------------------+-----------------+
| `lda()`         | perform LDA                    | MASS            |
+-----------------+--------------------------------+-----------------+
| `table()`       | build contingency table        | base            |
+-----------------+--------------------------------+-----------------+
| `qda()`         | perform QDA                    | MASS            |
+-----------------+--------------------------------+-----------------+
| `knn()`         | perform KNN classification     | class           |
|                 |                                |                 |
|                 | arguments such as `k` control  |                 |
|                 | number of neighbours           |                 |
+-----------------+--------------------------------+-----------------+
| `naiveBayes()`  | apply the Naive Bayes          | e1071           |
|                 | classifier                     |                 |
+-----------------+--------------------------------+-----------------+
