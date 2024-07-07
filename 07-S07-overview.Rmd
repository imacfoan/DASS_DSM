---
editor_options: 
  markdown: 
    wrap: 72
---

# (PART\*) Section 7 {.unnumbered}

# Overview {.unnumbered}

::: {style="color: #333; font-size: 24px; font-style: italic; text-align: justify;"}
Section 7: Unsupervised Learning
:::

This section is comprised two demonstrations (accompanied by tasks at
the end of each) developed by Dr. George Wood, Lecturer in Social
Statistics.

::: ilos
**Learning Outcomes:**

-   preprocess the data for k-means clustering;
-   perform k-means clustering in R and interpret the results;
-   evaluate k-means clustering performance;
-   visualise clusters;
-   decide number of clusters;
-   perform PCA analysis and interpret the results;
-   plot principal components;
-   compute correlation between observed y and fitted y;
-   compute cumulative variance explained
-   compute percentage of variance explained by each principal
    component;
:::

**In this section, you will practice using the functions below. It is
highly recommended that you explore these functions further using the
Help tab in your RStudio console.**

|                    Function                    |                                              Description                                              |    Package     |
|:----------------------------------------------:|:-----------------------------------------------------------------------------------------------------:|:--------------:|
|                   `kmeans()`                   |                              perform k-means clustering on a data matrix                              | base R (stats) |
|                `fviz_cluster()`                |                                     visualise clustering results                                      |   factoextra   |
|                  `map_dbl()`                   |                             apply a function to each element of a vector                              |     purrr      |
|                `fviz_nbclust()`                |                      determining and visualising the optimal number of clusters                       |   factoextra   |
|                    `head()`                    |               returns the first part of a vector, matrix, table, data frame or function               | base R (utils) |
|                  `glimpse()`                   |                                     obtain a glimpse of your data                                     |     dplyr      |
|                   `gglot()`                    |                                          create a new ggplot                                          |    ggplot2     |
|                 `geom_point()`                 |                                          create scatterplot                                           |    ggplot2     |
|            `scale_color_discrete()`            |                                      use a discrete colour scale                                      |    ggplot2     |
| `scale_x_continuous()`, `scale_y_continuous()` |                                  position scales for continuous data                                  |    ggplot2     |
|         `geom_hline()`, `geom_vline()`         |                            add horizontal or vertical lines, respectively                             |    ggplot2     |
|                 `geom_text()`                  |                                  adding text geoms (labelling plots)                                  |    ggplot2     |
|                 `facet_wrap()`                 |                                 wrap a 1D sequence of panels into 2D                                  |    ggplot2     |
|                `coord_equal()`                 |                                     fixed scale coordinate system                                     |    ggplot2     |
|                `geom_smooth()`                 |                          smoothed conditional means (addressed overplotting)                          |    ggplot2     |
|                   `theme()`                    |                                      modify components of themes                                      |    ggplot2     |
|                  `drop_na()`                   |                                  drop rows containing missing values                                  |     tidyr      |
|                   `select()`                   |                                 keep or drop columns by name and type                                 |     dplyr      |
|                   `mutate()`                   |                                    create, modify, delete columns                                     |     dplyr      |
|                   `table()`                    |                                      build a contingency table                                        |     base R     |
|            `rownames(), colnames()`            |                     retrieve or set row or column names of a matrix-like object.                      |     base R     |
|                `clean_names()`                 |                              clean names of object (usually data.frame)                               |    janitor     |
|                   `scale()`                    |                               scaling and centering matrix-like objects                               |     base R     |
|                `pivot_longer()`                |                                     pivot data from wide to long                                      |     tidyr      |
|                    `PCA()`                     | computation of weighted or unweighted principal component analysis of a matrix of interval-scale data |    easyCODA    |
|                  `summary()`                   |                                       produce result summaries                                        |     base R     |
|                     `lm()`                     |                                           fit linear models                                           |     stats      |
|                    `cor()`                     |                                      compute correlation matrix                                       |     stats      |
|                     `t()`                      |                                           matrix transpose                                            |      base      |
|                   `round()`                    |                                             round numbers                                             |      base      |
