function y = gera_eco_multi_atrasos(h_orig_tam, nr_atrasos)

% Congela semente de geração de números aleatórios
% seed = RandStream.create('mt19937ar','seed', 5489);
% RandStream.setGlobalStream(seed);
[s, fs, f1] = cria_sinal;

% Gera h_aux's
if nargin < 1
    h_aux = [1, 0.2, 0.02, 0.01];
else
    h_aux = [1, 0.2*rand(1, h_orig_tam)];
end

% Gera L's
if nargin < 2
    L = [11025 14700 22050];
else
    L = [];
    for i = 1:nr_atrasos
        L = [L floor(randi([50 200])*fs/f1);]; 
    end
end

% Gera h's
h = {};
for i = 1:length(L)
    l = L(i);
    g = [];
    for j = 1:(length(h_aux)-1)
        g = [g h_aux(j) zeros(1, l)];
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
for i = 1:length(L)
    y_final = y_final + y{i};
end
y_final = y_final/max(y_final);
sound(y_final, fs)
figure(1); plot(y_final)

end