function y = gera_eco_multi_atrasos(h_orig_tam, nr_atrasos)

[s, fs] = cria_sinal(0);

% Congela semente de geração de números aleatórios
% seed = RandStream.create('mt19937ar','seed', 5489);
% RandStream.setGlobalStream(seed);

% Gera L's
geraL = randi(50, nr_atrasos);
L = [];
for i = 1:length(geraL)
    L = [L round(fs/geraL(i))]; 
end

% Gera h's
h_aux = [1, 0.6*rand(1, h_orig_tam)];
h = {};
for i = 1:length(L)
    l = L(i);
    g = [];
    for j = 1:(length(h_aux)-1)
        g = [h_aux(j) zeros(1, l)];
    end
    g = [g h_aux(end)];
    h{i} = g;
end

% Gera y's
y = {};
lens = [];
for i = 1:length(L)
    y{i} = conv(h{i}, s);
    lens = [lens length(y{i})];
end

% Completa y's com zeros
max_len = max(lens);
for i = 1:length(L)
    len = lens(i);
    nr_z = max_len - len;
    y{i} = [y{i} zeros(1, nr_z)];
end

% Soma os y's
y_final = zeros(1, max_len);
for i = i:length(L)
    y_final = y_final + y{i};
end
sound(y_final, fs)

end