---
editor_options:
  markdown:
    wrap: 72
---

# (PART\*) Section 2 {.unnumbered}

# Overview {.unnumbered}

::: {style="color: #333; font-size: 24px; font-style: italic; text-align: justify;"}
Section 2: Linear Regression and Prediction
:::

This section is comprised of two demonstrations and two practicals. The
two practicals will make use of exercises adapted from the core textbook
for this course:

James, G., Witten, D., Hastie, T. and Tibshirani, R. (2021). *An
Introduction to Statistical Learning with Applications in R*. 2nd ed.
New York: Springer. <https://www.statlearning.com/>

::: ilos
**Learning Outcomes:**

-   explain the relevance of the intercept;
-   appreciate the impact of noise on coefficient estimates;
-   produce and interpret diagnostic plots with base R;
-   apply non-linear transformations;
-   compare model fit;
-   compute and interpret confidence intervals.
:::

**In this section, you will practice using the functions below. It is highly recommended that you explore these functions further using the Help tab in your RStudio console.**

+--------------------+--------------------------+--------------------+
| Function           | Description              | Package            |
+:==================:+:========================:+:==================:+
| `lm()`             | fit linear models        | base R             |
+--------------------+--------------------------+--------------------+
| `predict()`        | generic function for     | base R             |
|                    | predictions from results |                    |
|                    | of different models      |                    |
|                    | (e.g. `predict.lm()`)    |                    |
+--------------------+--------------------------+--------------------+
| `confint()`        | compute confidence       | base R             |
|                    | intervals                |                    |
+--------------------+--------------------------+--------------------+
| `plot()`           | generic function for     | base R             |
|                    | plotting                 |                    |
+--------------------+--------------------------+--------------------+
| `legend()`         | add legend (to `plot()`) | base R             |
|                    |                          |                    |
|                    | arguments such as `col`, |                    |
|                    | `lty`, and `cex` control |                    |
|                    | colour, line type, and   |                    |
|                    | font size respectively   |                    |
+--------------------+--------------------------+--------------------+
| `abline()`         | adding one or more       | base R             |
|                    | straight lines to plot   |                    |
+--------------------+--------------------------+--------------------+
| `cor()`            | computes correlation     | base R             |
|                    | between variables        |                    |
+--------------------+--------------------------+--------------------+
| `rnorm()`          | generates normal         | base R             |
|                    | distribution             |                    |
+--------------------+--------------------------+--------------------+
| `poly()`           | returns or evaluates     | base R             |
|                    | polynomials              |                    |
+--------------------+--------------------------+--------------------+
| `par()`            | set graphical parameters | base R             |
+--------------------+--------------------------+--------------------+
| `mfrow()`          | `par()` parameter        | base R             |
+--------------------+--------------------------+--------------------+
| `subset()`         | return subset of a data  | base R             |
|                    | object (vector, matrix,  |                    |
|                    | or dataframe) according  |                    |
|                    | to condition(s)          |                    |
+--------------------+--------------------------+--------------------+
| `anova()`          | compute analysis of      | base R             |
|                    | variance for             |                    |
+--------------------+--------------------------+--------------------+
| `rnorm()`          | density, distribution    | base R             |
|                    | function, quantile       |                    |
|                    | function and random      |                    |
|                    | generation for the       |                    |
|                    | normal distribution      |                    |
+--------------------+--------------------------+--------------------+
| `sqrt()`           | compute square root      | base R             |
+--------------------+--------------------------+--------------------+
