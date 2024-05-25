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

This section is comprised of two demonstrations adapted from the core textbook for this course:  

James, G., Witten, D., Hastie, T. and Tibshirani, R. (2021). *An Introduction to Statistical Learning with Applications in R*. 2nd ed. New York: Springer. <https://www.statlearning.com/>

::: ilos
**Learning Outcomes:**

-   appreciate the difference between *classic* modelling and supervised
    learning;

-   compute and plot a correlation matrix;

-   compute and interpret a confusion matrix and overall prediction
    accuracy;

-   apply a variety of classification methods and appreciate their
    advantages and limitations;   
    
-   understand the differences between modelling count data using a linear versus a Poisson model;   
-   interpret the results of a Poisson regression model.
:::

**In this section, you will practice using the functions below. It is
highly recommended that you explore these functions further using the
Help tab in your RStudio console.**

+-------------------+-------------------+-------------------+
| Function          | Description       | Package           |
+:=================:+:=================:+:=================:+
| `str()`           | display structure | base R            |
|                   | of object         |                   |
+-------------------+-------------------+-------------------+
| `cor()`           | compute           | base R            |
|                   | correlation       |                   |
+-------------------+-------------------+-------------------+
| `corrplot()`      | plot correlation  | corrplot          |
|                   | matrix            |                   |
|                   |                   |                   |
|                   | arguments such as |                   |
|                   | `type` and `diag` |                   |
|                   | control the       |                   |
|                   | structure of the  |                   |
|                   | plot              |                   |
+-------------------+-------------------+-------------------+
| `glm()`           | fit a generalised | base R            |
|                   | linear model      |                   |
|                   |                   |                   |
|                   | arguments such as |                   |
|                   | `family` control  |                   |
|                   | the distribution  |                   |
+-------------------+-------------------+-------------------+
| `predict()`       | generic function  | base R            |
|                   | for predictions   |                   |
|                   | from results of   |                   |
|                   | models            |                   |
|                   |                   |                   |
|                   | arguments such as |                   |
|                   | `type` specify    |                   |
|                   | the type of       |                   |
|                   | predictions       |                   |
|                   | required          |                   |
+-------------------+-------------------+-------------------+
| `diag()`          | extract/replace   | base R            |
|                   | diagonal of a     |                   |
|                   | matrix            |                   |
+-------------------+-------------------+-------------------+
| `sum()`           | compute the sum   | base R            |
|                   | of values         |                   |
+-------------------+-------------------+-------------------+
| `lda()`           | perform LDA       | MASS              |
+-------------------+-------------------+-------------------+
| `table()`         | build contingency | base R            |
|                   | table             |                   |
+-------------------+-------------------+-------------------+
| `qda()`           | perform QDA       | MASS              |
+-------------------+-------------------+-------------------+
| `knn()`           | perform KNN       | class             |
|                   | classification    |                   |
|                   |                   |                   |
|                   | arguments such as |                   |
|                   | `k` control       |                   |
|                   | number of         |                   |
|                   | neighbours        |                   |
+-------------------+-------------------+-------------------+
| `naiveBayes()`    | apply the Naive   | e1071             |
|                   | Bayes classifier  |                   |
+-------------------+-------------------+-------------------+
