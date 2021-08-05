fs=600;
t= -1 : 1/fs : 1;
xm = zeros(size(t));
for i=1:1:601
    xm(i)=0;
end
for i=601:1:1201
    xm(i) = sinc(10*t(i));
end
xcam100 = AM(xm,t,1,1,100);
Y = fft(xcam100);
Y = fftshift(Y);
f = -fs/2:0.5:fs/2;
A = abs(Y/length(Y));
subplot(2,1,1)
plot(t,xcam100)
title('modulated signal fc=100')
xlabel('time(s)')
ylabel('amplitude')
xlim([-1 1])
subplot(2,1,2)
plot(f,A);
title('Fourier Transform')
xlabel('freguancy (HZ)')
ylabel('amplitude')