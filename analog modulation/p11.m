fs=600;
t= -1 : 1/fs : 1;
xm =@ (t) (1 - (t>=1))*(1 - (t<=0)).* sinc(10.*t);
fplot(xm)
title('message signal')
xlabel('time(s)')
ylabel('amplitude')
ylim([-0.4 1])
xlim([-1 1])