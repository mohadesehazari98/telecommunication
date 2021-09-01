n = 10^7; % Number Of Bits
V = randi([0, 1], [1, n]);
m = n/2;
QPSK = zeros(1,m);
for i=1:1:m
    A = [V(2*i-1),V(2*i)];
    b = num2str(A);
    b(b==' ')=[];
    switch b
        case '00'
            QPSK(i)=0;
        case '01'
            QPSK(i)=1;
        case '10'
            QPSK(i)=2;
        case '11'
            QPSK(i)=3;
    end
end

