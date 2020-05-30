data 
{
    real alpha;
    real beta;
}

generated quantities 
{
    real neg_bi_y = neg_binomial_rng(alpha, beta);
    real poisson_y = poisson_rng(alpha/beta);
}