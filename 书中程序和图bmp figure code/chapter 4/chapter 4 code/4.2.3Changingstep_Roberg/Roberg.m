function [I,step]=Roberg(f,a,b,eps)
M = 1; tol=10;
k = 0;
T = zeros(1,1);
h = b-a;
T(1,1)=(h/2)*(f(a)+f(b));
while tol > eps
    k=k+1;
    h=h/2;
    Q=0;
    for i=1:M
        x=a+h*(2*i-1);
        Q=Q+f(x);
    end
    T(k+1,1)=T(k,1)/2+h*Q;
    M=2*M;
    for j=1:k
        T(k+1,j+1)=T(k+1,j)+(T(k+1,j)-T(k,j))/(4^j-1);
    end
    tol=abs(T(k+1,j+1)-T(k,j));
end
I=T(k+1,k+1);
step=k;
