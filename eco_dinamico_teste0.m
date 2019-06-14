
close all
clear all
clc

% sinal original
fs = 44.1e3;  % Hz
Ts = 1/fs;  % s
f1 = 500;  % Hz
T = 0.5;  % s
N = fs * T;
A = 1;
n = 0:(N-1);
t = n*Ts;  % s
s = A*sin(2*pi*f1*t);

K = 6

for i = 1:K
    
    h_din {i} = [ 1  zeros(1, randi([1000 10000])) rand(1) zeros(1, randi([1000 10000])) rand(1) zeros(1, randi([1000 10000])) rand(1) zeros(1, randi([1000 10000])) rand(1)];
    %obs: primeiro h fixo, os demais podem ser incrementado/decrementados com o
    %valor de cada i e/ou com auxílio de um contador extra
    % calcular alguns tempos (para ecos) que sejam interessantes
end

y = [ conv(h_din(1), s) conv(h_din(2), s) conv(h_din(3), s) conv(h_din(4), s) conv(h_din(5), s) conv(h_din(6), s)];

%obs: ver comprimento do primeiro (sinal +espaço) e fazer
%sobreposição, quando vetor seguinte for menor ou maio completar com
%zeros e somar as partes que se sobrepõem

sound(y, fs)
plot(y)
