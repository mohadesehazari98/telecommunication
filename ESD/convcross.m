function [ y ] = convcross( v,w,fs)
% calculating cross-corelation by conv function
L=length(v);
T = -(((L-1)/fs)/2):1/fs:(((L-1)/fs)/2) ;
subplot(1,2,1)
plot(T,v,'b',T,w,'g');
xlabel('Time');
ylabel('Signal Amplitude');
legend('Input signal 1','Input signal 2');
subplot(1,2,2)
t=1:1:L;
wc = conj(w);
tf = fliplr(t);
wcf = wc(tf);
y = conv(v,wcf);

plot(y);
title('Correlated output');
end

