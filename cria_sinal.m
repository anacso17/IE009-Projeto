function [s, fs, f1] = cria_sinal(toca)

if nargin < 1
    toca = 1;
end

% sinal original
fs = 44.1e3;  % Hz 
Ts = 1/fs;  % s
f1 = fs/100;  % Hz
spt = (1/f1)*fs;
T = 1/3;  % s
N = fs * T;
A = 1;
n = 0:(N-1);
t = n*Ts;  % s

% s = A*sin(2*pi*f1*t);
s_part = A*sin(2*pi*f1*t);
s_base = [s_part zeros(1, 2*T*fs)];
s = [s_base s_base s_base s_base];
% s = s_base;

% fs = 44.1e3;
% T = 2; 
% Ts = 1/fs;
% t = 0:Ts:T;
% f0 = 200; % Hz
% f1 = 800; % Hz
% fs = 1/Ts;
% k = (f1-f0)/T;
% s = sin(2*pi*(f0*t+(k*t.^2)/2));

if toca == 1
    sound(s, fs)
end

end