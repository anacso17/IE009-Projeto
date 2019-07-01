function [audio, fs, f1] = cria_sinal(toca)

if nargin < 1
    toca = 1;
end

% sinal original
fs = 44.1e3;  % Hz 
Ts = 1/fs;  % s
f1 = fs/100;  % Hz
T = 1/3;  % s
N = fs * T;
A = 1;
n = 0:(N-1);
t = n*Ts;  % s

s_part = A*sin(2*pi*f1*t);
s = [s_part zeros(1, 2*T*fs)];
audio = s;

if toca == 1
    sound(audio, fs)
end
audiowrite('ref.wav', audio, fs)

end