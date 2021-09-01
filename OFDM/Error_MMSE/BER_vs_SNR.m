clipping = 0:0.1:10;
SNR = 20;
Length_frame = size(serial_Frame);
L = size(serial_Frame);
%output_serial = zeros(L(1),L(2),L(3),length(clipping));
for k=1:length(clipping)
    for i=1:Length_frame(3)
        output_serial(:,:,i,k)  = Channel( serial_Frame(:,:,i),clipping(k),SNR);
    end
end
%%%%%%%%%%%%%%%%%%%MMSE%%%%%%%%%%%%%%%%%
for k=1:length(SNR)
    for i=1:Length_frame(3)
        output_serial(:,:,i,k)  = LMMSE(output_serial(:,:,i,k));
    end
end
%%%%%%%%%%%%%%%%%%OFDM%%%%%%%%%%%%%%%%%
BER = zeros(1,length(SNR));

for m=1:length(SNR)
    BER(1,m) = Receive_func(output_serial_1(:,:,:,m),QPSK,dimension,nc);
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
semilogy(SNR,BER,'-d')
title('with MMSE Equalizer')
xlabel('clipping(dB)')
ylabel('BER(%)')