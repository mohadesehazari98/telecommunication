function [ output_serial ] = Channel_Ray( input_serial,clipping,SNR )
%This is the function for the communication Channel
%clipping 3dB
peak_clipped = (10^(0-(clipping/20)))*max(abs(input_serial));
%?_s
s = var(input_serial);
%length of signal
N = length(input_serial);
output_serial = input_serial;
%Clipping
limit = abs(output_serial(:))>=peak_clipped;
output_serial(limit)= peak_clipped.*output_serial(limit)./abs(output_serial(limit));
%converting from dB into linear
SNR_ = 10^(SNR/10); 
%calculate the sigma of noise signal
sigma = sqrt(s/SNR_); 
noise = raylrnd(1,1,N) * sigma;
%adding noise to signal
output_serial = output_serial + noise; 
end