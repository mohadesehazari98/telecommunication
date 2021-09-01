errors = find(Symbol_receive(1:length(QPSK))~=QPSK);
% Bit Error Rate
fprintf('Bit Error Rate (BER) = %f%%\n',length(errors)/length(QPSK)/2)
