function [tabla]= NewtonG(x0,tol,niter)
syms x;
f= @(x)  1 - (cos(x))^2 + x^2;
%iteración x f(x) error
fx= f(x0);
%df=@(x) 2*;
df= matlabFunction(diff(f(x)));
dfx=df(x0);
contador=0;
error= tol+1;

while (error>tol) && (fx~=0) && (contador<niter)
    x1 = x0 - (fx/dfx);
    fx= f(x1);
    dfx= df(x1);
    error = abs(x1-x0);
    x0=x1;
    contador= contador+1;
    tabla(contador,1)=contador;
    tabla(contador,2)=x0;
    tabla(contador,3)=f(x0);
    tabla(contador,4)=error;
end

if fx==0
    fprintf('%i es raiz',x0);
elseif error<tol 
   fprintf('%i es aproximación a una raíz con una tolerancia de %i', x1,tol);
elseif dfx == 0
     fprintf('%i es una posible raíz múltiple',x1);
else 
    fprintf('fracasó el número de iteraciones');
end
end