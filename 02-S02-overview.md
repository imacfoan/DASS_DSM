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

This section is comprised of two demonstrations and three practicals.

The two demonstrations and Practicals 1 and 2 are adapted from exercises
from the core textbook for this course: James, G., Witten, D., Hastie,
T. and Tibshirani, R. (2021). *An Introduction to Statistical Learning
with Applications in R*. 2nd ed. New York: Springer.
<https://www.statlearning.com/>

Practical 3 is based on a demonstration developed by Dr. Tatjana
Kecojevic, Lecturer in Social Statistics.

::: ilos
**Learning Outcomes:**

-   explain the relevance of the intercept;\
-   appreciate the impact of noise on coefficient estimates;\
-   produce and interpret diagnostic plots with base R;\
-   include non-linear transformations and interactions;\
-   compare model fit;\
-   compute and interpret confidence intervals.\
:::

**In this section, you will practice using the functions below. It is
highly recommended that you explore these functions further using the
Help tab in your RStudio console.**

+-------------+-------------------------------------------+----------+
| Function    | Description                               | Package  |
+:===========:+:=========================================:+:========:+
| `lm()`      | fit linear models                         | stats    |
+-------------+-------------------------------------------+----------+
| `predict()` | generic function for predictions from     | stats    |
|             | results of different models (e.g.         |          |
|             | `predict.lm()`)                           |          |
+-------------+-------------------------------------------+----------+
| `confint()` | compute confidence intervals              | stats    |
+-------------+-------------------------------------------+----------+
| `plot()`    | generic function for plotting             | base     |
+-------------+-------------------------------------------+----------+
| `legend()`  | add legend (to `plot()`)                  | graphics |
|             |                                           |          |
|             | arguments such as `col`, `lty`, and `cex` |          |
|             | control colour, line type, and font size  |          |
|             | respectively                              |          |
+-------------+-------------------------------------------+----------+
| `abline()`  | adding one or more straight lines to plot | graphics |
+-------------+-------------------------------------------+----------+
| `cor()`     | computes correlation between variables    | stats    |
+-------------+-------------------------------------------+----------+
| `rnorm()`   | generates normal distribution             | stats    |
+-------------+-------------------------------------------+----------+
| `poly()`    | returns or evaluates polynomials          | stats    |
+-------------+-------------------------------------------+----------+
| `par()`     | set graphical parameters (e.g. `mfrow()`  | graphics |
|             | )                                         |          |
+-------------+-------------------------------------------+----------+
| `subset()`  | return subset of a data object (vector,   | base     |
|             | matrix, or dataframe) according to        |          |
|             | condition(s)                              |          |
+-------------+-------------------------------------------+----------+
| `anova()`   | compute analysis of variance for          | stats    |
+-------------+-------------------------------------------+----------+
| `rnorm()`   | density, distribution function, quantile  | stats    |
|             | function and random generation for the    |          |
|             | normal distribution                       |          |
+-------------+-------------------------------------------+----------+
| `sqrt()`    | compute square root                       | base     |
+-------------+-------------------------------------------+----------+
