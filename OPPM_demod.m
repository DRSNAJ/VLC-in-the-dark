function Rx_bin = OPPM_demod(seq, N)
%This function us used to demodulate binary sequences that were modulated
%using OPPM
%
% INPUTS---
%   bits_in: The modulated bit sequence that needs to be demodulated
%   sW: The symbol width of the recived bit sequance
% 
% OUTPUTS---
%   Rx_in: The demodulated binary sequance 
%
seq = seq(N+1:end);
crop_len = floor(length(seq)/N)*32;
seq = seq(1:crop_len);

maxL = floor(log2(N+1)); % finding the length if the larget number with consecutive 1s
Rx_seq = padZeros(seq,N);

Rx_seq = reshape(Rx_seq,N,[])';
n_symb = size(Rx_seq,1);
Rx_dec = zeros(1,n_symb);
% Rx_bin = zeros(n_symb,maxL);
Rx_bin = [];

for i = 1:n_symb
    if sum(Rx_seq(i,:)) > 0
        if Rx_seq(i,1)&&Rx_seq(i,N)
            pos_arr = find(Rx_seq(i,:) == 0);
            Rx_dec(i) = mod(pos_arr(end)+1,33);
        else
             Rx_dec(i) = find(Rx_seq(i,:) == 1,1);
        end
    else
        Rx_dec(i) = 0;
    end 
    if Rx_dec(i) ~= 0
        Rx_bin = [Rx_bin; padZeros(arr_dec2bin(Rx_dec(i)-1), maxL)];
    end

end
Rx_bin = reshape(Rx_bin',1,[]);
pre_idx = find(Rx_bin == 1, 1);
Rx_bin = Rx_bin(pre_idx+1:end);
end