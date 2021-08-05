fs=600;
mu=4;
Ac=1;
t= -1 : 1/fs : 1;
xm = zeros(size(t));
for i=1:1:601
    xm(i)=0;
end
for i=601:1:1201
    xm(i) = sinc(10*t(i));
end
fc= -500:1:500 ;
err=zeros(size(fc));
for i=1:1:length(fc)
    xc = p33DSPwithAM(Ac,xm,t,mu,fc(i));
    xmdem = p34demodulate(xc,t,Ac,fc(i),0);
    err(i)=immse(xm,xmdem);
end
plot(fc,err)
% the frequencies={-300,0,300} are not good because their error is much
% more than other frequencies and the best one is equal to xm frequency as
% f=100