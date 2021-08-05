function [ xc ] = AM( xm,t,Ac,mu,fc )
%Amplitude modulation
xc = (Ac * (1 +( mu * xm))) .* cos((2 * pi * fc) .* t);
end

