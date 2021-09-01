Data = Frame_FFT(:,(57:456),:);
for k=1:dimension
    for n=1:nc
        for m=1:22
            MATRIX(m,n,k) = angle(Data(m,n,k)); %calculating phase of each element
            MATRIX(m,n,k) = rad2deg(MATRIX(m,n,k))+ 180 ;
        end
    end
end
for k=1:dimension
    for n=1:nc
        for m=1:22
            MATRIX(m,n,k) = MATRIX(m,n,k)./ 90 ; %translating into symbol 
        end
    end
end
for k=1:dimension
    for n=1:nc
        for m=21:1
            MATRIX(m+1,n,k) = MATRIX(m+1,n,k) - MATRIX(m,n,k) ; %Subtracting numbers with upper cell 
        end
    end
end
MATRIX(1,:,:)=[];
MATRIX = round(MATRIX);
MATRIX = mod(MATRIX,4);

for k=1:dimension
    for n=1:nc
        for m=1:21
            Symbol_receive(m+(n-1)*21+(k-1)*8400) = MATRIX(m,n,k) ; %Subtracting numbers with upper cell 
        end
    end
end
Symbol_receive(5000001:5006400)=[];