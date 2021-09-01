nc = 400; %number of carrie
sfc = ceil(2^13/nc);
dimension = ceil(m/(nc*sfc));
Symbol = [QPSK, zeros(1, sfc*nc*dimension - length(QPSK))]; %pading zero
MatRix=zeros(sfc+1,nc,dimension);
for k=1:dimension
    for i=1:nc
        for j=1:sfc
            MatRix(j+1,i,k) = Symbol((k-1)*nc*sfc + (i-1)*sfc +j); %differenciated matrix
        end
    end
end
A=[0 1 2 3];
for k=1:dimension
    for i=1:nc
            MatRix(1,i,k) = randsample(A,1); %reference row
    end
end