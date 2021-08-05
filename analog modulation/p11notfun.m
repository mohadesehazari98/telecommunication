fs=600;
t= -1 : 1/fs : 1;
xm = zeros(size(t));
for i=1:1:601
    xm(i)=0;
end
for i=601:1:1201
    xm(i) = sinc(10 .*t(i));
end

plot(t,xm)
title('message signal')
xlabel('time(s)')
ylabel('amplitude')
ylim([-0.4 1])
xlim([-1 1])
