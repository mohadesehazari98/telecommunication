function [ avglen ] = average_length1( chain,k )
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
    symbols(i,1)=i;
end
P=ones(ceil(length(chain)/k),1);

for i=1:ceil(length(chain)/k)
    for j=2:k+1
       if symbols(i,j)==1
           P(i)=P(i)*P_1;
       elseif symbols(i,j)==0
           P(i)=P(i)*P_0;
       else
           P(i)=P(i);
       end
    end
end
[dict,avglen] = huffmandict(symbols(:,1),P);

end

