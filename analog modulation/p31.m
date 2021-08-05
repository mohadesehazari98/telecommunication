fs=600;
Ac=1;
t= -1 : 1/fs : 1;
xm = zeros(size(t));
for i=1:1:601
    xm(i)=0;
end
for i=601:1:1201
    xm(i) = sinc(10*t(i));
end
xcdsp10 = DSP(Ac,xm,t,10);
xcdsp50 = DSP(Ac,xm,t,50);
xcdsp100 = DSP(Ac,xm,t,100);
xcdsp600 = DSP(Ac,xm,t,600);
xcdsp1200 = DSP(Ac,xm,t,1200);
subplot(5,1,1)
plot(t,xcdsp10)
title('modulated signal fc=10')
xlabel('time(s)')
ylabel('amplitude')
xlim([-1 1])
subplot(5,1,2)
plot(t,xcdsp50)
title('modulated signal fc=50')
xlabel('time(s)')
ylabel('amplitude')
xlim([-1 1])
subplot(5,1,3)
plot(t,xcdsp100)
title('modulated signal fc=100')
xlabel('time(s)')
ylabel('amplitude')
xlim([-1 1])
%from frequencies higher than our sampling frequency we will lose our data
%so the maximum frequency could be 600HZ
subplot(5,1,4)
plot(t,xcdsp600)
title('modulated signal fc=600')
xlabel('time(s)')
ylabel('amplitude')
xlim([-1 1])
subplot(5,1,5)
plot(t,xcdsp1200)
title('modulated signal fc=1200')
xlabel('time(s)')
ylabel('amplitude')
xlim([-1 1])