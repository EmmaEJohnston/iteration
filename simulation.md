simulation
================
Emma
2026-11-10

## Repeated sampling

repeatedly draw random samples of the same size from a population.
compute the mean for each sample –\> distribution of sample means
converges to a normal distribution

We simulate this on a computer

Basic idea of simulations is to generate repeated samples under a
process you design –\> check things are working the way they are
supposed to

- define a data generating mechanism (eg. normal distribution)
- draw a random sample from that data generating mechanism
- analyze the sample (eg. compute sample mean)
- repeat
- understand the analysis approach under repeated sampling

Simulations are natural in the context of iteration

write a function to

- define data generating mechanism
- draw a sample
- analyze the sample
- return object of interest
- use a loop to analyze this many times

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
set.seed(1)
```
