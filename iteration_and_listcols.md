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
set.seed(1)
```
