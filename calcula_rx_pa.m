function rx = calcula_rx_pa(x, L, M)
% x: vetor de amostras de x
% L: lag
% M: dimensão da matriz de autocorrelação desejada

rx = zeros(M, 1);
for i = 1:M
    for j = i:(length(x)-L)
        rx(i) = rx(i) + x(j+L)*x(j-i+1);
    end
    rx(i) = rx(i)/(length(x)-i);
end

end