function dec_val = arr_bin2dec(bin_val)
%This function converts an array of binary digits into  its decimal
%equivalent
%
% INPUTS---
%   bin_val: The binary number that needs to be converted to decimal 
% 
% OUTPUTS---
%   dec_val: The converted decimal value
%
bin_val = flip(bin_val);
dec_val = 0;
for i = 1:length(bin_val)
    dec_val = dec_val + bin_val(i)*2^(i-1);
end
end