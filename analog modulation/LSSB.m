function [ xc ] = LSSB( Ac,xm,t,fc )
%Lower single side band modulation
xc = (Ac/2) * ((xm .* cos((2*pi)*fc .*t))+((imag(hilbert(xm)) .* sin((2*pi)*fc .*t))));
end