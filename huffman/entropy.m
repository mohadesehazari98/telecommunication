function [ G_k] = entropy( Pij,k )
%This function will find the rate of our entropy
P_T=Pij.';
P_T(length(Pij),:)= ones(1,length(Pij));
%Transpose of transition_states
X=sym('x',[length(Pij) 1]);
Y=X;
Y(length(Pij),:)=1;
%solving the matrix equation
eq=P_T*X==Y;
solx=solve(eq,X);
Result =struct2cell(solx);
%P(i),Probability of states
P=zeros(length(Pij),1);
for i=1:length(Pij)
    P(i)=Result{i};
end
%H(S1)
H_S1 = -sum(P .* log2(P));
%H(S1|S2)
H = zeros(length(Pij),1);
H_S2 = 0;
for i=1:length(Pij)
    Dummy=Pij(i,:);
    H(i) = -sum(Dummy .* log2(Dummy));
    H_S2 = H_S2 +(H(i)*P(i));
end
%G_k = (H(S1)+(k-1)H(S1|S2))/k
G_k = ((H_S1)+((k-1)*(H_S2)))/k;
end

