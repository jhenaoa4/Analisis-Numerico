function Newton(x0,tol,niter)
syms x;
f= @(x) log((sin(x))^2 + 1)-1/2;
fx= f(x0);
df= matlabFunction(diff(f(x)));
dfx=df(x0);
contador=0;
error= tol+1;
vecX=[x0];
vecFx=[fx];
vecErr=[error];
while (error>tol) && (fx~=0) && (contador<niter)
    x1 = x0 - (fx/dfx);
    fx= f(x1);
    dfx= df(x1);
    error = abs(x1-x0);
    x0=x1;
    contador= contador+1;
    vecX(contador)=[x0];
    vecFx(contador)=[fx];
    vecErr(contador)=[error];
end

if fx==0
    vecX
    vecFx
    vecErr
elseif error<tol
    vecX
    vecFx
    vecErr
   fprintf('%i es aproximación a una raíz con una tolerancia de %i', x1,tol);
elseif dfx == 0
     disp('%i es una posible raíz múltiple',x1);
     vecX
     vecFx
     vecErr
else 
    disp('fracasó el número de iteraciones');
end
