function [C,L] = lagrange(x,y)%x y son vectores de puntos ordenados
n1=length(x);
n=n1-1; %GRADO A LO SUMO n DEL POLINOMIO
L=sym(n1);
syms p;
for k=1:n+1 %n+1 para leer todos los puntos del vector 
    v=1;
    for j=1:n+1
        if k~=j
            v=v*((p - x(j))/(x(k)- x(j)));
            v=expand(v);
        end
        j=j+1;
    end
    L(k)=v;
    L(k)
    k=k+1;
end
%C=y*L
%L
end