function [ Grid ] = MMSE( rxWaveform )
L = length(rxWaveform);
h = raylrnd(1,1,L);
H = fourier(h);
sigma = var(rxWaveform);
Equalizer = zeros(1,L);
for m=1:L
    Equalizer(m) = conj(H(m)) / (abs(H(m))^2 + sigma^2);
end
Grid = Equalizer .* rxWaveform;
end



