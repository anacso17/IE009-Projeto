function [outputArg1] = AutoCorr(inputArg1)
%AUTOCORR Summary of this function goes here
%   Detailed explanation goes here


outputArg1 = xcorr(inputArg1,'biased');

outputArg1 = outputArg1(length(inputArg1):end);

end

