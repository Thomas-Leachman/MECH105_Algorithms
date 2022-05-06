function [L, U, P] = LUFactor(A)
% luFactor(A)
%	LU decomposition with pivotiing
% inputs:
%	A = coefficient matrix
% outputs:
%	L = lower triangular matrix
%	U = upper triangular matrix
%       P = the permutation matrix
[n,n]=size(A);
L=eye(n); P=L; U=A;
for k=1:n
    [pivot m]=max(abs(U(k:n,k)));
    m=m+k-1;
    if m~=k        
        Y=U(k,:);
        U(k,:)=U(m,:);
        U(m,:)=Y;     
        Y=P(k,:);
        P(k,:)=P(m,:);
        P(m,:)=Y;
        if k >= 2
            Y=L(k,1:k-1);
            L(k,1:k-1)=L(m,1:k-1);
            L(m,1:k-1)=Y;
        end
    end
    for j=k+1:n
        L(j,k)=U(j,k)/U(k,k);
        U(j,:)=U(j,:)-L(j,k)*U(k,:);
      
    end
      
end

end
