writing_functions
================
Emma
2026-10-29

If you use the same code more than twice, write a function –\> helps
prevent mistakes

Function takes inputs, does something, and returns a result. Goal is to
abstract some process

- For computations or operations you define and need to repeat, write
  function with arbitrary arguments etc

Consists of:

- arguments (inputs)
  - what goes in to your function, these get used by the code in the
    body (eg. x in mean(x))
  - can take default values, which define a function’s input until a
    user overwrites them (eg. na.rm = FALSE in mean(x))
  - names matter, use reasonable things
  - common names: x, y for vectors. df for data frames. n for number of
    rows/sample size
- body (cody that does stuff)
  - do what you want
  - common structure is:
    - data/input checks using conditional execution
    - perform operations
- return objects (what the function produces)
  - implicit (last value produced) vs. explicit (use return())
  - single value or collection of values
  - named or unnamed

Scoping: how R looks for variables

- global environment is interactive workspace where variables are
  defined –\> usually don’t want your functions using stuff in your
  global environment

Conditional execution

- sometimes you only want to do something if a condition is met –\>
  conidtional
- follows basic logic rules (if, else if)

Writing functions

- start small and avoid unnecessary complexity

``` r
library(tidyverse)
library(rvest)

set.seed(1)
```

## Functions

Start small with Z scores

``` r
x_vec = rnorm(n = 40, mean = 12, sd = 63)

(x_vec - mean(x_vec)) / sd(x_vec)
```

    ##  [1] -0.81031547  0.10332757 -1.04622681  1.69539931  0.26783628 -1.02912882
    ##  [7]  0.44594292  0.72890784  0.54558833 -0.44821175  1.60122683  0.33588377
    ## [13] -0.80443589 -2.60156977  1.16492972 -0.15446587 -0.12204857  0.96068764
    ## [19]  0.82240008  0.56602438  0.93265137  0.77831939 -0.01969307 -2.34741777
    ## [25]  0.59526245 -0.16709195 -0.27949804 -1.76253155 -0.64305566  0.36757360
    ## [31]  1.42855590 -0.21971485  0.33343457 -0.16447124 -1.65686299 -0.57182769
    ## [37] -0.54847663 -0.17068367  1.13684077  0.75693532

Turning it into a function:

``` r
z_scores = function(x) {
  
  z = (x - mean(x)) / sd(x)
  
  return(z)
  
}
```

Inside the function, depend on variable function defines (x in this
case). z only exists inside the function

Does this actually work?

``` r
z_scores(x_vec)
z_scores(rpois(4000, lambda = 12))

z_scores(iris) #doesn't work if you don't plug in numeric vector 
z_scores(c(TRUE, TRUE, FALSE, FALSE)) #this works, converts it to 0s and 1s - update function so this does not work in function 
```

Gives same collection of numbers as first code chunk, this probably
works. Set to false so it won’t break knitting.

``` r
z_scores = function(x) {
  
  if (!is.numeric(x)) {
    stop("Input x must be numeric")
  } else if(length(x) < 5) {
    stop("x should have 5 or more numbers")
  }
  
  z = (x - mean(x)) / sd(x)
  
  return(z)
  
}
```
