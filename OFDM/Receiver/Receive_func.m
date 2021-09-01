function [ BER ] = Receive_func( output_serial,QPSK,dimension,nc )
%canculating BER with respect to SNR
parallel_Frame = zeros(22,1280,dimension);
for k=1:dimension
    for i=1:1280
        for j=1:22
            parallel_Frame(j,i,k) = output_serial(1,(i-1)*22+j,k); %convert into parallel frame
        end
    end
end
%serial_size = 22 * 1280 ;
parallel_Frame(:,(1:256),:)=[]; %Cyclic Prefix 

Frame_FFT = zeros(22,1024,dimension);
for k=1:dimension
    Frame_FFT(:,:,k) = fft(parallel_Frame(:,:,k)); %fft
end

Data = Frame_FFT(:,(57:456),:);
MATRIX = zeros(22,nc,dimension);
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

MATRIX = round(MATRIX);
MATRIX = mod(MATRIX,4);

MATRIXx = diff(MATRIX);

Symbol_receive = zeros(1,5006400);
for k=1:dimension
    for n=1:nc
        for m=1:21
            Symbol_receive(m+(n-1)*21+(k-1)*8400) = MATRIXx(m,n,k) ; % parallel to series
        end
    end
end
Symbol_receive(5000001:5006400)=[]; %removing padded symbol

errors = find(Symbol_receive(1:length(QPSK))~=QPSK);
% Bit Error Rate
BER = (length(errors)/length(QPSK)/2)*100;


end

