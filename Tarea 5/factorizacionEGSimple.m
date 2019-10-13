function factorizacionEGSimple(A,n)
for k=0:n-1
    A = EGSimple(A,n,k)
    for i=k+1:n
        A(i,k)=A(i,k)/A(k,k);
        for j=k+1:n+1
            A(i,j)=A(i,j)-A(i,k)*A(k,j);
        end
    end
end
y = A
end