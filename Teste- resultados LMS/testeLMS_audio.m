
clc
clear all
close all

[d,fs] = audioread('03e0912f-08cc-46f3-87dd-778ec25d0ddc.wav');
figure;
%sinal sem eco
plot(d);

 h = [1 zeros(1,10000) 0.3 zeros(1,20000) 0.1];
x = conv (d,h);
% [x,fs] = audioread('x1.wav');
figure;
%sinal com eco
plot(x)

% 
% sound(xs,fs);

 W_lms = [zeros(1024,1)];
 mu = 0.0115;
 
 xi = zeros(1024,1);

 N = length(d);

for n = 1:N
           
   xi(end) = [];
   xi= [x(n);xi];
   
   y(n) = (W_lms)'*xi;     
   
    e(n) = d(n) -  y(n);
    
     ef(n) = x(n) - y(n) ;
    
    W_lms_p = W_lms + mu*xi*e(n);
    
    W_lms = W_lms_p;

    r(n) = d(n) - x(n);
 end

sound(y,fs)
figure
%sinal filtrado
plot(y)
figure;
%erro instantaneo
plot(e)

audiowrite('audio_referencia.wav',d,fs)
audiowrite('audio_com_eco.wav',x,fs)
audiowrite('audio_filtrado.wav',y,fs)