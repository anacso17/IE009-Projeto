function [outputArg1] = corrCruz(x,d,M,L)

    T = length(x);
    outputArg1 = zeros(M,1);
    
    for i=1:M
       outputArg1(i) = mean(x(1:T-i-L+1).*d(i+L:T));
    end

end