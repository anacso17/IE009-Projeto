function gera_eco_um_atraso(plota)

if nargin < 1
    plota = 1;
end

[s, fs, f1] = cria_sinal;

% nz = floor(randi([10 100])*fs/f1);
nz = 14700;

h = [1 zeros(1, nz) 0.2 zeros(1, nz) 0.05 zeros(1, nz) 0.02];
y = conv(s, h);
y = y/max(y);

if plota == 1
    h1 = [0 zeros(1, nz) 0.2 zeros(1, nz) 0 zeros(1, nz) 0];
    y1 = conv(s, h1);
    h2 = [0 zeros(1, nz) 0 zeros(1, nz) 0.05 zeros(1, nz) 0];
    y2 = conv(s, h2);
    h3 = [0 zeros(1, nz) 0 zeros(1, nz) 0 zeros(1, nz) 0.02];
    y3 = conv(s, h3);
    
    figure(1); 
    subplot(5, 1, 1); plot(s)
    axis([0 2e5 -1 1])
    subplot(5, 1, 2); plot(y1)
    axis([0 2e5 -1 1])
    subplot(5, 1, 3); plot(y2)
    axis([0 2e5 -1 1])
    subplot(5, 1, 4); plot(y3)
    axis([0 2e5 -1 1])
    subplot(5, 1, 5); plot(y)
    xlim([0 2e5])
end

sound(y, fs)
audiowrite(['L=', int2str(nz), '.wav'], y, fs)
% audiowrite(['ref.wav'], y, fs)

end