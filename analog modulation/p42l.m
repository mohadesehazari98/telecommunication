%Lower Side Band
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
xcl100 = LSSB(Ac,xm,t,fc);
figure
xmdeml = p34demodulate(2*xcl100,t,Ac,fc,1);
figure
subplot(2,1,1)
plot(t,xm)
title('xm(t)')
xlabel('time(s)')
ylabel('amplitude')
subplot(2,1,2)
plot(t,xmdeml)
title('xm demodulate(t)lower side band')
xlabel('time(s)')
ylabel('amplitude')
err=immse(xm,xmdeml);