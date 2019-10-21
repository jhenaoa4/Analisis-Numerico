function [x] = Vandermonde(nropuntos,x,y)
%nro es el numero d epuntos, x es un vector de xi y y un vector de yi
yi= y';
mat=zeros(nropuntos);

%%Construir el sistema
for i=1:nropuntos
    for j=1:nropuntos
       mat(i,j)=(x(i))^(nropuntos-j);
    end
end

%%resolver
x= EGPivoteoTotal(mat,yi,nropuntos);
end
