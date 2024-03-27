N = 32;
L = 2;

% Spesify a 5 bit data sequence to transmit
BitSeq = [1 1 0 1 0];

OutputPort1 = InputPort1;
OutputPort1.Sequence = OutputPort1.Sequence*0;

OutputPort1.Sequence = OPPM_mod(BitSeq, N, L);
fprintf(int2str(OutputPort1.Sequence))