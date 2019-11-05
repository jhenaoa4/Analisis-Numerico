function y=LUparcial(A,b,n)
Ab= [A,b];
L=eye(n);
U=zeros(n);
P=eye(n);
for k=1: n
    [Ab, P]= pivoteoParcial(Ab,n,k,P);
    for i=k+1: n
       L(i,k) = Ab(i,k)/Ab(k,k);
       for j= k :n+1
           Ab(i,j)= Ab(i,j)- (L(i,k)*Ab(k,j));
       end
    end
    U(1:k+1,1:n)=Ab(1:k+1,1:n);
    Ab(1:n,1:n)
    L
    U
    P
end
end

function [y,z] =pivoteoParcial(Ab , n , k, P)
numMayor = abs(Ab(k,k));
filMayor = k;
for s=k+1:n
   if  abs(Ab(s,k)) > numMayor
       numMayor = abs(Ab(s,k));
       filMayor = s;
   end
end
if numMayor == 0 
    disp("EL SISTEMA NO TIENE SOLUCIÓN ÚNICA");
else
    if filMayor ~= k 
        Ab=InterFil(Ab , filMayor , k);
        P=InterFil(P , filMayor , k);
    end
    y=Ab;
    z=P;
end

end

function g=InterFil(A,f1 , f2)
aux=A;
aux(f1,:)=A(f2,:);
aux(f2,:)=A(f1,:);
g=aux;
end