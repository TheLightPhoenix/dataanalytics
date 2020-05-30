data 
{
    real alpha;
    real beta;
}

generated quantities 
{
    real gamma_y = gamma_rng(alpha, beta);
    real invgamma_y = inv_gamma_rng(alpha, beta);
}