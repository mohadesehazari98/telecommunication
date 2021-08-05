fs=600;
t= -1 : 1/fs : 1;
xm = zeros(size(t));
for i=1:1:601
    xm(i)=0;
end
for i=601:1:1201
    xm(i) = sinc(10*t(i));
end
Y = fft(xm);
Y = fftshift(Y);
f = -fs/2:0.5:fs/2;
A = abs(Y/length(Y));

plot(f,A);


title('amplitude , frequancy')
xlabel('freguancy (HZ)')
ylabel('amplitude')