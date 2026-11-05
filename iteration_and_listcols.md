iteration_and_listcols
================
Emma
2026-11-05

### Why iterate?

you will encounter problems where you need to wrtie the same basic code
a lot

### `for` loops

loops are the easiest place to start: output object, sequence to iterate
over, the loop body, and optionally an input object we might not use
these loops for very long after learning them

### Loop functions

loop process (supply input vector/list, apply function to each element,
save the result to a vector/list) is very common for loops can get a
little tedious and opaque –\> loop functions clean this up. Use map
functions

### map

output = map(input, f) map across input, applying f function to each
element, and spit out output

### map variants

by default, map takes one input and will return a list you can use
specific map variants to help prevent errors and simplify outputs
associated with what kind of output your function produces

### workflow

write single example for fixed inputs abstract example to a function
(embed function in a loop) - can skip depending on how comfortable you
are with map statement re-write using a map statement

### Lists

these provide a way to store collections of arbitrary size and type Can
mix character vectors, numeric vectors, matrices, summaries Data frames
are a special kind of list (each entry is a vector of same length. can
still mix variable classes. printed as a table)

### list columns

lists can contain anything, even another list –\> this can be very
useful in the context of iteration keeping everything in one dataframe
with list columns means there are fewer things to worry about

``` r
library(tidyverse)
```

    ## ── Attaching core tidyverse packages ──────────────────────── tidyverse 2.0.0 ──
    ## ✔ dplyr     1.2.1     ✔ readr     2.2.0
    ## ✔ forcats   1.0.1     ✔ stringr   1.6.0
    ## ✔ ggplot2   4.0.3     ✔ tibble    3.3.1
    ## ✔ lubridate 1.9.5     ✔ tidyr     1.3.2
    ## ✔ purrr     1.2.2     
    ## ── Conflicts ────────────────────────────────────────── tidyverse_conflicts() ──
    ## ✖ dplyr::filter() masks stats::filter()
    ## ✖ dplyr::lag()    masks stats::lag()
    ## ℹ Use the conflicted package (<http://conflicted.r-lib.org/>) to force all conflicts to become errors

``` r
library(rvest)
```

    ## 
    ## Attaching package: 'rvest'
    ## 
    ## The following object is masked from 'package:readr':
    ## 
    ##     guess_encoding

``` r
library(p8105.datasets)
```

``` r
source("source/mean_and_sd.R")
source("source/nsduh_process.R")
```

``` r
set.seed(1236)
```

``` r
knitr::opts_chunk$set(
  fig.width = 6,
  fig.asp = .6,
  out.width = "90%"
)

theme_set(theme_minimal() + theme(legend.position = "bottom"))

options(
  ggplot2.continuous.colour = "viridis",
  ggplot2.continuous.fill = "viridis"
)

scale_colour_discrete = scale_colour_viridis_d
scale_fill_discrete = scale_fill_viridis_d
```

## Lists

Prove that lists can have anything

``` r
l = list(
  vec_numeric = 5:17, 
  mat = matrix(1:8, nrow = 2, ncol = 4, byrow = TRUE), 
  vec_logical = c(TRUE), 
  summary_table = summary(rnorm(1000))
)

l 
```

    ## $vec_numeric
    ##  [1]  5  6  7  8  9 10 11 12 13 14 15 16 17
    ## 
    ## $mat
    ##      [,1] [,2] [,3] [,4]
    ## [1,]    1    2    3    4
    ## [2,]    5    6    7    8
    ## 
    ## $vec_logical
    ## [1] TRUE
    ## 
    ## $summary_table
    ##      Min.   1st Qu.    Median      Mean   3rd Qu.      Max. 
    ## -2.866342 -0.637111 -0.002336  0.003323  0.658024  3.265081

``` r
l[[1]]
```

    ##  [1]  5  6  7  8  9 10 11 12 13 14 15 16 17

``` r
l[[2]]
```

    ##      [,1] [,2] [,3] [,4]
    ## [1,]    1    2    3    4
    ## [2,]    5    6    7    8

``` r
l[["vec_logical"]]
```

    ## [1] TRUE

``` r
l$summary_table #don't do this, shorthand for brackets 
```

    ##      Min.   1st Qu.    Median      Mean   3rd Qu.      Max. 
    ## -2.866342 -0.637111 -0.002336  0.003323  0.658024  3.265081

# `for` loops

``` r
# create input list first 
list_norm = list(
  a = rnorm(20, 3, 4),
  b = rnorm(20, -14, 20),
  c = rnorm(20, 1000, 1000),
  d  = rnorm(20, 0, 1)
) 
```

Can I get mean and sd for each sample? Use function we wrote last time

``` r
mean_and_sd(list_norm[[1]])
```

    ## # A tibble: 1 × 2
    ##    mean    sd
    ##   <dbl> <dbl>
    ## 1  2.94  3.32

``` r
mean_and_sd(list_norm[[2]])
```

    ## # A tibble: 1 × 2
    ##    mean    sd
    ##   <dbl> <dbl>
    ## 1 -9.22  22.7

``` r
mean_and_sd(list_norm[[3]])
```

    ## # A tibble: 1 × 2
    ##    mean    sd
    ##   <dbl> <dbl>
    ## 1 1015.  665.

``` r
mean_and_sd(list_norm[[4]])
```

    ## # A tibble: 1 × 2
    ##      mean    sd
    ##     <dbl> <dbl>
    ## 1 -0.0560  1.09

``` r
# pull out specific item in list, then apply that function 
# already tedious to deal with four of these --> write a for loop! 
```

Doing this better with a for loop:

``` r
#define an empty list for a space for each output I care about, length = 4 because we're working with four variables  
output = vector("list", length = 4) 

for (i in 1:4) { #go through 1, 2, 3, 4, put outputs of function on list norm into new list called output
  
  output[[i]] = mean_and_sd(list_norm[[i]])
  
}

output #empty list you made is now filled with the output from the for loop 
```

    ## [[1]]
    ## # A tibble: 1 × 2
    ##    mean    sd
    ##   <dbl> <dbl>
    ## 1  2.94  3.32
    ## 
    ## [[2]]
    ## # A tibble: 1 × 2
    ##    mean    sd
    ##   <dbl> <dbl>
    ## 1 -9.22  22.7
    ## 
    ## [[3]]
    ## # A tibble: 1 × 2
    ##    mean    sd
    ##   <dbl> <dbl>
    ## 1 1015.  665.
    ## 
    ## [[4]]
    ## # A tibble: 1 × 2
    ##      mean    sd
    ##     <dbl> <dbl>
    ## 1 -0.0560  1.09

## `map` instead
