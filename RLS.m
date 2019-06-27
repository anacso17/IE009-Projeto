function [w, i] = RLS(x, d, M, w_init, delta, lambda, tol, max_it)

if nargin < 4
    w_init = zeros(M, 1);
end
if nargin < 5
    delta = 10;
end
if nargin < 6
    lambda = 1;
end
if nargin < 7
    tol = 1e-6;
end
if nargin < 8
    max_it = length(x);
end

if M == 2
    figure(7);
    title('Iterações do algoritmo RLS')
    hold on
    
    Rx = calcula_autocorr_mat(x, M);
    pxd = calcula_pxd(x, d, M);
    wo = Rx\pxd;
    Jwo = var(x) - 2*wo'*pxd + wo'*Rx*wo;
    J = []; k = 1;
    for deltaw0 = linspace(-0.5, 0.5, 100)
        l = 1;
        for deltaw1 = linspace(-0.5, 0.5, 100)
            J(k,l) = Jwo + [deltaw0 deltaw1]*Rx*[deltaw0; deltaw1];
            l = l+1;
        end
        k = k+1;
    end 
    w0 = linspace(wo(1)-0.3, wo(1)+0.3, 100);
    w1 = linspace(wo(2)-0.3, wo(2)+0.3, 100);
    contour(w0, w1, J, 20)
    hold off
end

w_i = w_init;
x_i = zeros(M, 1);
P_i = eye(M)/delta;
J_hist = [];
w1_hist = [w_i(1)];
w2_hist = [w_i(2)];
for i = 1:max_it
    x_i(end) = [];
    x_i = [x(i);x_i];

    d_i = d(i);
    err_i = d_i - w_i'*x_i;
    g_i = (P_i*x_i)/(lambda + x_i'*P_i*x_i);
    P_i = P_i/lambda - g_i*x_i'*P_i/lambda;
    w_i_plus = w_i + g_i*err_i;
    
    if M == 2
        figure(7);
        hold on
        plot(w_i(1), w_i(2), '.b')
        plot([w_i(1) w_i_plus(1)], [w_i(2) w_i_plus(2)], '-k')
        plot(w_i_plus(1), w_i_plus(2), '.r')
        hold off
    end
        
    w_i = w_i_plus;
    w1_hist = [w1_hist w_i(1)];
    w2_hist = [w2_hist w_i(2)];

    J = err_i^2;
    J_hist = [J_hist J];
    if J < tol
        break
    end
end
w = w_i;

if M == 2
    figure(7);
    hold on
    plot(w(1), w(2), 'or')
    hold off
end

figure(8);
plot(J_hist)
xlim([1 i])
title('Evolução do erro quadrático instantêneo - RLS')
grid on

figure(9)
hold on
plot(w1_hist, '-b')
plot(w2_hist, '-r')
xlim([1 i])
title('Evolução dos coeficientes do filtro - RLS')
grid on

end