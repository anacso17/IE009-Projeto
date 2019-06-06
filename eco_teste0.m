function eco_teste0(plota)

toca = 0;
[s, fs] = cria_sinal(toca);

% eco
A1 = 0.2;
L = length(s);
eco = zeros(1, L);
eco(1:(end-round(fs/34))) = eco(1:(end-round(fs/34))) + s((round(fs/34)+1):end);
s_eco = s + A1*eco;

sound(s_eco, fs)

if plota == 1
    figure(1); 
    subplot(3, 1, 1); plot(s)
    subplot(3, 1, 2); plot(eco)
    subplot(3, 1, 3); plot(s_eco)
end

end