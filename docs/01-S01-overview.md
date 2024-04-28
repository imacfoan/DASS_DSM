---
editor_options:
  markdown:
    wrap: 72
---

# (PART\*) Section 1 {.unnumbered}

# Overview {.unnumbered}

::: {style="color: #333; font-size: 24px; font-style: italic; text-align: justify;"}
Section 1: Introduction to Data Science - The Basics of Statistical
Learning
:::

This section is comprised of a demonstration and two practicals. The two practicals will make use of exercises  adapted from the core textbook for this course:

James, G., Witten, D., Hastie, T. and Tibshirani, R. (2021). *An
Introduction to Statistical Learning with Applications in R*. 2nd ed.
New York: Springer. <https://www.statlearning.com/>

::: ilos
**Learning Outcomes:**

-   appreciate the importance of the mean squared error;   
-   indexing using base R;
-   creating scatterplot matrices;
-   creating new variables;
-   transforming existing variables;
-   using functionals;
-   'calling' on masked functions from specific packages;
-   translating base R code to `tidyverse` and vice versa.
:::

**In this section, you will practice using the functions below. It is highly recommended that you explore these functions further using the Help tab in your RStudio console. You can access the R documentation in the Help tab using? (e.g. `?read.csv`)**

+--------------------+--------------------+--------------------+
| Function           | Description        | Package            |
+:==================:+:==================:+:==================:+
| `read.csv()`       | read csv files     | base R             |
+--------------------+--------------------+--------------------+
| `read_csv()`       | read csv files     | tidyverse          |
+--------------------+--------------------+--------------------+
| `co l              | convert column to  | tidyverse          |
| umn_to_rownames()` | row names          |                    |
+--------------------+--------------------+--------------------+
| `rownames()`       | obtain names of    | base R             |
|                    | rows               |                    |
+--------------------+--------------------+--------------------+
| `summary()`        | obtain summary     | base R             |
|                    | statistics         |                    |
+--------------------+--------------------+--------------------+
| `summarise()`      | object summaries   | tidyverse (dplyr)  |
+--------------------+--------------------+--------------------+
| `group_by()`       | group by one or    | tidyverse (dplyr)  |
|                    | more variables     |                    |
+--------------------+--------------------+--------------------+
| `pairs()`          | produce a matrix   | base R             |
|                    | of scatterplots    |                    |
+--------------------+--------------------+--------------------+
| `plot()`           | create a plot      | base R             |
+--------------------+--------------------+--------------------+
| `ggplot()`         | generic function   | tidyverse          |
|                    | for creating a     | (ggplot2)          |
|                    | plot               |                    |
+--------------------+--------------------+--------------------+
| `mutate()`         | create, modify,    | tidyverse (dplyr)  |
|                    | and delete columns |                    |
+--------------------+--------------------+--------------------+
| `if_else()`        | condition-based    | tidyverse (dplyr)  |
|                    | function           |                    |
+--------------------+--------------------+--------------------+
| `as_factor()`      | create factor      | tidyverse          |
|                    | using existing     | (forcats)          |
|                    | levels             |                    |
+--------------------+--------------------+--------------------+
| `par()`            | set graphical      | base R             |
|                    | parameters         |                    |
+--------------------+--------------------+--------------------+
| `mfrow()`          | `par()` parameter  | base R             |
+--------------------+--------------------+--------------------+
| `slice_min()` and  | index rows by      | tidyverse (dplyr)  |
| `slice_max()`      | location (smallest |                    |
|                    | and largest values |                    |
|                    | of a variable      |                    |
|                    | respectively)      |                    |
+--------------------+--------------------+--------------------+
| `sapply()`         | applying a         | base R             |
|                    | function over list |                    |
|                    | or vector          |                    |
+--------------------+--------------------+--------------------+
| `select()`         | keep or drop       | tidyverse (dplyr)  |
|                    | columns            |                    |
|                    |                    | *note that this    |
|                    |                    | function is also   |
|                    |                    | available through  |
|                    |                    | the MASS package   |
|                    |                    | (we will not cover |
|                    |                    | this in this       |
|                    |                    | section)*          |
+--------------------+--------------------+--------------------+
| `pivot_longer()`   | lengthen data      | tidyverse (tidyr)  |
+--------------------+--------------------+--------------------+
| `where()`          | selection helper   | tidyverse          |
+--------------------+--------------------+--------------------+
| `median()`,        | median, mean,      | base R             |
| `mean()`, `sd()`   | standard deviation |                    |
+--------------------+--------------------+--------------------+
