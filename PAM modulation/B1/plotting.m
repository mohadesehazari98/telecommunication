SE1 = 0 ;%sampling-error
SE2 = 0.1 ;%sampling-error
SE3 = 0.2 ;%sampling-error
Pe1 = CAca3(SE1);
Pe2 = CAca3(SE2);
Pe3 = CAca3(SE3);

SNR_db=[0,1,2,3,4,5,6,7,8,9,10];

figure 
semilogy(SNR_db,Pe1,'b -o',SNR_db,Pe2,'r -*',SNR_db,Pe3,'y -o')
title('The BER Performance Of Binary PAM For Betha=1')
xlabel('E_b/Etha in db')
ylabel('Bit Error Rate')
ylim([10^(-6) 1])