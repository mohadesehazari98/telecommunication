fs=600;
t= -1 : 1/fs : 1;
xm = zeros(size(t));
for i=1:1:601
    xm(i)=0;
end
for i=601:1:1201
    xm(i) = sinc(10*t(i));
end
xcam10 = AM(xm,t,1,1,10);
xcam50 = AM(xm,t,1,1,50);
xcam100 = AM(xm,t,1,1,100);
xcam600 = AM(xm,t,1,1,600);
xcam1200 = AM(xm,t,1,1,1200);
subplot(5,1,1)
plot(t,xcam10)
title('modulated signal fc=10')
xlabel('time(s)')
ylabel('amplitude')
xlim([-1 1])
subplot(5,1,2)
plot(t,xcam50)
title('modulated signal fc=50')
xlabel('time(s)')
ylabel('amplitude')
xlim([-1 1])
subplot(5,1,3)
plot(t,xcam100)
title('modulated signal fc=100')
xlabel('time(s)')
ylabel('amplitude')
xlim([-1 1])
%from frequencies higher than our sampling frequency we will lose our data
%so the maximum frequency could be 600HZ
subplot(5,1,4)
plot(t,xcam600)
title('modulated signal fc=600')
xlabel('time(s)')
ylabel('amplitude')
xlim([-1 1])
subplot(5,1,5)
plot(t,xcam1200)
title('modulated signal fc=1200')
xlabel('time(s)')
ylabel('amplitude')
xlim([-1 1])