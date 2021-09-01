MatRix_conj = zeros(22,nc,dimension);
for k=1:dimension
    for i=1:nc
        for j=1:22
            MatRix_conj(j,i,k) = conj(MatRix(j,i,k)); %conjucate
        end
    end
end
trailer_column = zeros(22,56,dimension);
trailer_between = zeros(22,112,dimension);


C1=cat(2,trailer_column,MatRix);
C2=cat(2,C1,trailer_between);
C3=cat(2,C2,MatRix_conj);
Frame=cat(2,C3,trailer_column);