function y = puntoFijo(tol,x0,nMax)
f = @(x) x*exp(x)-x^2-5*x-3;
g = @(x) (x*exp(x)-x^2-3)/5;
fx0 = f(x0);
i = 0;
error = tol + 1;
while fx0 ~= 0 && error > tol && i < nMax
    xn = g(x0);
    fx0 = f(xn);
    error = abs((xn-x0)/xn);
    x0 = xn;
    i = i+1;
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
end
