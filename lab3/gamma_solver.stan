functions 
{
    vector gamma_delta(vector y, vector theta, real[] x_r, int[] x_i) 
    {
        vector[3] deltas;
        deltas[1] = gamma_cdf(theta[2], exp(y[1]), exp(y[2])) - gamma_cdf(theta[1], exp(y[1]), exp(y[2])) - 0.98;
        deltas[2] = gamma_cdf(theta[2], exp(y[1]), exp(y[2])) - gamma_cdf(theta[1], exp(y[1]), exp(y[2])) - 0.98;
        deltas[3] = exp(y[1])/exp(y[2]) - 7.5;
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

    y = algebra_solver(gamma_delta, y_guess, theta, x_r, x_i, 1e-10, 1e-1, 1e4);
}

generated quantities 
{
    real gamma_y = gamma_rng(exp(y[1]), exp(y[2]));
    real alpha = exp(y[1]);
    real beta = exp(y[2]);
}

