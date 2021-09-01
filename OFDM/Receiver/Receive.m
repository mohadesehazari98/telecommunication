clipping = 3;
SNR = 20;
Length_frame = size(serial_Frame);
output_serial = serial_Frame;
for i=1:Length_frame(3)
    output_serial(:,:,i)  = Channel( serial_Frame(:,:,i),clipping,SNR );
end
