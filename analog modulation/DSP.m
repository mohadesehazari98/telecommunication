function [ xc ] = DSP( Ac,xm,t,fc )
% This is a DSP modulation function
xc = Ac .*(xm) .* (cos((2*pi).*fc.*t));
end