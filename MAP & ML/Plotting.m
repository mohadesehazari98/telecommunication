SNR_db=[0,1,2,3,4,5,6,7,8,9,10];
% 1 ML / 0 MAP
Pe_ML = PLOTTING_( 1 );
Pe_MAP = PLOTTING_( 0 );

figure 
semilogy(SNR_db,Pe_MAP,'b -o',SNR_db,Pe_ML,'r -*')
title('The Performance Of 3_PAM For ML(red) & MAP(blue) Methods')
xlabel('E_b/Etha in db')
ylabel('Bit Error Rate')



