function [ y ] = dspcross( v,w,fs)
% the function will get signals x1 and x2 as its inputs and
%   it will return y as the result of cross-correlation
xcorr = dsp.Crosscorrelator;
L=length(v);
t = -(((L-1)/fs)/2):1/fs:(((L-1)/fs)/2) ;
y = xcorr(v,w);
subplot(1,2,1)
plot(t,v,'b',t,w,'g');
xlabel('Time');
ylabel('Signal Amplitude');
legend('Input signal 1','Input signal 2');
end

