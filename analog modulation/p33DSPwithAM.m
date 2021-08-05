function [ xc ] = p33DSPwithAM( Ac,xm,t,mu,fc )
%This function is a modulation of DSP with AM modulation
y1 = AM(0.5 .* xm,t,Ac,mu,fc);
y2 = AM(((-1) * 0.5) .* xm,t,Ac,mu,fc);
xc = y1 - y2;
end