data 
{
    vector[3] mu;
    matrix[3,3] sigma;
}

generated quantities 
{
    vector[3] normal3d_y = multi_normal_rng(mu, sigma);
}