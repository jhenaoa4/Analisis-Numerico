function y = puntoFijo(tol,x0,nMax)
f = @(x) log((sin(x))^2 +1)- 1/2 -x;
g = @(x) log((sin(x))^2 +1)- 1/2 ;
fx0 = f(x0);
i = 0;
error = tol + 1;
vecX=[x0];
vecFx=[fx0];
vecErr=[error];
while fx0 ~= 0 && error > tol && i < nMax
    xn = g(x0);
    fx0 = f(xn);
    error = abs((xn-x0)/xn);
    x0 = xn;
    i = i+1;
    vecX(i)=[x0];
    vecFx(i)=[fx0];
    vecErr(i)=[error];
end
if fx0 == 0 
    disp(x0)
    disp('es raíz')
else if error < tol
        disp(x0)
        disp('es una aproximación a la raíz')
    else 
        disp('el metodo fracasó')
    end
end
vecX
vecFx
vecErr
end
