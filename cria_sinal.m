function [s, fs] = cria_sinal(toca)

% sinal original
fs = 44.1e3;  % Hz 
Ts = 1/fs;  % s
f1 = 500;  % Hz
T = 0.5;  % s
N = fs * T;
A = 1;
n = 0:(N-1);
t = n*Ts;  % s

% s = A*sin(2*pi*f1*t);
s_part = A*sin(2*pi*f1*t);
s_base = [s_part zeros(1, 11025)];
s = [s_base s_base s_base s_base s_base s_base];

if toca == 1
    sound(s, fs)
end

end