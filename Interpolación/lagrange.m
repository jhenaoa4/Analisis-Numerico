function [C,L] = lagrange(x,y)%x y son vectores de puntos ordenados
n1=length(x);
n=n1-1; %GRADO A LO SUMO n DEL POLINOMIO
L=zeros(n1,n1);
for k=1:n+1 %n+1 para leer todos los puntos del vector 
    v=1;
    for j=1:n+1
        if k~=j
            v=conv(v,poly(x(j)))/(x(k)-x(j));
        end
    end
    L(k,:)=v;
end
C=y*L
%L
end