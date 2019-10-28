function [C] = lagra(X,Y)
n1=length(X);
n=n1-1;
syms x;
pol=0;
pol2=0;
for k=1 : n+1
    pol2=0;
    v=1;
    v1=1;
    v2=1;
    for j=1:n+1
        if j~=k
            v= v*((x - X(j)/(X(k)-X(j))));
            v1=v1*(x-X(j));
            v2=v2*(X(k)-X(j));
        end
    end
    expand(v1);
    expand(v);
    pol= pol + (Y(k)*v);
    pol2=pol2 +(v1/v2);
    expand(pol2)
    
end
px=expand(pol);
    %pol 
 %C=px
 expand(pol2);
 pol2;
end