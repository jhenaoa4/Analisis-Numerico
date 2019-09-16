function y = EGSimple(A, b, n)
aux=A;
aux(:,n+1)=b;
Ab = aux;
for k=1:n-1
    for i=k+1:n
        mult=Ab(i,k)/Ab(k,k);
        for j=k:n+1
            Ab(i,j)=Ab(i,j)-mult*Ab(k,j);
        end
    end
end
y = Ab;
end