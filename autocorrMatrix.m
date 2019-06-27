function [outputArg1] = autocorrMatrix(x,M)

    T = length(x);
   outputArg1 = zeros(M,M);
    for i=0:M-1
        for l=0:M-1
            outputArg1(i+1,l+1) = mean(x(M-i:T-i).*x(M-l:T-l));
        end
    end

end

