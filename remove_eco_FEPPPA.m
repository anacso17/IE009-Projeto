
clear all
close all

M = 4; L = 14700;

[x, fs] = audioread('ref.wav');
[d, fs] = audioread(['L=',L,'.wav']);

Rx = calcula_autocorr_mat(d, M);
rx = calcula_rx_pa(d, L, M);
a_pu = Rx\rx;
w = [1; zeros(L-1, 1); -a_pu];

y = conv(d, w);
figure(1);
subplot(2, 1, 1); plot(x)
subplot(2, 1, 2); plot(y)
sound(y, fs)