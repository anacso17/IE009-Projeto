function pxd = calcula_pxd(x, d, M)
% x: vetor de amostras de x
% M: dimens�o da matriz de autocorrela��o desejada

pxd = zeros(M, 1);
for i = 1:M
    for j = i:(length(x))
        pxd(i) = pxd(i) + d(j)*x(j-i+1);
    end
    pxd(i) = pxd(i)/(length(x)-i);
end

end