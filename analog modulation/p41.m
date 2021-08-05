fs=600;
Ac=1;
fc=100;
t= -1 : 1/fs : 1;
xm = zeros(size(t));
for i=1:1:601
    xm(i)=0;
end
for i=601:1:1201
    xm(i) = sinc(10*t(i));
end
xcu100 = USSB(Ac,xm,t,fc);
xcl100 = LSSB(Ac,xm,t,fc);
Yu = fft(xcu100);
Yl = fft(xcl100);
Yu = fftshift(Yu);
Yl = fftshift(Yl);
f = -fs/2:0.5:fs/2;
Au = abs(Yu/length(Yu));
Al = abs(Yl/length(Yl));
subplot(4,1,1)
plot(t,xcu100)
title('modulated signal upper fc=100')
xlabel('time(s)')
ylabel('amplitude')
xlim([-1 1])
subplot(4,1,2)
plot(f,Au);
title('Fourier Transform')
xlabel('freguancy (HZ)')
ylabel('amplitude')
subplot(4,1,3)
plot(t,xcl100)
title('modulated signal lower fc=100')
xlabel('time(s)')
ylabel('amplitude')
xlim([-1 1])
subplot(4,1,4)
plot(f,Al);
title('Fourier Transform')
xlabel('freguancy (HZ)')
ylabel('amplitude')