functions 
{
    vector inv_gamma_delta(vector y, vector theta, real[] x_r, int[] x_i) 
    {
        vector[3] deltas;
        deltas[1] = inv_gamma_cdf(theta[1], exp(y[1]), exp(y[2])) - y[3];
        deltas[2] = inv_gamma_cdf(theta[2], exp(y[1]), exp(y[2])) - (0.98+y[3]);
        deltas[3] = (y[3]+(1-inv_gamma_cdf(theta[2], exp(y[1]), exp(y[2]))))-0.02;
        return deltas;
    }
}

data 
{
    vector[3] y_guess;
    vector[2] theta;
}

transformed data 
{
    vector[3] y;
    real x_r[0];
    int x_i[0];

    y = algebra_solver(inv_gamma_delta, y_guess, theta, x_r, x_i, 1e-10, 0.01, 1e6);
}

generated quantities 
{
    real alpha = exp(y[1]);
    real beta = exp(y[2]);
}

