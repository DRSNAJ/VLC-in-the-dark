function Tx_bin = OPPM_mod(seq, N, L)
%This function us used to modulate binary numbers using oppm
%
% INPUTS---
%   bits_in: The bit sequence that needs to be modulated
%   sw: The required symbol width of the modulated sequance
%
% OUTPUTS---
%   Tx_out: The modulated binary sequance
%

maxL = floor(log2(N+1)); % finding the length if the larget number with consecutive 1s
seq = horzcat(1,seq); % adding a bit to signify the start of a bit sequance (Preamble)

seq = padZeros(seq,maxL);
spltSeq = reshape(seq,maxL,[])';

Tx_bin = zeros(size(spltSeq,1),N);

for i = 1:size(spltSeq,1)
    % this loop converts all the bit sequance blocks into a serial array of
    % binary digits based on OPPM
    dec_num = arr_bin2dec(spltSeq(i,:))+1;
    symb = zeros(1,N);
    t_symb = zeros(1,N*2); % temporary symbol before wrapping around
    t_symb(dec_num:dec_num+L-1) = ones(1,L);
    symb = t_symb(1:N)|t_symb(N+1:end); % Wrapping around extra bits
    Tx_bin(i,:) = symb;
end
Tx_bin = reshape(Tx_bin',1,[]);

% adding the preamble bits the length of 1 symbol
% here initally half the sysmbol is zero then the other half is a clock
% signal
pre_amb = zeros(1,N);
pre_amb(floor(N/2):N) = mod(1:N-floor(N/2)+1,2);
Tx_bin = horzcat(pre_amb,Tx_bin);
end