for k=1:dimension
    for i=1:1280
        for j=1:22
            parallel_Frame(j,i,k) = output_serial(1,(i-1)*22+j,k); %convert into parallel frame
        end
    end
end
serial_size = 22 * 1280 ;
parallel_Frame(:,(1025:1280),:)=[]; %Cyclic Prefix 

for k=1:dimension
    Frame_FFT(:,:,k) = fft(parallel_Frame(:,:,k)); %fft
end

