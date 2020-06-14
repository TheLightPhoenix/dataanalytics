data {
  int M;//number of years analyzed
  vector[M] miles; //number of miles flown each year
  int y[M];//number of deaths
}
parameters {
  real<lower=0>theta;
}
model {
  theta ~ normal(0,3.179);
  for (k in 1:M) {
    y[k] ~ poisson(miles[k]*theta);
  }
}
generated quantities {
  int y_sim[M];
  for (k in 1:M) {
    y_sim[k] = poisson_rng(miles[k]*theta);
  }
}