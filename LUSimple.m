function y = LUSimple(A, b, n)
aux=A;
aux(:,n+1)=b;
Ab = aux;
L=eye(n);
U=zeros(n);
for k=1:n-1
    for i=k+1:n
        L(i,k)=Ab(i,k)/Ab(k,k);
        for j=k:n+1
            Ab(i,j)=Ab(i,j)-L(i,k)*Ab(k,j);
        end
    end
    U(1:k+1,1:n)=Ab(1:k+1,1:n);
    Ab(1:n,1:n)
    L
    U
end
y = Ab
end