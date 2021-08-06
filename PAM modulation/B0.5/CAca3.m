function [ Pe ] = CAca3( SE )
%This Function Will Calculate The Total Error For A Given Sample Error
%PART__1__
%generating Raised_Cosine
T = 1;
Fs=10;
L=T*Fs;
B=0.5; %Roll-off factor

t= (-6*L:6*L) ./ (Fs - SE) ;

P_R = sinc(t).* F(t);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%PART__2__
%Generating Transmited Signal
N = 10^5;
T = 1;
Fs=10;
L=T*Fs;
bits = randi([0 1], N, 1);
modulated_symbols=zeros(size(bits));
for i=1:1:N
    if bits(i)==0
   modulated_symbols(i)=-1;
    elseif bits(i)==1
   modulated_symbols(i)=1;
    end
   
end
%Adding Zero Between Our Signal
temp0 = upsample(modulated_symbols,L) ; 
temp0 = temp0(1:end-(L-1));
transmitted_signal=conv(temp0,P_R);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%PART__3__
SNR_db=[0,1,2,3,4,5,6,7,8,9,10];
SNR_normal=zeros(size(SNR_db));
for i=1:length(SNR_db)
SNR_normal(i) =db_to_magnitude(SNR_db(i));
end
Etha = 1./SNR_normal;

AWGN =sqrt(Etha ./2).*randn(size(transmitted_signal));

received_signal=transmitted_signal+AWGN;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%PART__4__
T_sampling = 6*L+1:L:(N+6-1)*L+1;
samples = zeros(length(T_sampling),11);
for i=1:length(T_sampling)
   samples(i,:) = received_signal(T_sampling(i),:);
end
detected_symbols=zeros (size(samples));

for i=1:1:11
    for j=1:1:length(T_sampling)
        if samples(j,i)>= 0
           detected_symbols(j,i)=1;
        elseif samples(j,i)< 0
            detected_symbols(j,i)=-1;
        end
    end
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%PART__5__
% Here We Wanna Compare detected_symbols & modulated_symbols
Error = zeros(1,11);
for m=1:1:11
    for n=1:1:length(modulated_symbols)
        if detected_symbols(n,m)~= modulated_symbols(n,1)
            Error(1,m)= Error(1,m)+1;
        end
    end
        
end
Pe = (Error ) ./ N ;



end

