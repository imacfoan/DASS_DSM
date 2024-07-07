---
editor_options: 
  markdown: 
    wrap: 72
---

# (PART\*) Section 6 {.unnumbered}

# Overview {.unnumbered}

::: {style="color: #333; font-size: 24px; font-style: italic; text-align: justify;"}
Section 6: Linear Model Selection and Regularisation
:::

This section is comprised of four demonstrations using tasks, exercises,
and examples from the core textbook for this course:

James, G., Witten, D., Hastie, T. and Tibshirani, R. (2021). *An
Introduction to Statistical Learning with Applications in R*. 2nd ed.New
York: Springer. <https://www.statlearning.com/>.

::: ilos
**Learning Outcomes:**

-   perform subset and stepwise selection and interpret the results;

-   perform ridge regression and lasso and interpret the results;

-   perform PCR and PLS and interpret the results;

-   appreciate the differences between subset selection, regularisation,
    and dimension reduction techniques;

-   address non-linearity using different approaches (polynomials, step
    functions, splines, local regression, and GAMs).
:::

**In this section, we will cover the following functions:**

|                                          Function                                          |                                          Description                                          |      Package      |
|:----------------------:|:----------------------:|:----------------------:|
|                                       `regsubsets()`                                       | Model selection by exhaustive search, forward or backward stepwise, or sequential replacement |       leaps       |
|                                        `summary()`                                         |                                   produce result summaries                                    |       base        |
| `plot()` and associated plot functions (`points(), lines(), matlines(), title(), legend` ) |                                 create plot and add features                                  | base and graphics |
|                                `which.max()`, `which.min()`                                |                               index of minimum or maximum value                               |       base        |
|                                          `coef()`                                          |                                  extract model coefficients                                   |       stats       |
|                                         `sample()`                                         |                           take a sample with or without repalcement                           |       base        |
|                                          `rep()`                                           |                             replicate elements of vectors, lists                              |       base        |
|                                         `matrix()`                                         |                                         create matrix                                         |       base        |
|                                        `na.omit()`                                         |                                     handle missing values                                     |       stats       |
|                                      `model.matrix()`                                      |                                         create matrix                                         |       stats       |
|                                          `seq()`                                           |                                       generate sequence                                       |       base        |
|                                         `glmnet()`                                         |                             fit glm with lasso or regularisation                              |      glmnet       |
|                                        `predict()`                                         |                                   obtain model predictions                                    |       stats       |
|                                          `mean()`                                          |                                   calculate arithmetic mean                                   |       base        |
|                                       `cv.glmnet()`                                        |                                  cross-validation for glmnet                                  |      glmnet       |
|                                          `pcr()`                                           |                                principal components regression                                |        pls        |
|                                     `validationplot()`                                     |                                    create validation plot                                     |        pls        |
|                                          `plsr()`                                          |                               partial least squares regression                                |        pls        |
|                                          `poly()`                                          |                                compute orthogonal polynomials                                 |       stats       |
|                                           `I()`                                            |                                     treat object "as is"                                      |       base        |
|                                         `cbind()`                                          |                              combine objects by rows or columns                               |       base        |
|                                          `glm()`                                           |                                 fit generalised linear models                                 |       stats       |
|                                         `anova()`                                          |                        compute analysis or variance or deviance tables                        |       stats       |
|                                          `exp()`                                           |                                 compute exponential function                                  |       base        |
|                                         `table()`                                          |                                   create contingency table                                    |       base        |
|                                          `cut()`                                           |                                   convert numeric to factor                                   |       base        |
|                                           `bs()`                                           |                                   generate B-splines matrix                                   |      splines      |
|                                         `loess()`                                          |                              local polynomial regression fitting                              |       stats       |
|                                          `gam()`                                           |                                fit generalised additive models                                |        gam        |
|                                           `s()`                                            |                         specify smoothing spline fit in a GAM formula                         |        gam        |
|                                           `lo()`                                           |                              specify loess fit in a GAM formula                               |        gam        |
