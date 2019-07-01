function [w, i] = NLMS(x, d, M, w_init, mu_init, step_vez, step_mult, step_div, tol, max_it)

if nargin < 4
    w_init = zeros(M, 1);
end
if nargin < 5
    mu_init = 0.05;
end
if nargin < 6
    step_vez = 2;
end
if nargin < 7
    step_mult = 3;
end
if nargin < 8
    step_div = 2;
end
if nargin < 9
    tol = 1e-6;
end
if nargin < 10
    max_it = length(x);
end

deltinha = 1;
w_i = w_init;
x_i = zeros(M, 1);
mu = mu_init;
for i = 1:max_it
    x_i(end) = [];
    x_i = [x(i);x_i];

    if mod(i,step_mult) == 0 && i <= step_vez*step_mult
        mu = mu/step_div;
    end
    
    d_i = d(i);
    err_i = d_i - w_i'*x_i;
    w_i = w_i + mu*err_i*x_i/(x_i'*x_i + deltinha);
end
w = w_i;

end