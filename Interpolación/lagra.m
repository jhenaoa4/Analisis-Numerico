function [C] = lagra(X,Y)
n1=length(X);
n=n1-1;
syms x;
pol=0;
for k=1 : n+1
    v=1;
    for j=1:n+1
        if j~=k
            v= v*((x - X(j)/(X(k)-X(j))));
        end
    end
    pol= pol +v*Y(k);
    expand(v)% imprime los Li 
end
px=expand(pol);
    %pol 
    px
end