function bin_val = arr_dec2bin(dec_val)
%This function converts a decimal number to an array of binary digits
%
% INPUTS---
%   dec_val: The decimal number that needs to be converted to binary 
% 
% OUTPUTS---
%   bin_val: The converted binary value in an array
%
if dec_val > 0
    L = floor(log2(dec_val))+1;
    bin_val = zeros(1,L);
    for i = 1:L
        bin_val(i) = mod(floor(dec_val/(2^(i-1))),2);
    end
    bin_val = flip(bin_val);
else
    bin_val = 0;
end
end