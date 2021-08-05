fs=600;
Ac=1;
mu=4;
fc=100;
t= -1 : 1/fs : 1;
xm = zeros(size(t));
for i=1:1:601
    xm(i)=0;
end
for i=601:1:1201
    xm(i) = sinc(10*t(i));
end
Df= -50:1:50 ;
fprim= fc-(Df);
err_AM=zeros(size(Df));
err_DSP=zeros(size(Df));
err_USSB=zeros(size(Df));
err_LSSB=zeros(size(Df));
for i=1:1:length(Df)
    xc_AM = AM(xm,t,Ac,mu,fc);
    xc_DSP = DSP(Ac,xm,t,fc);
    xc_USSB = USSB(Ac,xm,t,fc);
    xc_LSSB = LSSB(Ac,xm,t,fc);
    xm_AM = p23demodulate(xc_AM,t,Ac,mu,fprim(i),0);
    xm_DSP = p34demodulate(xc_DSP,t,Ac,fprim(i),0);
    xm_USSB = p34demodulate( 2 * xc_USSB,t,Ac,fprim(i),0);
    xm_LSSB = p34demodulate( 2 * xc_LSSB,t,Ac,fprim(i),0);
    err_AM(i)=immse(xm,xm_AM);
    err_DSP(i)=immse(xm,xm_DSP);
    err_USSB(i)=immse(xm,xm_USSB);
    err_LSSB(i)=immse(xm,xm_LSSB);
end
subplot(4,1,1)
plot(Df,err_AM)
title('error for AM')
subplot(4,1,2)
plot(Df,err_DSP)
title('error for DSB')
subplot(4,1,3)
plot(Df,err_USSB)
title('error for USSB')
subplot(4,1,4)
plot(Df,err_LSSB)
title('error for LSSB')