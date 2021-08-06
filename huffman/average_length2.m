function [ avglen ] = average_length2(chain,k )
%Another way for calculating the probability of our samples
%   
%This function will calculate the average length of coded chain
%
P_1= sum(chain>0)/length(chain);
P_0= 1 - P_1;
symbols=zeros(ceil(length(chain)/k),k+1);
for i=1:ceil(length(chain)/k)
    if (k*i)<=length(chain)
        symbols(i,2:k+1)=chain(1,(k*i)-k+1:k*i);
    elseif (k*i)>length(chain)
        x=(k+1)-((k*i)-length(chain));
        symbols(i,2:x)=chain(1,(k*(i-1))+1:length(chain));
        symbols(i,x+1:k+1)=2;
    end
    symbols(i,1)=1;
end

for i=1:ceil(length(chain)/k)
    if symbols(i,1)~= 0
       for m=i+1:ceil(length(chain)/k)
           if symbols(m,1)~=0
               if symbols(i,2:k+1)==symbols(m,2:k+1)
                   symbols(i,1)=symbols(i,1)+1;
                   symbols(m,1)=0;
               end
           end
       end
    end
end
P=zeros(1,2);
j=0;
for i=1:ceil(length(chain)/k)
    if symbols(i,1)~=0
        j=j+1;
        P(j,2)=symbols(i,1)/n;
        P(j,1)=j;
    end
end
[dict,avglen] = huffmandict(P(:,1),P(:,2));

end

