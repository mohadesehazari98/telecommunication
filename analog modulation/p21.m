fs=600;
t= -1 : 1/fs : 1;
xm = zeros(size(t));
for i=1:1:601
    xm(i)=0;
end
for i=601:1:1201
    xm(i) = sinc(10*t(i));
end
xc10 = (1 + xm) .* cos(62.8 .* t);
xc50 = (1 + xm) .* cos(314 .* t);
xc100 = (1 + xm) .* cos(628 .* t);
subplot(3,1,1)
plot(t,xc10)
title('message signal(10)')
xlabel('time(s)')
ylabel('amplitude')
xlim([-1 1])
subplot(3,1,2)
plot(t,xc50)
title('message signal(50)')
xlabel('time(s)')
ylabel('amplitude')
xlim([-1 1])
subplot(3,1,3)
plot(t,xc100)
title('message signal(100)')
xlabel('time(s)')
ylabel('amplitude')
xlim([-1 1])