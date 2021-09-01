for k=1:dimension
    for n=1:nc
        for m=1:21
            MatRix(m+1,n,k) = MatRix(m+1,n,k) + MatRix(m,n,k); %adding numbers with lower cell 
        end
    end
end
for k=1:dimension
    for n=1:nc
        for m=1:21
            MatRix(m+1,n,k) = mod(MatRix(m+1,n,k),4); %calaulate modulo 4
        end
    end
end
for k=1:dimension
    for n=1:nc
        for m=1:22
            MatRix(m,n,k) = deg2rad(90 * MatRix(m,n,k));
            MatRix(m,n,k) = exp(1i*MatRix(m,n,k)); %converting into e^j?
        end
    end
end