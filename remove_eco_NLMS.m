function remove_eco_NLMS
% clear all
% close all
L = 14700;
[x, fs] = audioread('ref.wav');
[d, fs] = audioread(['L=',int2str(L),'.wav']);
w_o = [1 zeros(1, L) 0.2 zeros(1, L) 0.05 zeros(1, L) 0.02];
M = L*3+4;
init = zeros(M, 1);
mu = 0.01;
step_vez = 4;
step_mult = 5000;
step_div = 2;

% args: (x, d, M, w_init, mu_init, step_vez, step_mult, step_div, tol, max_it
[w, i] = NLMS(x, d, M, init, mu, step_vez, step_mult, step_div);

y = conv(x, w);
figure(2);
subplot(3, 1, 1); plot(d); title('Sinal com eco - Original')
xlim([0 5e4]); ylim([-1 1]);
subplot(3, 1, 2); plot(y); title('Sinal com eco - Estimativa')
xlim([0 5e4]);
subplot(3, 1, 3); plot(d-y(1:length(d))); title('Erro')
xlim([0 5e4]); ylim([-1 1]);

e = filter(1, w, d);
figure(3);
subplot(3, 1, 1); plot(x); title('Sinal sem eco - Original')
xlim([0 5e4]); ylim([-1 1]);
subplot(3, 1, 2); plot(e); title('Sinal sem eco - Estimativa')
xlim([0 5e4]);
subplot(3, 1, 3); plot(d-y(1:length(d))); title('Erro')
sound(e, fs)