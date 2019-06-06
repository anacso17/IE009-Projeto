function eco_teste1(plota)

[s, fs] = cria_sinal(0);

h1 = [0 zeros(1, round(fs/34)) 0.4 zeros(1, round(fs/34)) 0];
y1 = conv(s, h1);
h2 = [0 zeros(1, round(fs/34)) 0 zeros(1, round(fs/34)) 0.2];
y2 = conv(s, h2);

h = [1 zeros(1, round(fs/8)) 0.4 zeros(1, round(fs/8)) 0.2];
y = conv(s, h);

if plota == 1
    figure(1); 
    subplot(4, 1, 1); plot(s)
    axis([0 2e5 -1 1])
    subplot(4, 1, 2); plot(y1)
    axis([0 2e5 -1 1])
    subplot(4, 1, 3); plot(y2)
    axis([0 2e5 -1 1])
    subplot(4, 1, 4); plot(y)
    axis([0 2e5 -1 1])
end

sound(y, fs)

end