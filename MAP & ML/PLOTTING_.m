function [ Pe ] = PLOTTING_( flag )
T = 1;
Fs=10;
L=T*Fs;
B=0 ; %Roll-off factor
SE=0;

t= (-6*L:6*L) ./ (Fs - SE) ;
P_R = sinc(t).* F(t);
%Generating Transmited Signal

N = 10^6;
T = 1;
Fs=10;
L=T*Fs;
bits = rand(N, 1);
modulated_symbols = zeros(size(bits));
for i=1:length(bits)
   if bits(i)<0.1
       modulated_symbols(i)=-3;
   elseif bits(i)<0.5
       modulated_symbols(i)=-1;
   elseif bits(i)<0.9
       modulated_symbols(i)=1;
   else
       modulated_symbols(i)=3;
   end
end
%Adding Zero Between Our Signal

temp0 = upsample(modulated_symbols,L) ; 
temp0 = temp0(1:end-(L-1));
transmitted_signal=conv(temp0,P_R);
%Adding Noise To Our Signal

SNR_db=[0,1,2,3,4,5,6,7,8,9,10];
SNR_normal=zeros(size(SNR_db));
for i=1:length(SNR_db)
SNR_normal(i) =db_to_magnitude(SNR_db(i));
end
%Es Is The Power We Need For Sending Each Symbol
%And If We Consider Eb=1J As In CA#3 So Es = LogM * Eb
% So Es = 2J ;
Es = 2;
Etha = Es./SNR_normal;

AWGN =sqrt(Etha ./2).*randn(size(transmitted_signal));

received_signal=transmitted_signal+AWGN;
%Sampling

T_sampling = 6*L+1:L:(N+6-1)*L+1;
samples = zeros(length(T_sampling),11);
for i=1:length(T_sampling)
   samples(i,:) = received_signal(T_sampling(i),:);
end
detected_symbols=zeros (size(samples));
if flag==1
    %ML
%(-Inf,-2)___(-3)
%  [-2,0) ___(-1)
%  [0,2)  ___(1)
%[2,Inf)  ___(3)
for i=1:1:11
    for j=1:1:length(T_sampling)
        if samples(j,i)< -2
           detected_symbols(j,i)=-3;
        elseif samples(j,i)< 0
            detected_symbols(j,i)=-1;
        elseif samples(j,i)< 2
            detected_symbols(j,i)=1;
        else
            detected_symbols(j,i)=3;
        end
    end
end

elseif flag==0
    %MAP
%(-Inf,-N0ln2-2)___(-3)
%  [-N0ln2-2,0) ___(-1)
%  [0,N0ln2+2)  ___(1)
%[N0ln2+2,Inf)  ___(3)
D_3 = Etha * log(2) + 2;
D_2 = 0;
D_1 = (-1)*D_3 ;
for i=1:1:11
    for j=1:1:length(T_sampling)
        if samples(j,i)< D_1
           detected_symbols(j,i)=-3;
        elseif samples(j,i)< D_2
            detected_symbols(j,i)=-1;
        elseif samples(j,i)< D_3
            detected_symbols(j,i)=1;
        else
            detected_symbols(j,i)=3;
        end
    end
end
end
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