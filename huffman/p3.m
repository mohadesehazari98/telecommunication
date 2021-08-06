Pij=[0.1 0.9;0.8 0.2];
k=ones(12,1);
G_k=zeros(12,1);
for i=1:12
   G_k(i,:)=entropy( Pij,k(i));
   if i<12
    k(i+1)=k(i)+1;
   end
end
plot(k,G_k)
%%
n=10000000;
chain = randi([0, 1], [1, n]);
avglen=zeros(12,1);
for i=1:12
   avglen(i,:)=average_length( chain,k(i));
end

hold on 
plot(k,avglen)
%%
%part 4
P=[0.6;0.3;0.1];
S=[1;2;3];
[dict4,avglen4] = huffmandict(S,P);

