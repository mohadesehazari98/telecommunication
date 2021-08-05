function [ xm ] = p23demodulate( xc,t,Ac,mu,fc,plt)
%This function demodulate our function xc(t) and will give us xm(t)
y = xc .* (2 .* cos((2*pi.*fc) .* t));
lpFilt = designfilt('lowpassfir', 'PassbandFrequency', 100,'StopbandFrequency', 200, 'PassbandRipple', 0.5,'StopbandAttenuation', 65, 'SampleRate', 1e3);
z = filter(lpFilt,y);
if plt==1
    subplot(2,1,1)
    plot(t,y)
    title('y(t)')
    xlabel('time(s)')
    ylabel('amplitude')
    subplot(2,1,2)
    plot(t,z)
    title('z(t)')
    xlabel('time(s)')
    ylabel('amplitude')
end
xm = ((z./Ac)-1)./mu;
end

