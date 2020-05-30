data 
{
    real nu;
    real mu;
    real sigma;
}

generated quantities 
{
    real studentt_y = student_t_rng(nu, mu, sigma);
    real poisson_y = poisson_rng(mu);
}