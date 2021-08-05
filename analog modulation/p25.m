fs=600;
t= -1 : 1/fs : 1;
xm = zeros(size(t));
for i=1:1:601
    xm(i)=0;
end
for i=601:1:1201
    xm(i) = sinc(10*t(i));
end
mu= -4:1:4 ;
err=zeros(size(mu));
for i=1:1:9
    xc = AM(xm,t,1,mu(i),100);
    xmdem = p23demodulate(xc,t,1,mu(i),100,0);
    err(i)=immse(xm,xmdem);
end
plot(mu,err)
% the best choice is the one with the least error so its mu=4&-4