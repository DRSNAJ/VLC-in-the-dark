function padded_arr = padZeros(bits, L)
%This function us used to pad a sequance of bits to a spesified length
%
% INPUTS---
%   bits: The bit sequnace to be padded 
%   L: The required length of the output bit sequance
% 
% OUTPUTS---
%   padded_arr: The output bit sequance with padding 
%

pad_L = mod(length(bits),L);
num_bits = L-pad_L;
if pad_L > 0
% if the number of bits isnt divisible by 8 then pad sequance with zeros 
    pad_zrs = zeros(1,num_bits);
    padded_arr = horzcat(pad_zrs,bits);
else
    padded_arr = bits;
end

end