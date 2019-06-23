function Rx = calcula_autocorr_mat(x, M)
% x: vetor de amostras de x
% M: dimensão da matriz de autocorrelação desejada

rx = zeros(1, M);
for i = 1:M
    for j = i:length(x)
        rx(i) = rx(i) + x(j)*x(j-i+1);
    end
    rx(i) = rx(i)/(length(x)-i);
end

Rx = toeplitz(rx);

end