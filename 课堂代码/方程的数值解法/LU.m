function[L, U] = LU(a)
[n, m]=size(a);
L=eye(n); U=zeros(n);
for k=1:n
    for j=k:n
        z=0;
        for q=1:k-1
            z=z+L(k, q)*U(q,j);
        end 
        U(k, j)=a(k, j)-z;
    end
    if abs(U(k, k))<1e-6
       return;
    end
    for i=k+1:n
        z=0;
        for q=1:k-1
            z=z+L(i, q)*U(q,k);
        end
        L(i, k)=(a(i, k)-z)/U(k, k);
    end 
end
