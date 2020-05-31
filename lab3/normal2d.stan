data 
{
    vector[2] mu;
    matrix[2,2] sigma;
}

generated quantities 
{
    vector[2] normal2d_y = multi_normal_rng(mu, sigma);
}