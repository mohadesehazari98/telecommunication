function [ y ] = F( t )
%This function is used to set our function 0 in +-1
y = zeros(size(t));
for i=1:1:length(t)
    if t(i)==1/2
        y(i)=pi/4;
    elseif t(i)==-1/2
        y(i)=-pi/4;
    else
      y(i) = cos((pi *t(i)))  / (1- (2*t(i)) ^2) ;  
    end
end



end

