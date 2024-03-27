clc;

spb = 256;
sig = real(out.Signal);
time = out.Time;
plot(time,sig);
title('Signal at Receiver')
grid on
xlabel('Time (s)')
ylabel('Signal Intensity (a.u.)')

% quantizing the received signal
Rx_modBits = my_quantize(sig, spb, 0.6, N);

Rx_bits = OPPM_demod(Rx_modBits,N);
fprintf('Transmitted Bits: ')
fprintf(int2str(BitSeq))
fprintf('\nReceived Bits: ')
fprintf(int2str(Rx_bits))
fprintf('\n')