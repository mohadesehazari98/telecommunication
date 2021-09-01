for k=1:dimension
    Frame_IFFT(:,:,k) = real(ifft(Frame(:,:,k)));
end

CP = Frame_IFFT(:,(769:1024),:); %Cyclic Prefix
Final_Frame = cat(2,CP,Frame_IFFT);
serial_size = 22 * 1280 ;
for k=1:dimension
    for i=1:1280
        for j=1:22
            serial_Frame(1,22*(i-1)+j,k) = Final_Frame(j,i,k); %convert into serial frame
        end
    end
end