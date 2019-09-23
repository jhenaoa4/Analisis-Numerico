function y = EGSimple(A, b, n)
aux=A;
aux(:,n+1)=b;
Ab = aux;
% Ab= [A,b]
for k=1:n-1
    for i=k+1:n
        if Ab(k,k) == 0 && k<n
                 Ab=InterFil(Ab,k,k+1)
        else
            mult=Ab(i,k)/Ab(k,k);
            for j=k:n+1
                Ab(i,j)= Ab(i,j)-mult*Ab(k,j)
            end
       end
    end
end
y = Ab;
end


function g=InterFil(A,f1 , f2)
aux=A;
aux(f1,:)=A(f2,:);
aux(f2,:)=A(f1,:);
g=aux;
end