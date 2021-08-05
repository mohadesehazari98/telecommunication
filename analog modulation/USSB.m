function [ xc ] = USSB( Ac,xm,t,fc )
%Uper single side band modulation
xc = (Ac/2) * ((xm .* cos((2*pi)*fc .*t))-((imag(hilbert(xm)) .* sin((2*pi)*fc .*t))));
end

