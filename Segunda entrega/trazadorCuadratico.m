function trazadorCuadratico(x,y)
N   = length(x)-1;
V   = [0;zeros(2*N,1);zeros(N-1,1)];
Z   = zeros(length(V),length(V));
j=1;
f=1;
for i=2:2:2*N    
    Z(i,f:f+2) =   [x(j)^2 x(j) 1];
    V(i) =   y(j);
    j =   j+1;
    Z(i+1,f:f+2) =   [x(j)^2 x(j) 1];  
    V(i+1) =   y(j);
    f =   f+3;
end

j=1;
l=2;
for i=2*N+2:3*N
    
    Z(i,j:j+1)=   [2*x(l) 1];
    Z(i,j+3:j+4) =   [-2*x(l) -1];
    j =   j+3;
    l =   l+1;
end

Z(1,1)=1;
Coeff = Z\V;
    j=1;
    fprintf("X^2  X  1");
    fprintf('\n', "");
    for n=1:length(Coeff)
        a=Coeff(n,1);
        if mod(n,3)==1 && n>1
           fprintf('\n', ""); 
        end
        fprintf('%f \t', a);
    end
    for i=1:N
            hold on
            xi=x(1,i):0.01:x(1,i+1);
            yi=Coeff(j)*xi.^2+Coeff(j+1)*xi+Coeff(j+2);
            j=j+3;
         plot(xi,yi,'b');
    end
    fprintf('\n', "");
end