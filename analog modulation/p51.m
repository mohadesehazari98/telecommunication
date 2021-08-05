fs=600;
Ac=1;
mu=4;
fc=100;
fprim=[fc-((0.01)*fc),fc+((0.01)*fc)];
t= -1 : 1/fs : 1;
xm = zeros(size(t));
for i=1:1:601
    xm(i)=0;
end
for i=601:1:1201
    xm(i) = sinc(10*t(i));
end
xc_AM = AM(xm,t,Ac,mu,fc);
xc_DSP = DSP(Ac,xm,t,fc);
xc_USSB = USSB(Ac,xm,t,fc);
xc_LSSB = LSSB(Ac,xm,t,fc);
xm_AM = p23demodulate(xc_AM,t,Ac,mu,fprim(1),0);
xm_DSP = p34demodulate(xc_DSP,t,Ac,fprim(1),0);
xm_USSB = p34demodulate( 2 * xc_USSB,t,Ac,fprim(1),0);
xm_LSSB = p34demodulate( 2 * xc_LSSB,t,Ac,fprim(1),0);
subplot(4,2,1)
plot(t,xc_AM)
title('xc_AM(t)')
xlabel('time(s)')
ylabel('amplitude')
subplot(4,2,2)
plot(t,xm_AM)
title('xm_AM(t)')
xlabel('time(s)')
ylabel('amplitude')
subplot(4,2,3)
plot(t,xc_DSP)
title('xc_DSP(t)')
xlabel('time(s)')
ylabel('amplitude')
subplot(4,2,4)
plot(t,xm_DSP)
title('xm_DSP(t)')
xlabel('time(s)')
ylabel('amplitude')
subplot(4,2,5)
plot(t,xc_USSB)
title('xc_USSB(t)')
xlabel('time(s)')
ylabel('amplitude')
subplot(4,2,6)
plot(t,xm_USSB)
title('xm_USSB(t)')
xlabel('time(s)')
ylabel('amplitude')
subplot(4,2,7)
plot(t,xc_LSSB)
title('xc_LSSB(t)')
xlabel('time(s)')
ylabel('amplitude')
subplot(4,2,8)
plot(t,xm_LSSB)
title('xm_LSSB(t)')
xlabel('time(s)')
ylabel('amplitude')