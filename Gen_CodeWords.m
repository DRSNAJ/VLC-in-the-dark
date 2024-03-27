clear all; close all; clc

decNums = 0:32; % all the possible dec numbers that can be represented 
N = 32; % the number of chips in a symbol
L = 31; % use this to increase the brightness

err = zeros(1,length(decNums));
dataBits = zeros(length(decNums)-1,5);
codeWords = zeros(length(decNums)-1,N);

for i = 1:length(decNums)-1
    s = arr_dec2bin(decNums(i));
    
    if length(s)<5
        dataBits(i,:) = padZeros(s, 5);
    else
        dataBits(i,:) = s;
    end
    
    Tx_bin = OPPM_mod(s, N, L); % modulation 
    codeWords(i,:) = Tx_bin(end-31:end);
    
    % checking if the bits can be demodulated correctly
    Rx_bin = OPPM_demod(Tx_bin, N);
    err(i) = sum(Rx_bin ~= s);
end
fprintf('Number of erroneous bits: %d\n', sum(err))

