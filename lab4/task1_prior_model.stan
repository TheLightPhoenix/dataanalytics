data {
  int M;//number of years analyzed
}


generated quantities {
  real lambda=fabs(normal_rng(0,18169));
  int y_sim[M];
  for (k in 1:M) {
    y_sim[k] = poisson_rng(lambda);
  }
}
