data 
{
    real mu;
    real phi;
}

generated quantities 
{
    real neg_bi_y = neg_binomial_2_rng(mu, phi);
    real poisson_y = poisson_rng(mu);
}