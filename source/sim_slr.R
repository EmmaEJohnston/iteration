sim_slr = function(n_obs) {
  
  sim_data = 
    tibble(
      x = rnorm(n_obs, mean = 1, sd = 1), 
      y = 2 + 3 * x + rnorm(n_obs, mean = 0, sd = 1)
    ) #create data generating mechanism 
  
  fit = lm(y ~ x, data = sim_data) #run analysis
  
  return_df = 
    tibble(
      beta0_hat = coef(fit)[1],
      beta1_hat = coef(fit)[2]
    ) #pull out what you care about
  
  return(return_df)
}
