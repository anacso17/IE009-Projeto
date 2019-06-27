
close all
clear all
clc

[x1,fs] = audioread('x2.wav');
[d1,fs] = audioread('d2.wav');

% % M = num de coeficientes
% Lmax = 180000
% comp = 100000;

min=1;
M=50
    for L=22050:22050
        
        Rx = autocorrMatrix(x1, M);
        px = corrCruz(x1, x1, M, L);
        
        wf = inv(Rx)*px;
        W(:,L) = [ 1; zeros(L-1,1); -wf];
        
        y1 = conv(x1, W(:,L)) ;
        
        y1  = y1(1: length(d1));
        
        MSE = mean((y1-d1).^2);
%         
%         if MSE < min
%             min= MSE;
%             Lf = L
%         end
    end
   
plot(MSE)

sound(y1,fs)

figure
plot(y1)
figure
plot(x1)
figure
plot(d1)
